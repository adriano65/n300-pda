cmd_/opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/os/linux/../../common/cmm_profile.o := arm-angstrom-linux-gnueabi-gcc -Wp,-MD,/opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/os/linux/../../common/.cmm_profile.o.d  -nostdinc -isystem /usr/local/angstrom/arm/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include -Iinclude  -I/opt/N310/linux-2.6.29.n310/arch/arm/include -include include/linux/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s3c2410/include -Iarch/arm/mach-s3c2400/include -Iarch/arm/mach-s3c2412/include -Iarch/arm/mach-s3c2440/include -Iarch/arm/mach-s3c2442/include -Iarch/arm/mach-s3c2443/include -Iarch/arm/plat-s3c24xx/include -Iarch/arm/plat-s3c/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Os -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -msoft-float -Uarm -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -Wdeclaration-after-statement -Wno-pointer-sign -fwrapv -DAGGREGATION_SUPPORT -DPIGGYBACK_SUPPORT -DWMM_SUPPORT -DLINUX -Wall -Wstrict-prototypes -Wno-trigraphs -DSYSTEM_LOG_SUPPORT -DRT28xx_MODE=STA -DCHIPSET=7601U -DRESOURCE_PRE_ALLOC -I/opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include -DCONFIG_STA_SUPPORT -DSCAN_SUPPORT -DWPA_SUPPLICANT_SUPPORT -DNATIVE_WPA_SUPPLICANT_SUPPORT -DDOT11_N_SUPPORT -DSTATS_COUNT_SUPPORT -DMT7601U -DMT7601 -DRLT_MAC -DRLT_RF -DRTMP_MAC_USB -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DRX_DMA_SCATTER -DVCORECAL_SUPPORT -DRTMP_EFUSE_SUPPORT -DNEW_MBSSID_MODE -DRTMP_INTERNAL_TX_ALC -DCONFIG_ANDES_SUPPORT -DDPD_CALIBRATION_SUPPORT -DCONFIG_RX_CSO_SUPPORT -DRTMP_FREQ_CALIBRATION_SUPPORT -DMODULE -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(cmm_profile)"  -D"KBUILD_MODNAME=KBUILD_STR(mt7601Usta)"  -c -o /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/os/linux/../../common/cmm_profile.o /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/os/linux/../../common/cmm_profile.c

deps_/opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/os/linux/../../common/cmm_profile.o := \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/os/linux/../../common/cmm_profile.c \
    $(wildcard include/config/sta/support.h) \
    $(wildcard include/config/opmode/on/sta.h) \
    $(wildcard include/config/ap/support.h) \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rt_config.h \
    $(wildcard include/config/h//.h) \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_comm.h \
    $(wildcard include/config/opmode/on/ap.h) \
    $(wildcard include/config/if/opmode/on/ap.h) \
    $(wildcard include/config/if/opmode/on/sta.h) \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_type.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_os.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/os/rt_linux.h \
    $(wildcard include/config/apsta/mixed/support.h) \
    $(wildcard include/config/multi/channel.h) \
    $(wildcard include/config/5vt/enhance.h) \
    $(wildcard include/config/cso/support.h) \
    $(wildcard include/config/rx/cso/support.h) \
  include/linux/module.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/markers.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/sysfs.h) \
  include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  include/linux/stddef.h \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
  include/linux/poison.h \
  include/linux/prefetch.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbd.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  include/linux/posix_types.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/posix_types.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/types.h \
  include/asm-generic/int-ll64.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/processor.h \
    $(wildcard include/config/mmu.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/hwcap.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/cache.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/system.h \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
  include/linux/linkage.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/linkage.h \
  include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
    $(wildcard include/config/x86.h) \
  include/linux/typecheck.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/irqflags.h \
  include/asm-generic/cmpxchg-local.h \
  include/asm-generic/cmpxchg.h \
  include/linux/stat.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/stat.h \
  include/linux/time.h \
  include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/spinlock/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/printk/debug.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /usr/local/angstrom/arm/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/include/stdarg.h \
  include/linux/bitops.h \
    $(wildcard include/config/generic/find/first/bit.h) \
    $(wildcard include/config/generic/find/last/bit.h) \
    $(wildcard include/config/generic/find/next/bit.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/bitops.h \
  include/asm-generic/bitops/non-atomic.h \
  include/asm-generic/bitops/ffz.h \
  include/asm-generic/bitops/__fls.h \
  include/asm-generic/bitops/__ffs.h \
  include/asm-generic/bitops/fls.h \
  include/asm-generic/bitops/ffs.h \
  include/asm-generic/bitops/fls64.h \
  include/asm-generic/bitops/sched.h \
  include/asm-generic/bitops/hweight.h \
  include/asm-generic/bitops/lock.h \
  include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  include/linux/ratelimit.h \
  include/linux/param.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/param.h \
    $(wildcard include/config/hz.h) \
  include/linux/dynamic_printk.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/linux/swab.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/swab.h \
  include/linux/byteorder/generic.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  include/linux/seqlock.h \
  include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
  include/linux/stringify.h \
  include/linux/bottom_half.h \
  include/linux/spinlock_types.h \
  include/linux/spinlock_types_up.h \
  include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/generic/hardirqs.h) \
  include/linux/spinlock_up.h \
  include/linux/spinlock_api_up.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/atomic.h \
  include/asm-generic/atomic.h \
  include/linux/math64.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/div64.h \
  include/linux/kmod.h \
  include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/highmem.h) \
  include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/unevictable/lru.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/arch/populates/node/map.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/cgroup/mem/res/ctlr.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
  include/linux/wait.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/current.h \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  include/linux/init.h \
    $(wildcard include/config/hotplug.h) \
  include/linux/nodemask.h \
  include/linux/bitmap.h \
  include/linux/string.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/string.h \
  include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  include/linux/bounds.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v3.h) \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/aeabi.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/glue.h \
    $(wildcard include/config/cpu/arm610.h) \
    $(wildcard include/config/cpu/arm710.h) \
    $(wildcard include/config/cpu/abrt/lv4t.h) \
    $(wildcard include/config/cpu/abrt/ev4.h) \
    $(wildcard include/config/cpu/abrt/ev4t.h) \
    $(wildcard include/config/cpu/abrt/ev5tj.h) \
    $(wildcard include/config/cpu/abrt/ev5t.h) \
    $(wildcard include/config/cpu/abrt/ev6.h) \
    $(wildcard include/config/cpu/abrt/ev7.h) \
    $(wildcard include/config/cpu/pabrt/ifar.h) \
    $(wildcard include/config/cpu/pabrt/noifar.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/memory.h \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
  include/linux/const.h \
  arch/arm/mach-s3c2410/include/mach/memory.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/sizes.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  include/asm-generic/page.h \
  include/linux/memory_hotplug.h \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/memory/hotremove.h) \
  include/linux/notifier.h \
  include/linux/errno.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/errno.h \
  include/asm-generic/errno.h \
  include/asm-generic/errno-base.h \
  include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
  include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  include/linux/rwsem-spinlock.h \
  include/linux/srcu.h \
  include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
  include/linux/cpumask.h \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/topology.h \
  include/asm-generic/topology.h \
  include/linux/elf.h \
  include/linux/elf-em.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/elf.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/user.h \
  include/linux/kobject.h \
  include/linux/sysfs.h \
  include/linux/kref.h \
  include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  include/linux/marker.h \
  include/linux/tracepoint.h \
  include/linux/rcupdate.h \
    $(wildcard include/config/classic/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/preempt/rcu.h) \
  include/linux/percpu.h \
  include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/debug/slab.h) \
  include/linux/slub_def.h \
    $(wildcard include/config/slub/stats.h) \
    $(wildcard include/config/slub/debug.h) \
  include/linux/workqueue.h \
  include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  include/linux/jiffies.h \
  include/linux/timex.h \
    $(wildcard include/config/no/hz.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/timex.h \
  arch/arm/plat-s3c/include/mach/timex.h \
  include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects/free.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/percpu.h \
  include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  include/linux/completion.h \
  include/linux/rcuclassic.h \
    $(wildcard include/config/rcu/cpu/stall/detector.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/local.h \
  include/asm-generic/local.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/module.h \
  include/linux/version.h \
  include/linux/interrupt.h \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/proc/fs.h) \
  include/linux/irqreturn.h \
  include/linux/irqnr.h \
  include/linux/hardirq.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
  include/linux/smp_lock.h \
    $(wildcard include/config/lock/kernel.h) \
  include/linux/ftrace_irq.h \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/function/graph/tracer.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/hardirq.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/irq.h \
  arch/arm/mach-s3c2410/include/mach/irqs.h \
    $(wildcard include/config/cpu/s3c2443.h) \
  include/linux/irq_cpustat.h \
  include/linux/sched.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/detect/softlockup.h) \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/user/sched.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/x86/ptrace/bts.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/preempt/bkl.h) \
    $(wildcard include/config/group/sched.h) \
    $(wildcard include/config/mm/owner.h) \
  include/linux/capability.h \
    $(wildcard include/config/security/file/capabilities.h) \
  include/linux/rbtree.h \
  include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/mmu/notifier.h) \
  include/linux/auxvec.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/auxvec.h \
  include/linux/prio_tree.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/cputime.h \
  include/asm-generic/cputime.h \
  include/linux/sem.h \
  include/linux/ipc.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/ipcbuf.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/sembuf.h \
  include/linux/signal.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/signal.h \
  include/asm-generic/signal.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/sigcontext.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/siginfo.h \
  include/asm-generic/siginfo.h \
  include/linux/fs_struct.h \
  include/linux/path.h \
  include/linux/pid.h \
  include/linux/proportions.h \
  include/linux/percpu_counter.h \
  include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
  include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  include/linux/resource.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/resource.h \
  include/asm-generic/resource.h \
  include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
  include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  include/linux/latencytop.h \
  include/linux/cred.h \
    $(wildcard include/config/security.h) \
  include/linux/key.h \
    $(wildcard include/config/sysctl.h) \
  include/linux/sysctl.h \
  include/linux/aio.h \
    $(wildcard include/config/aio.h) \
  include/linux/aio_abi.h \
  include/linux/uio.h \
  include/linux/pci.h \
    $(wildcard include/config/pcieaspm.h) \
    $(wildcard include/config/pci/msi.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/pci/legacy.h) \
    $(wildcard include/config/ht/irq.h) \
    $(wildcard include/config/pci/domains.h) \
    $(wildcard include/config/pci/mmconfig.h) \
  include/linux/pci_regs.h \
  include/linux/mod_devicetable.h \
  include/linux/ioport.h \
  include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
  include/linux/klist.h \
  include/linux/pm.h \
    $(wildcard include/config/pm/sleep.h) \
  include/linux/semaphore.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/device.h \
    $(wildcard include/config/dmabounce.h) \
  include/linux/pm_wakeup.h \
    $(wildcard include/config/pm.h) \
  include/linux/io.h \
    $(wildcard include/config/has/ioport.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/io.h \
  arch/arm/mach-s3c2410/include/mach/io.h \
  arch/arm/mach-s3c2410/include/mach/hardware.h \
    $(wildcard include/config/cpu/s3c2400.h) \
    $(wildcard include/config/cpu/s3c2440.h) \
    $(wildcard include/config/cpu/s3c2412.h) \
    $(wildcard include/config/no/multiword/io.h) \
  arch/arm/mach-s3c2410/include/mach/map.h \
  arch/arm/plat-s3c/include/plat/map-base.h \
  arch/arm/plat-s3c24xx/include/plat/map.h \
    $(wildcard include/config/cpu/s3c2413.h) \
    $(wildcard include/config/cpu/s3c2412/only.h) \
  include/linux/pci_ids.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/pci.h \
    $(wildcard include/config/pci/host/ite8152.h) \
  include/asm-generic/pci-dma-compat.h \
  include/linux/dma-mapping.h \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/have/dma/attrs.h) \
  include/linux/err.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/dma-mapping.h \
  include/linux/scatterlist.h \
    $(wildcard include/config/debug/sg.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/scatterlist.h \
  include/linux/mm.h \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
  include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
  include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/pgtable.h \
  include/asm-generic/4level-fixup.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/proc-fns.h \
    $(wildcard include/config/cpu/32.h) \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/cpu/v6.h) \
    $(wildcard include/config/cpu/v7.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/cpu-single.h \
  arch/arm/plat-s3c/include/mach/vmalloc.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/pgtable-hwdef.h \
  include/asm-generic/pgtable.h \
  include/linux/page-flags.h \
    $(wildcard include/config/pageflags/extended.h) \
    $(wildcard include/config/ia64/uncached/allocator.h) \
    $(wildcard include/config/s390.h) \
  include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
  include/asm-generic/dma-coherent.h \
    $(wildcard include/config/have/generic/dma/coherent.h) \
  include/linux/netdevice.h \
    $(wildcard include/config/dcb.h) \
    $(wildcard include/config/wlan/80211.h) \
    $(wildcard include/config/ax25.h) \
    $(wildcard include/config/mac80211/mesh.h) \
    $(wildcard include/config/tr.h) \
    $(wildcard include/config/net/ipip.h) \
    $(wildcard include/config/net/ipgre.h) \
    $(wildcard include/config/ipv6/sit.h) \
    $(wildcard include/config/ipv6/tunnel.h) \
    $(wildcard include/config/netpoll.h) \
    $(wildcard include/config/net/poll/controller.h) \
    $(wildcard include/config/wireless/ext.h) \
    $(wildcard include/config/net/dsa.h) \
    $(wildcard include/config/net/ns.h) \
    $(wildcard include/config/compat/net/dev/ops.h) \
    $(wildcard include/config/net/dsa/tag/dsa.h) \
    $(wildcard include/config/net/dsa/tag/trailer.h) \
    $(wildcard include/config/netpoll/trap.h) \
  include/linux/if.h \
  include/linux/socket.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/socket.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/sockios.h \
  include/linux/sockios.h \
  include/linux/hdlc/ioctl.h \
  include/linux/if_ether.h \
  include/linux/skbuff.h \
    $(wildcard include/config/nf/conntrack.h) \
    $(wildcard include/config/bridge/netfilter.h) \
    $(wildcard include/config/xfrm.h) \
    $(wildcard include/config/net/sched.h) \
    $(wildcard include/config/net/cls/act.h) \
    $(wildcard include/config/ipv6/ndisc/nodetype.h) \
    $(wildcard include/config/mac80211.h) \
    $(wildcard include/config/net/dma.h) \
    $(wildcard include/config/network/secmark.h) \
  include/linux/net.h \
  include/linux/random.h \
  include/linux/ioctl.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/ioctl.h \
  include/asm-generic/ioctl.h \
  include/linux/fcntl.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/fcntl.h \
  include/asm-generic/fcntl.h \
  include/linux/textsearch.h \
  include/net/checksum.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/uaccess.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/checksum.h \
  include/linux/in6.h \
  include/linux/dmaengine.h \
    $(wildcard include/config/dma/engine.h) \
  include/linux/if_packet.h \
  include/linux/delay.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/delay.h \
  include/net/net_namespace.h \
    $(wildcard include/config/ipv6.h) \
    $(wildcard include/config/ip/dccp.h) \
    $(wildcard include/config/netfilter.h) \
    $(wildcard include/config/net.h) \
  include/net/netns/core.h \
  include/net/netns/mib.h \
    $(wildcard include/config/xfrm/statistics.h) \
  include/net/snmp.h \
  include/linux/snmp.h \
  include/net/netns/unix.h \
  include/net/netns/packet.h \
  include/net/netns/ipv4.h \
    $(wildcard include/config/ip/multiple/tables.h) \
  include/net/inet_frag.h \
  include/net/netns/ipv6.h \
    $(wildcard include/config/ipv6/multiple/tables.h) \
    $(wildcard include/config/ipv6/mroute.h) \
    $(wildcard include/config/ipv6/pimsm/v2.h) \
  include/net/netns/dccp.h \
  include/net/netns/x_tables.h \
  include/linux/netfilter.h \
    $(wildcard include/config/netfilter/debug.h) \
    $(wildcard include/config/nf/nat/needed.h) \
  include/linux/in.h \
  include/net/flow.h \
  include/linux/proc_fs.h \
    $(wildcard include/config/proc/devicetree.h) \
    $(wildcard include/config/proc/kcore.h) \
  include/linux/fs.h \
    $(wildcard include/config/dnotify.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/inotify.h) \
    $(wildcard include/config/debug/writecount.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/fs/xip.h) \
    $(wildcard include/config/migration.h) \
  include/linux/limits.h \
  include/linux/kdev_t.h \
  include/linux/dcache.h \
  include/linux/rculist.h \
  include/linux/radix-tree.h \
  include/linux/fiemap.h \
  include/linux/quota.h \
  include/linux/dqblk_xfs.h \
  include/linux/dqblk_v1.h \
  include/linux/dqblk_v2.h \
  include/linux/dqblk_qtree.h \
  include/linux/nfs_fs_i.h \
  include/linux/nfs.h \
  include/linux/sunrpc/msg_prot.h \
  include/linux/magic.h \
  include/net/netns/conntrack.h \
    $(wildcard include/config/nf/conntrack/events.h) \
  include/net/netns/xfrm.h \
  include/linux/xfrm.h \
  include/linux/seq_file_net.h \
  include/linux/seq_file.h \
  include/net/dsa.h \
  include/linux/etherdevice.h \
    $(wildcard include/config/have/efficient/unaligned/access.h) \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/unaligned.h \
  include/linux/unaligned/le_byteshift.h \
  include/linux/unaligned/be_byteshift.h \
  include/linux/unaligned/generic.h \
  include/linux/ethtool.h \
  include/linux/wireless.h \
  include/linux/if_arp.h \
  include/linux/ctype.h \
  include/linux/vmalloc.h \
  include/linux/usb.h \
    $(wildcard include/config/usb/devicefs.h) \
    $(wildcard include/config/usb/mon.h) \
    $(wildcard include/config/usb/device/class.h) \
    $(wildcard include/config/usb/suspend.h) \
  include/linux/usb/ch9.h \
    $(wildcard include/config/size.h) \
    $(wildcard include/config/att/one.h) \
    $(wildcard include/config/att/selfpower.h) \
    $(wildcard include/config/att/wakeup.h) \
    $(wildcard include/config/att/battery.h) \
  include/net/iw_handler.h \
  include/linux/unistd.h \
  /opt/N310/linux-2.6.29.n310/arch/arm/include/asm/unistd.h \
    $(wildcard include/config/oabi/compat.h) \
  include/linux/kthread.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/os/rt_linux_cmm.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/os/rt_os.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/link_list.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_cmd.h \
    $(wildcard include/config/value.h) \
    $(wildcard include/config/init.h) \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/iface/iface_util.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_def.h \
    $(wildcard include/config/desp/entry/size.h) \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/oid.h \
    $(wildcard include/config/status.h) \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_chip.h \
    $(wildcard include/config/andes/support.h) \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/pbf.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/nmac/ral_nmac_pbf.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/eeprom.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/rtmp_mac.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/nmac/ral_nmac.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_type.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/omac/ral_omac_rxwi.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/nmac/ral_nmac_txwi.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/mac_usb.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/nmac/ral_nmac_usb.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/rtmp_mac.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/chip/rtmp_phy.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/rf_ctrl.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/phy/rlt_phy.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_iface.h \
    $(wildcard include/config/.h) \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/iface/rtmp_usb.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtusb_io.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/wpa_cmm.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/dot11i_wpa.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_dot11.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_mcu.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/chip/mt7601.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_timer.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mlme.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_dot11.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/crypt_md5.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/crypt_sha2.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/crypt_hmac.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rt_config.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/crypt_aes.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/crypt_arc4.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp.h \
    $(wildcard include/config/t.h) \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/spectrum_def.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/wsc.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/drs_extr.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_M51.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rtmp_and.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/radar.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/frq_cal.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/ap.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/wpa.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/chlist.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/spectrum.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rt_os_util.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/rt_os_net.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/chip/chip_id.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/sta_cfg.h \
  /opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/include/mac_ral/fce.h \

/opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/os/linux/../../common/cmm_profile.o: $(deps_/opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/os/linux/../../common/cmm_profile.o)

$(deps_/opt/N310/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/os/linux/../../common/cmm_profile.o):