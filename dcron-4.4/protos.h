Prototype short DebugOpt;
Prototype short LogLevel;
Prototype short ForegroundOpt;
Prototype short SyslogOpt;
Prototype const char *CDir;
Prototype const char *SCDir;
Prototype const char *TSDir;
Prototype const char *LogFile;
Prototype const char *LogHeader;
Prototype uid_t DaemonUid;
Prototype pid_t DaemonPid;
Prototype const char *SendMail;
Prototype const char *Mailto;
Prototype char *TempDir;
Prototype char *TempFileFmt;
Prototype void printlogf(int level, const char *ctl, ...);
Prototype void fdprintlogf(int level, int fd, const char *ctl, ...);
Prototype void fdprintf(int fd, const char *ctl, ...);
Prototype void initsignals(void);
Prototype char Hostname[SMALL_BUFFER];
Prototype void CheckUpdates(const char *dpath, const char *user_override, time_t t1, time_t t2);
Prototype void SynchronizeDir(const char *dpath, const char *user_override, int initial_scan);
Prototype void ReadTimestamps(const char *user);
Prototype int TestJobs(time_t t1, time_t t2);
Prototype int TestStartupJobs(void);
Prototype int ArmJob(CronFile *file, CronLine *line, time_t t1, time_t t2);
Prototype void RunJobs(void);
Prototype int CheckJobs(void);
Prototype void RunJob(CronFile *file, CronLine *line);
Prototype void EndJob(CronFile *file, CronLine *line, int exit_status);
Prototype const char *SendMail;
Prototype char *concat(const char *s1, ...);
Prototype int ChangeUser(const char *user, char *dochdir);
Prototype void printlogf(int level, const char *ctl, ...);
Prototype int ChangeUser(const char *user, char *dochdir);
