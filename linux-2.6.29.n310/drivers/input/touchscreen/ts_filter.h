#ifndef __TS_FILTER_H__
#define __TS_FILTER_H__

/*
 * Touchscreen filter.
 *
 * (c) 2008 Andy Green <andy@openmoko.com>
 */

#include <linux/platform_device.h>

#define MAX_TS_FILTER_CHAIN		8  /* Max. filters we can chain up. */
#define MAX_TS_FILTER_COORDS		3  /* X, Y and Z (pressure). */

struct ts_filter;

/* Operations that a filter can perform. */

struct ts_filter_api {
	struct ts_filter * (*create)(struct platform_device *pdev, void *config,
				     int count_coords);
	void (*destroy)(struct platform_device *pdev, struct ts_filter *filter);
	void (*clear)(struct ts_filter *filter);
	int (*process)(struct ts_filter *filter, int *coords);
	void (*scale)(struct ts_filter *filter, int *coords);
};

/*
 * This is the common part of all filters.
 * We use this type as an otherwise opaque handle on to
 * the actual filter.  Therefore you need one of these
 * at the start of your actual filter struct.
 */

struct ts_filter {
	struct ts_filter *next;		/* Next in chain. */
	struct ts_filter_api *api;	/* Operations to use for this object. */
	int count_coords;
	int coords[MAX_TS_FILTER_COORDS];
};

/*
 * Helper to create a filter chain from an array of API pointers and
 * array of config ints. Leaves pointers to created filters in arr
 * array and fills in ->next pointers to create the chain.
 */

#ifdef CONFIG_TOUCHSCREEN_FILTER
extern int ts_filter_create_chain(struct platform_device *pdev,
				  struct ts_filter_api **api, void **config,
				  struct ts_filter **arr, int count_coords);

/* Helper to destroy a whole chain from the list of filter pointers. */

extern void ts_filter_destroy_chain(struct platform_device *pdev,
				    struct ts_filter **arr);
#else
#define ts_filter_create_chain(pdev, api, config, arr, count_coords) (0)
#define ts_filter_destroy_chain(pdev, arr) do { } while (0)
#endif

#endif
