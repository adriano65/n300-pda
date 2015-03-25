/*linux/drivers/video/n311fb.c -- Acer N311 Simple Frame Buffer device
 *
 *      Copyright (C) 2008 Vladimir Chernichkin
 *
 *      Based on Virtual Frame Buffer device
 *
 *      Copyright (C) 2002 James Simmons
 *
 *      Copyright (C) 1997 Geert Uytterhoeven
 *
 *  This file is subject to the terms and conditions of the GNU General Public
 *  License. See the file COPYING in the main directory of this archive for
 *  more details.
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/string.h>
#include <linux/mm.h>
#include <linux/slab.h>
#include <linux/vmalloc.h>
#include <linux/delay.h>
#include <linux/interrupt.h>
#include <linux/platform_device.h>
#include <linux/fb.h>
#include <linux/init.h>
#include <linux/ioctl.h>
#include <linux/uaccess.h>

#include <asm/io.h>
#include <asm/arch-s3c2410/n300.h>

#undef N311_DEBUG
//#define N311_DEBUG
#ifdef N311_DEBUG
#define DBG(x...) printk(KERN_INFO x)
#else
#define DBG(x...)
#endif
    /*
     *  RAM we reserve for the frame buffer. This defines the maximum screen
     *  size
     *
     *  The default can be overridden if the driver is compiled as a module
     */

#define VIDEOMEMSIZE	(2*480*640)	/* 600 KB */
#define VIDEOMEMSTART 0x20020000	/* Obtained with HaRET*/
static void *videomemory;
static u_long videomemorysize = VIDEOMEMSIZE;
module_param(videomemorysize, ulong, 0);

static struct fb_var_screeninfo n311fb_default __initdata = {
	
	.xres =		480,
	.yres =		640,
	.xres_virtual =	480,
	.yres_virtual =	640,
	.bits_per_pixel	= 16,
	.red =		{ 11, 5, 0 },
      	.green =	{ 5, 6, 0 },
      	.blue =		{ 0, 5, 0 },
	.height		= -1,
	.width		= -1,
	.accel_flags	= FB_ACCEL_NONE,
	.pixclock	= 60000,
	.left_margin	= 0,
	.right_margin	= 0,
	.upper_margin	= 0,
	.lower_margin	= 0,
	.hsync_len	= 0,
	.vsync_len	= 0,
	.vmode		= FB_VMODE_NONINTERLACED|FB_VMODE_YWRAP|FB_VMODE_CONUPDATE , 
};

static struct fb_fix_screeninfo n311fb_fix __initdata = {
	.id =		"N311 FB",
	.type =		FB_TYPE_PACKED_PIXELS,
	.visual =	FB_VISUAL_TRUECOLOR,
	.xpanstep =	0,
	.ypanstep = 	0,
	.ywrapstep = 	0,
	.line_length =	960,
	.accel =	FB_ACCEL_NONE,
	.smem_start =	VIDEOMEMSTART,
	.smem_len = 	VIDEOMEMSIZE,
};

struct fb_videomode n311mode_default __initdata = {
       
	.xres=480,
	.yres=640,
	.pixclock=60000,
	.left_margin=0,
	.right_margin=0,
	.upper_margin=0,
	.lower_margin=0,
	.hsync_len=0,
	.vsync_len=0,
	.sync=0,
	.vmode=0,
};


static int n311fb_enable __initdata = 1;
module_param(n311fb_enable, bool, 0);

static int n311fb_check_var(struct fb_var_screeninfo *var,
			 struct fb_info *info);
static int n311fb_set_par(struct fb_info *info);
static int n311fb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
			 u_int transp, struct fb_info *info);
static int n311fb_blank(int blank, struct fb_info *info);

static int n311_get_vblank(struct fb_vblank *vblank)
{
	memset(vblank, 0, sizeof(*vblank));
	vblank->flags = FB_VBLANK_HAVE_VSYNC;
	return 0;
}
    /*
     * ioctl
     */

int wasOn=1;
static int n311_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg) {
	void __user *argp = (void __user *)arg;
	u32 val;
	int retval = -EFAULT;

	DBG("n311_ioctl %ux %lx", cmd, arg);
	switch (cmd) {
	case FBIOGET_VBLANK:
		{
			struct fb_vblank vblank;
			dev_dbg(info->device, "FBIOGET_VBLANK:\n");
			retval = n311_get_vblank(&vblank);
			if (retval)	break;
			if (copy_to_user(argp, &vblank, sizeof(vblank)))
				retval = -EFAULT;
			break;
		}
	case FB_BLANK_UNBLANK:
		retval=n300_backlight_power(!wasOn);
		wasOn=!wasOn;
		break;

	default:
		retval = -ENOIOCTLCMD;
		break;
	}
	return retval;
}

static struct fb_ops n311fb_ops = {
	
	.fb_check_var	= n311fb_check_var,
	.fb_set_par	= n311fb_set_par,
	.fb_setcolreg	= n311fb_setcolreg,
	.fb_fillrect	= cfb_fillrect,
	.fb_copyarea	= cfb_copyarea,
	.fb_imageblit	= cfb_imageblit,
	.fb_blank       = n311fb_blank,
	.fb_ioctl	= n311_ioctl,
	.fb_compat_ioctl = n311_ioctl
};

    /*
     *  Internal routines
     */

static u_long get_line_length(int xres_virtual, int bpp)
{
	u_long length;

	length = xres_virtual * bpp;
	length = (length + 31) & ~31;
	length >>= 3;
	return (length);
}

    /*
     *  Setting the video mode has been split into two parts.
     *  First part, xxxfb_check_var, must not write anything
     *  to hardware, it should only verify and adjust var.
     *  This means it doesn't alter par but it does use hardware
     *  data from it to check this var. 
     */

static int n311fb_check_var(struct fb_var_screeninfo *var,
			 struct fb_info *info)
{
	/*
	int memlen, vramlen;
	int pitch, err = 0;
	printk("\nn311fb: entered n311fb_check_var with xres_virtual %d,yres_virtual %d, %dbpp\n",
				       var->xres_virtual,
				       var->yres_virtual, var->bits_per_pixel);
	*/
	var->transp.offset = 0;
	var->transp.length = 0;
	info->var.xres=480;
	info->var.yres=640;
	info->var.bits_per_pixel = 16;
	info->var.height = -1;
	info->var.width	= -1;
	info->var.accel_flags = FB_ACCEL_NONE;
	info->var.pixclock=60000;
	info->var.left_margin=0;
	info->var.right_margin=0;
	info->var.upper_margin=0;
	info->var.lower_margin=0;
	info->var.hsync_len=0;
	info->var.vsync_len=0;
	info->var.sync=0;
	info->var.vmode=0;
	return 0;
}

/* This routine actually sets the video mode. It's in here where we
 * the hardware state info->par and fix which can be affected by the 
 * change in par. For this driver it doesn't do much. 
 */
static int n311fb_set_par(struct fb_info *info)
{
	/*
	printk("\nn311fb: entered n311fb_set_par with xres_virtual %d,yres_virtual %d, %dbpp\n",
				       info->var.xres_virtual,
				       info->var.yres_virtual, info->var.bits_per_pixel);
	*/
	info->fix.line_length = get_line_length(info->var.xres_virtual,	info->var.bits_per_pixel);
	return 0;
}

    /*
     *  Set a single color register. The values supplied are already
     *  rounded down to the hardware's capabilities (according to the
     *  entries in the var structure). Return != 0 for invalid regno.
     */

static int n311fb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
			 u_int transp, struct fb_info *info)
{
	if (regno >= 256) /* no. of hw registers */
		return 1;
	/*
	 * Program hardware... do anything you want with transp
	 */

	/* grayscale works only partially under directcolor */
	/* grayscale = 0.30*R + 0.59*G + 0.11*B */
	if (info->var.grayscale) {red = green = blue =(red * 77 + green * 151 + blue * 28) >> 8;}

	/* Directcolor:
	 *   var->{color}.offset contains start of bitfield
	 *   var->{color}.length contains length of bitfield
	 *   {hardwarespecific} contains width of RAMDAC
	 *   cmap[X] is programmed to (X << red.offset) | (X << green.offset) | (X << blue.offset)
	 *   RAMDAC[X] is programmed to (red, green, blue)
	 * 
	 * Pseudocolor:
	 *    uses offset = 0 && length = RAMDAC register width.
	 *    var->{color}.offset is 0
	 *    var->{color}.length contains widht of DAC
	 *    cmap is not used
	 *    RAMDAC[X] is programmed to (red, green, blue)
	 * Truecolor:
	 *    does not use DAC. Usually 3 are present.
	 *    var->{color}.offset contains start of bitfield
	 *    var->{color}.length contains length of bitfield
	 *    cmap is programmed to (red << red.offset) | (green << green.offset) |
	 *                      (blue << blue.offset) | (transp << transp.offset)
	 *    RAMDAC does not exist
	 */
#define CNVT_TOHW(val,width) ((((val)<<(width))+0x7FFF-(val))>>16)
	switch (info->fix.visual) {
	case FB_VISUAL_TRUECOLOR:
	case FB_VISUAL_PSEUDOCOLOR:
		red = CNVT_TOHW(red, info->var.red.length);
		green = CNVT_TOHW(green, info->var.green.length);
		blue = CNVT_TOHW(blue, info->var.blue.length);
		transp = CNVT_TOHW(transp, info->var.transp.length);
		break;
	case FB_VISUAL_DIRECTCOLOR:
		red = CNVT_TOHW(red, 8);	/* expect 8 bit DAC */
		green = CNVT_TOHW(green, 8);
		blue = CNVT_TOHW(blue, 8);
		/* hey, there is bug in transp handling... */
		transp = CNVT_TOHW(transp, 8);
		break;
	}
#undef CNVT_TOHW
	/* Truecolor has hardware independent palette */
	if (info->fix.visual == FB_VISUAL_TRUECOLOR) {
		u32 v;
		
		if (regno >= 16)
			return 1;

		v = (red << info->var.red.offset) |
		    (green << info->var.green.offset) |
		    (blue << info->var.blue.offset) |
		    (transp << info->var.transp.offset);
		
		switch (info->var.bits_per_pixel) {
		case 8:
			break;
		case 16:
			((u32 *) (info->pseudo_palette))[regno] = v;
			break;
		case 24:
		case 32:
			((u32 *) (info->pseudo_palette))[regno] = v;
			break;
		}
		return 0;
	}
	return 0;
}

static int n311fb_blank(int blank, struct fb_info *info) {
  //struct n311_par *par = info->par;

  switch (blank) {
	case FB_BLANK_UNBLANK:
	  n300_backlight_power(1);
	  break;
	case FB_BLANK_POWERDOWN:
	case FB_BLANK_VSYNC_SUSPEND:
	case FB_BLANK_HSYNC_SUSPEND:
	case FB_BLANK_NORMAL:
	  n300_backlight_power(0);
	  break;

	default:
	  DBG("unmanaged blank value %ux\n", blank);
	  break;
	  }
	return 0;
}


#ifndef MODULE
static int __init n311fb_setup(char *options)
{
	char *this_opt;

	n311fb_enable = 1;

	if (!options || !*options)
		return 1;

	while ((this_opt = strsep(&options, ",")) != NULL) {
		if (!*this_opt)
			continue;
		if (!strncmp(this_opt, "disable", 7))
			n311fb_enable = 0;
	}
	return 1;
}
#endif  /*  MODULE  */

    /*
     *  Initialisation
     */

static int __init n311fb_probe(struct platform_device *dev) {
	struct fb_info *info;
	int retval = -ENOMEM;
	
	info = framebuffer_alloc(sizeof(u32) * 256, &dev->dev);
	if (!info)
		goto err;

	if (!request_mem_region(VIDEOMEMSTART, videomemorysize,	"n311fb")) {
		printk(KERN_INFO"n311fb: cannot get framebuffer\n");
		goto err2;
	}
	


	info->screen_base = ioremap(VIDEOMEMSTART,videomemorysize);
	
	info->fbops = &n311fb_ops;
	info->var = n311fb_default;
		
	info->fix = n311fb_fix;
	info->pseudo_palette = info->par;
	info->par = NULL;
	info->flags = FBINFO_MISC_ALWAYS_SETPAR|FBINFO_READS_FAST|FBINFO_HWACCEL_NONE|FBINFO_FLAG_DEFAULT;
	info->mode=&n311mode_default;
	retval = fb_alloc_cmap(&info->cmap, 256, 0);
	if (retval < 0)
		goto err1;

	retval = register_framebuffer(info);
	if (retval < 0)
		goto err2;
	platform_set_drvdata(dev, info);

	printk(KERN_INFO
	       "fb%d: n311 frame buffer device, using %ldK of video memory\n",
	       info->node, videomemorysize >> 10);


	return 0;
err2:
	fb_dealloc_cmap(&info->cmap);
err1:
	framebuffer_release(info); 
	release_mem_region(VIDEOMEMSTART, videomemorysize);
err:
	iounmap(videomemory);
	return retval;
}

static int n311fb_remove(struct platform_device *dev)
{
	struct fb_info *info = platform_get_drvdata(dev);

	if (info) {
		unregister_framebuffer(info);
		iounmap(videomemory);
		release_mem_region(VIDEOMEMSTART, videomemorysize);
		framebuffer_release(info);
	}
	return 0;
}

#ifdef CONFIG_PM

static void n311fb_suspend(struct platform_device *dev, pm_message_t state) {
	struct fb_info	   *fbinfo = platform_get_drvdata(dev);

	n300_backlight_power(0);
}

static void n311fb_resume(struct platform_device *dev) {
	struct fb_info	   *fbinfo = platform_get_drvdata(dev);
	n300_backlight_power(1);
}
#else
#define n311fb_suspend NULL
#define n311fb_resume NULL
#endif /* CONFIG_PM */

static struct platform_driver n311fb_driver = {
	.probe	= n311fb_probe,
	.remove = n311fb_remove,
	.suspend = n311fb_suspend,
	.resume = n311fb_resume,
	.driver = {
		.name	= "n311fb",
	},
};

static struct platform_device *n311fb_device;

static int __init n311fb_init(void)
{
	int ret = 0;

#ifndef MODULE
	char *option = NULL;

	if (fb_get_options("n311fb", &option))
		return -ENODEV;
	n311fb_setup(option);
#endif

	if (!n311fb_enable)
		return -ENXIO;

	ret = platform_driver_register(&n311fb_driver);

	if (!ret) {
		n311fb_device = platform_device_alloc("n311fb", 0);

		if (n311fb_device)
			ret = platform_device_add(n311fb_device);
		else
			ret = -ENOMEM;

		if (ret) {
			platform_device_put(n311fb_device);
			platform_driver_unregister(&n311fb_driver);
		}
	}

	return ret;
}

module_init(n311fb_init);

#ifdef MODULE
static void __exit n311fb_exit(void)
{
	platform_device_unregister(n311fb_device);
	platform_driver_unregister(&n311fb_driver);
}

module_exit(n311fb_exit);

MODULE_LICENSE("GPL");
#endif				/* MODULE */
