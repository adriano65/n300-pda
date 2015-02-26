/*
 * OHCI HCD (Host Controller Driver) for USB.
 *
 * (C) Copyright 1999 Roman Weissgaerber <weissg@vienna.at>
 * (C) Copyright 2000-2002 David Brownell <dbrownell@users.sourceforge.net>
 * (C) Copyright 2002 Hewlett-Packard Company
 *
 * USB Bus Glue for Samsung S3C2410
 *
 * Written by Christopher Hoover <ch@hpl.hp.com>
 * Based on fragments of previous driver by Russell King et al.
 *
 * Modified for S3C2410 from ohci-sa1111.c, ohci-omap.c and ohci-lh7a40.c
 *	by Ben Dooks, <ben@simtec.co.uk>
 *	Copyright (C) 2004 Simtec Electronics
 *
 * Thanks to basprog@mail.ru for updates to newer kernels
 *
 * This file is licenced under the GPL.
*/

#include <linux/platform_device.h>
#include <linux/clk.h>

#include <mach/hardware.h>
#include <mach/usb-control.h>
#include <mach/regs-gpio.h>
#include <asm/arch-s3c2410/n311.h>
#include <mach/regs-irq.h>

#define valid_port(idx) ((idx) == 1 || (idx) == 2)

//#define OHCI_DEBUG
#undef OHCI_DEBUG
#ifdef OHCI_DEBUG
        #define DPRINTK(ARGS...)  printk(KERN_INFO "<%s>: ",__FUNCTION__);printk(ARGS)
        #define FN_IN printk(KERN_INFO "[%s]: start\n", __FUNCTION__)
        #define FN_OUT(n) printk(KERN_INFO "[%s]: end(%u)\n",__FUNCTION__, n)
        #define info(format, arg...)    PRINT_MSG(KMSG_MSG_LEVEL_INFORMATION, "", format...)
#else
        #define DPRINTK( x... )
        #define FN_IN
        #define FN_OUT(x)
        #define info(format, arg...)
#endif

/* clock device associated with the hcd */
static struct clk *clk;
static struct clk *usb_clk;

/* forward definitions */
static void s3c2410_hcd_oc(struct s3c2410_hcd_info *info, int port_oc);

/* conversion functions */

static struct s3c2410_hcd_info *to_s3c2410_info(struct usb_hcd *hcd)
{
	return hcd->self.controller->platform_data;
}

static int ohci_s3c2410_reset(struct usb_hcd *hcd) {
	void __iomem *HcRevisionAddr;
	void __iomem *HcControlAddr;
	void __iomem *HcCommandStatusAddr;
	void __iomem *HcFmIntervalAddr;
	unsigned int HcControlReg, HcCommandStatusReg, HcFmIntervalReg;
	struct ohci_hcd		*ohci = hcd_to_ohci (hcd);

	printk("ohci_s3c2410_reset\n");

	/*
	unsigned long		pend, mask, val;
	pend = __raw_readl(S3C2410_INTPND);
	printk("S3C2410_INTPND 0x%lx\n", pend);
	
	mask = __raw_readl(S3C2410_INTMSK);
	printk("S3C2410_INTMSK 0x%lx\n", mask);
	//mask &= ~0x04000000;						//enable ints
	mask |= 0x04000000;						//disable ints
	printk("enable S3C2410_INTMSK 0x%lx\n", mask);
	__raw_writel(mask, S3C2410_INTMSK);		//0 int is NOT masked, 1 -> int is masked
	*/
	// --------------------------------here int 42 arrives!!!!!!!!!!!!!
	/*
	pend = __raw_readl(S3C2410_INTPND);
	printk("S3C2410_INTPND 0x%lx\n", pend);
	pend &= ~0x04000000;					// clears usb host pending ints
	__raw_writel(pend, S3C2410_SRCPND);
	__raw_writel(pend, S3C2410_INTPND);
	printk("wrote 0x%lx in S3C2410_SRCPND/INTPND\n", pend);
	*/

	//if (hcd->state == HC_STATE_HALT) { printk("ohci_s3c2410_reset: hcd->state == HC_STATE_HALT\n");  }
	//else							{ printk("ohci_s3c2410_reset: hcd->state == 0x%x\n", hcd->state); }

	/*
	HcRevisionAddr=ioremap(0x49000000, 0x60);
	if(!HcRevisionAddr) {
		printk("ioremap failed\n");
		return -ENOMEM;
		}
 	else {
		HcControlAddr=HcRevisionAddr+0x04;					// 0x49000004 HcControl
		HcControlReg=__raw_readl(HcControlAddr);			// 1098.7654.3210
															// 0000.00000000
															// bit 7, 6
															// 00b: USBRESET
															// 01b: USBRESUME
															// 10b: USBOPERATIONAL
															// 11b: USBSUSPEND
															// bit 8 IR - Interrupt Routing
															// a0 = 1010.000
															// c0 = 1100.000
		printk("HcControlReg 0x%x\n", HcControlReg);

		HcCommandStatusAddr=HcRevisionAddr+0x08;
		HcCommandStatusReg=__raw_readl(HcCommandStatusAddr);
		printk("HcCommandStatusReg 0x%x\n", HcCommandStatusReg);	//
																	// 7654.3210
																	// bit 0
																	// 1: USBRESET
		HcFmIntervalAddr=HcRevisionAddr+0x34;
		HcFmIntervalReg=__raw_readl(HcFmIntervalAddr);
		printk("HcFmIntervalReg 0x%x\n", HcFmIntervalReg);
		
		printk("send HostControllerReset command\n");
		__raw_writel(HcCommandStatusReg | 0x00000001, HcCommandStatusAddr);
		msleep(10);
		__raw_writel(HcFmIntervalReg, HcFmIntervalAddr);
		HcControlReg=__raw_readl(HcControlAddr);
		printk("HcControlReg 0x%x\n", HcControlReg);	//

		//printk("ohci->regs->control == 0x%lx\n", ohci->regs->control);
		//hcd->state = HC_STATE_SUSPENDED;
		}
	iounmap(HcRevisionAddr);
	*/
	//ohci->flags |= OHCI_QUIRK_BE_MMIO;
	//ohci->flags |= OHCI_QUIRK_INITRESET;
	ohci_hcd_init(ohci);		// in ohci-mem.c
	//ohci_usb_reset(ohci);		// crash!!
	ohci_init(ohci);
	return 0;
}

static void s3c2410_start_hc(struct platform_device *dev, struct usb_hcd *hcd) {
	struct s3c2410_hcd_info *info = dev->dev.platform_data;

	DPRINTK("s3c2410_start_hc\n");

	clk_enable(usb_clk);
	mdelay(2);			/* let the bus clock stabilise */

	clk_enable(clk);

	if (info != NULL) {
		DPRINTK("info != NULL\n");
		info->hcd	= hcd;
		info->report_oc = s3c2410_hcd_oc;

		if (info->enable_oc != NULL) {
			DPRINTK("info->enable_oc != NULL\n");
			(info->enable_oc)(info, 1);
		}
	}
}

static void s3c2410_stop_hc(struct platform_device *dev) {
	struct s3c2410_hcd_info *info = dev->dev.platform_data;

	DPRINTK("s3c2410_stop_hc:\n");

	if (info != NULL) {
		info->report_oc = NULL;
		info->hcd	= NULL;

		if (info->enable_oc != NULL) {
			(info->enable_oc)(info, 0);
		}
	}

	clk_disable(clk);
	clk_disable(usb_clk);
}

/* ohci_s3c2410_hub_status_data
 *
 * update the status data from the hub with anything that
 * has been detected by our system
*/

static int
ohci_s3c2410_hub_status_data (struct usb_hcd *hcd, char *buf)
{
	struct s3c2410_hcd_info *info = to_s3c2410_info(hcd);
	struct s3c2410_hcd_port *port;
	int orig;
	int portno;

	orig  = ohci_hub_status_data (hcd, buf);

	if (info == NULL)
		return orig;

	port = &info->port[0];

	/* mark any changed port as changed */
	for (portno = 0; portno < 2; port++, portno++) {
		if (port->oc_changed == 1 && port->flags & S3C_HCDFLG_USED) {
			dev_dbg(hcd->self.controller,"oc change on port %d\n", portno);

			if (orig < 1)
				orig = 1;

			buf[0] |= 1<<(portno+1);
		}
	}

	return orig;
}

/* s3c2410_usb_set_power
 *
 * configure the power on a port, by calling the platform device
 * routine registered with the platform device
*/

static void s3c2410_usb_set_power(struct s3c2410_hcd_info *info, int port, int to) {

	DPRINTK("s3c2410_usb_set_power\n");
	if (info == NULL) {
		printk("s3c2410_usb_set_power NULL info\n");
		return;
		}

	if (info->power_control != NULL) {
		info->port[port-1].power = to;
		(info->power_control)(port-1, to);
	}
}

/* ohci_s3c2410_hub_control
 *
 * look at control requests to the hub, and see if we need
 * to take any action or over-ride the results from the
 * request.
*/

static int ohci_s3c2410_hub_control (
	struct usb_hcd	*hcd,
	u16		typeReq,
	u16		wValue,
	u16		wIndex,
	char		*buf,
	u16		wLength)
{
	struct s3c2410_hcd_info *info = to_s3c2410_info(hcd);
	struct usb_hub_descriptor *desc;
	int ret = -EINVAL;
	u32 *data = (u32 *)buf;

	dev_dbg(hcd->self.controller,"s3c2410_hub_control(%p,0x%04x,0x%04x,0x%04x,%p,%04x)\n",
		hcd, typeReq, wValue, wIndex, buf, wLength);

	/* if we are only an humble host without any special capabilities
	 * process the request straight away and exit */

	if (info == NULL) {
		ret = ohci_hub_control(hcd, typeReq, wValue,
				       wIndex, buf, wLength);
		goto out;
	}

	/* check the request to see if it needs handling */

	switch (typeReq) {
	case SetPortFeature:
		if (wValue == USB_PORT_FEAT_POWER) {
			dev_dbg(hcd->self.controller, "SetPortFeat: POWER\n");
			s3c2410_usb_set_power(info, wIndex, 1);
			goto out;
		}
		break;

	case ClearPortFeature:
		switch (wValue) {
		case USB_PORT_FEAT_C_OVER_CURRENT:
			dev_dbg(hcd->self.controller,
				"ClearPortFeature: C_OVER_CURRENT\n");

			if (valid_port(wIndex)) {
				info->port[wIndex-1].oc_changed = 0;
				info->port[wIndex-1].oc_status = 0;
			}

			goto out;

		case USB_PORT_FEAT_OVER_CURRENT:
			dev_dbg(hcd->self.controller,
				"ClearPortFeature: OVER_CURRENT\n");

			if (valid_port(wIndex)) {
				info->port[wIndex-1].oc_status = 0;
			}

			goto out;

		case USB_PORT_FEAT_POWER:
			dev_dbg(hcd->self.controller,
				"ClearPortFeature: POWER\n");

			if (valid_port(wIndex)) {
				s3c2410_usb_set_power(info, wIndex, 0);
				return 0;
			}
		}
		break;
	}

	ret = ohci_hub_control(hcd, typeReq, wValue, wIndex, buf, wLength);
	if (ret)
		goto out;

	switch (typeReq) {
	case GetHubDescriptor:

		/* update the hub's descriptor */

		desc = (struct usb_hub_descriptor *)buf;

		if (info->power_control == NULL)
			return ret;

		dev_dbg(hcd->self.controller, "wHubCharacteristics 0x%04x\n",
			desc->wHubCharacteristics);

		/* remove the old configurations for power-switching, and
		 * over-current protection, and insert our new configuration
		 */

		desc->wHubCharacteristics &= ~cpu_to_le16(HUB_CHAR_LPSM);
		desc->wHubCharacteristics |= cpu_to_le16(0x0001);

		if (info->enable_oc) {
			desc->wHubCharacteristics &= ~cpu_to_le16(HUB_CHAR_OCPM);
			desc->wHubCharacteristics |=  cpu_to_le16(0x0008|0x0001);
		}

		dev_dbg(hcd->self.controller, "wHubCharacteristics after 0x%04x\n",
			desc->wHubCharacteristics);

		return ret;

	case GetPortStatus:
		/* check port status */

		dev_dbg(hcd->self.controller, "GetPortStatus(%d)\n", wIndex);

		if (valid_port(wIndex)) {
			if (info->port[wIndex-1].oc_changed) {
				*data |= cpu_to_le32(RH_PS_OCIC);
			}

			if (info->port[wIndex-1].oc_status) {
				*data |= cpu_to_le32(RH_PS_POCI);
			}
		}
	}

 out:
	return ret;
}

/* s3c2410_hcd_oc
 *
 * handle an over-current report
*/

static void s3c2410_hcd_oc(struct s3c2410_hcd_info *info, int port_oc) {
	struct s3c2410_hcd_port *port;
	struct usb_hcd *hcd;
	unsigned long flags;
	int portno;

	DPRINTK("s3c2410_hcd_oc\n");
	if (info == NULL)
		return;

	port = &info->port[0];
	hcd = info->hcd;

	local_irq_save(flags);

	for (portno = 0; portno < 2; port++, portno++) {
		if (port_oc & (1<<portno) && port->flags & S3C_HCDFLG_USED) {
			port->oc_status = 1;
			port->oc_changed = 1;

			/* ok, once over-current is detected,
			   the port needs to be powered down */
			s3c2410_usb_set_power(info, portno+1, 0);
		}
	}

	local_irq_restore(flags);
}

/* switching of USB pads */
static ssize_t show_usb_mode(struct device *dev, struct device_attribute *attr, char *buf) {
	if (__raw_readl(S3C24XX_MISCCR) & S3C2410_MISCCR_USBHOST)
		return sprintf(buf, "host\n");

	return sprintf(buf, "device\n");
}

static ssize_t set_usb_mode(struct device *dev, struct device_attribute *attr,
			    const char *buf, size_t count)
{
	if (!strncmp(buf, "host", 4)) {
		printk("s3c2410: changing usb to host\n");
		s3c2410_modify_misccr(S3C2410_MISCCR_USBHOST, S3C2410_MISCCR_USBHOST);
		n311_udc_pullup(S3C2410_UDC_P_DISABLE);
	} else if (!strncmp(buf, "device", 6)) {
		printk("s3c2410: changing usb to device\n");
		s3c2410_modify_misccr(S3C2410_MISCCR_USBHOST, 0);
		n311_udc_pullup(S3C2410_UDC_P_ENABLE);
	} else
		printk("s3c2410: unknown mode\n");
		return -EINVAL;
	return count;
}

static DEVICE_ATTR(usb_mode, S_IRUGO | S_IWUSR, show_usb_mode, set_usb_mode);

/* may be called without controller electrically present */
/* may be called with controller, bus, and devices active */

/**
 * usb_hcd_s3c2410_remove - shutdown processing for HCD
 * @dev: USB Host Controller being removed
 * Context: !in_interrupt()
 *
 * Reverses the effect of usb_hcd_3c2410_probe(), first invoking
 * the HCD's stop() method.  It is always called from a thread
 * context, normally "rmmod", "apmd", or something similar.
 *
*/

static void usb_hcd_s3c2410_remove (struct usb_hcd *hcd, struct platform_device *dev) {
	device_remove_file(&dev->dev, &dev_attr_usb_mode);
	usb_remove_hcd(hcd);
	s3c2410_stop_hc(dev);
	iounmap(hcd->regs);
	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
	usb_put_hcd(hcd);
}

/**
 * usb_hcd_s3c2410_probe - initialize S3C2410-based HCDs
 * Context: !in_interrupt()
 *
 * Allocates basic resources for this USB host controller, and
 * then invokes the start() method for the HCD associated with it
 * through the hotplug entry's driver_data.
 *
 */
static int usb_hcd_s3c2410_probe (const struct hc_driver *driver, struct platform_device *dev) {
	struct usb_hcd *hcd = NULL;
	int retval;

	dev_info(&dev->dev, "usb_hcd_s3c2410_probe\n");
	s3c2410_usb_set_power(dev->dev.platform_data, 1, 1);
	s3c2410_usb_set_power(dev->dev.platform_data, 2, 1);

	hcd = usb_create_hcd(driver, &dev->dev, "s3c24xx");

	if (hcd == NULL) {
		dev_info(&dev->dev, "hcd == NULL\n");
		return -ENOMEM;
		}

	hcd->rsrc_start = dev->resource[0].start;								//original (cxlabs)
	hcd->rsrc_len   = dev->resource[0].end - dev->resource[0].start + 1;
	//hcd->rsrc_start = dev->resource[1].start;
	//hcd->rsrc_len   = dev->resource[1].end - dev->resource[1].start + 1;

	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
		dev_err(&dev->dev, "request_mem_region failed\n");
		retval = -EBUSY;
		goto err_put;
	}

	clk = clk_get(&dev->dev, "usb-host");
	if (IS_ERR(clk)) {
		dev_err(&dev->dev, "cannot get usb-host clock\n");
		retval = -ENOENT;
		goto err_mem;
	}

	usb_clk = clk_get(&dev->dev, "usb-bus-host");
	if (IS_ERR(usb_clk)) {
		dev_err(&dev->dev, "cannot get usb-host clock\n");
		retval = -ENOENT;
		goto err_clk;
	}

	s3c2410_start_hc(dev, hcd);

	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
	if (!hcd->regs) {
		dev_err(&dev->dev, "ioremap failed\n");
		retval = -ENOMEM;
		goto err_ioremap;
	}

	ohci_hcd_init(hcd_to_ohci(hcd));		// in ohci-mem.c

	retval = usb_add_hcd(hcd, dev->resource[1].start, IRQF_DISABLED);		// original (cxlabs)
	//retval = usb_add_hcd(hcd, dev->resource[0].start, IRQF_DISABLED);		
	if (retval != 0) {
		dev_err(&dev->dev, "usb_add_hcd failed\n");
		goto err_ioremap;
		}

	retval = device_create_file(&dev->dev, &dev_attr_usb_mode);
	if (retval != 0) {
		dev_err(&dev->dev, "device_create_file failed\n");
		goto err_hcd;
		}

	return 0;

 err_hcd:
	usb_remove_hcd(hcd);

 err_ioremap:
	s3c2410_stop_hc(dev);
	iounmap(hcd->regs);
	clk_put(usb_clk);

 err_clk:
	clk_put(clk);

 err_mem:
	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);

 err_put:
	usb_put_hcd(hcd);
	return retval;
}

/*-------------------------------------------------------------------------*/
/* called after IRQ probing */
static int ohci_s3c2410_start (struct usb_hcd *hcd) {
	struct ohci_hcd	*ohci = hcd_to_ohci (hcd);
	int ret;

 	DPRINTK("ohci_s3c2410_start\n");
	if ((ret = ohci_init(ohci)) < 0) {
		dev_info(hcd->self.controller, "ohci_init<0\n");
		return ret;
		}

	if ((ret = ohci_run (ohci)) < 0) {
		err ("can't start %s", hcd->self.bus_name);
		ohci_stop (hcd);
		return ret;
	}

	return 0;
}


static const struct hc_driver ohci_s3c2410_hc_driver = {
	.description =		hcd_name,
	.product_desc =		"S3C24XX Open Host Controller Interface",
	.hcd_priv_size =	sizeof(struct ohci_hcd),
	/* generic hardware linkage	 */
	.irq =			ohci_irq,		//irq handler
	.flags =		HCD_USB11 | HCD_MEMORY,

	/*
	 * basic lifecycle operations
	 */
	.start =		ohci_s3c2410_start,
	.stop =			ohci_stop,
	.shutdown =		ohci_shutdown,
	.reset =		ohci_s3c2410_reset,

	/*
	 * managing i/o requests and associated device resources
	 */
	.urb_enqueue =		ohci_urb_enqueue,
	.urb_dequeue =		ohci_urb_dequeue,
	.endpoint_disable =	ohci_endpoint_disable,

	/*
	 * scheduling support
	 */
	.get_frame_number =	ohci_get_frame,

	/*
	 * root hub support
	 */
	.hub_status_data =	ohci_s3c2410_hub_status_data,
	.hub_control =		ohci_s3c2410_hub_control,
#ifdef	CONFIG_PM
	.bus_suspend =		ohci_bus_suspend,
	.bus_resume =		ohci_bus_resume,
#endif
	.start_port_reset =	ohci_start_port_reset,		// in ohci-hub.c
};

/* device driver */

static int ohci_hcd_s3c2410_drv_probe(struct platform_device *pdev)
{
	return usb_hcd_s3c2410_probe(&ohci_s3c2410_hc_driver, pdev);
}

static int ohci_hcd_s3c2410_drv_remove(struct platform_device *pdev)
{
	struct usb_hcd *hcd = platform_get_drvdata(pdev);

	usb_hcd_s3c2410_remove(hcd, pdev);
	return 0;
}
#ifdef	CONFIG_PM
static int ohci_hcd_s3c2410_drv_suspend(struct platform_device * pdev, pm_message_t state) {
	struct usb_hcd *hcd = platform_get_drvdata(pdev);

	dev_info(hcd->self.controller, "ohci_hcd_s3c2410_drv_suspend\n");
	//n311_lcdpower_bl_enable(0);
	return 0;
}

static int ohci_hcd_s3c2410_drv_resume(struct platform_device * pdev) {
	struct usb_hcd *hcd = platform_get_drvdata(pdev);

	dev_info(hcd->self.controller, "ohci_hcd_s3c2410_drv_resume\n");
	ohci_finish_controller_resume(hcd);
	return 0;
}
#endif
static struct platform_driver ohci_hcd_s3c2410_driver = {
	.probe		= ohci_hcd_s3c2410_drv_probe,
	.remove		= ohci_hcd_s3c2410_drv_remove,
	.shutdown	= usb_hcd_platform_shutdown,
#ifdef	CONFIG_PM
	.suspend	= ohci_hcd_s3c2410_drv_suspend,
	.resume		= ohci_hcd_s3c2410_drv_resume,
#endif
	.driver		= {
		.owner	= THIS_MODULE,
		.name	= "s3c2410-ohci",
	},
};

MODULE_ALIAS("platform:s3c2410-ohci");


#ifdef MODULE
static void __exit ohci_hcd_s3c2410_exit(void)
{
	platform_device_unregister(n311fb_device);
	//platform_driver_unregister(&ohci_hcd_s3c2410_driver);
}

module_exit(ohci_hcd_s3c2410_exit);

MODULE_LICENSE("GPL");
#endif				/* MODULE */
