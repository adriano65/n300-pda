/*
 * APM emulation for N311-based machines
 *
 * Copyright 2001 Benjamin Herrenschmidt (benh@kernel.crashing.org)
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2, or (at your option) any
 * later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 *
 */

#include <mach/regs-gpio.h>

#include <linux/gpio.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/apm-emulation.h>
#include <linux/adb.h>
#include <linux/pmu.h>

#define APM_CRITICAL		10
#define APM_LOW			30

static void n311_apm_get_power_status(struct apm_power_info *info) {
	int percentage = -1;
	int batteries = 0;
	int time_units = -1;
	int real_count = 0;
	int i;
	char charging = 0;
	long charge = -1;
	long amperage = 0;
	unsigned long btype = 0;

	info->units = APM_UNITS_MINS;

	charging = 1;
	if (gpio_get_value(S3C2410_GPC7)) {
		info->ac_line_status = APM_AC_ONLINE;
		}
	else {
		if (gpio_get_value(S3C2410_GPF3)) {
			info->ac_line_status = APM_AC_BACKUP;
			}
		else {
			info->ac_line_status = APM_AC_OFFLINE;
			charging = 0;
			}
		}

	percentage=50 ;

	info->battery_status = APM_BATTERY_STATUS_UNKNOWN;
	info->battery_flag = APM_BATTERY_FLAG_UNKNOWN;
	if (charging > 0) {
		info->battery_status = APM_BATTERY_STATUS_CHARGING;
		info->battery_flag = APM_BATTERY_FLAG_CHARGING;
	} else if (percentage <= APM_CRITICAL) {
		info->battery_status = APM_BATTERY_STATUS_CRITICAL;
		info->battery_flag = APM_BATTERY_FLAG_CRITICAL;
	} else if (percentage <= APM_LOW) {
		info->battery_status = APM_BATTERY_STATUS_LOW;
		info->battery_flag = APM_BATTERY_FLAG_LOW;
	} else {
		info->battery_status = APM_BATTERY_STATUS_HIGH;
		info->battery_flag = APM_BATTERY_FLAG_HIGH;
	}

	info->battery_life = percentage;
	info->time = time_units;
}


static int __init apm_emu_init(void) {
	gpio_request(S3C2410_GPC7, "CABLE_STATE_AC");	// GPC ac off ==bb38, ac on == bbb8
	gpio_direction_input(S3C2410_GPC7); 			// GPD 78f4 on 7874 off
	gpio_request(S3C2410_GPF3, "CABLE_STATE_USB");
	gpio_direction_input(S3C2410_GPF3);

	apm_get_power_status = n311_apm_get_power_status;

	printk(KERN_INFO "N311 APM Emulation initialized.\n");

	return 0;
}

static void __exit apm_emu_exit(void) {
	gpio_free(S3C2410_GPC7);
	gpio_free(S3C2410_GPF3);

	if (apm_get_power_status == n311_apm_get_power_status)
		apm_get_power_status = NULL;

	printk(KERN_INFO "N300 APM Emulation removed.\n");
}

module_init(apm_emu_init);
module_exit(apm_emu_exit);

MODULE_AUTHOR("cxlabs");
MODULE_DESCRIPTION("APM emulation for N300");
MODULE_LICENSE("GPL");


