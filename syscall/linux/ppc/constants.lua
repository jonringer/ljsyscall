-- ppc specific code

local require, print, error, assert, tonumber, tostring,
setmetatable, pairs, ipairs, unpack, rawget, rawset,
pcall, type, table, string, math = 
require, print, error, assert, tonumber, tostring,
setmetatable, pairs, ipairs, unpack, rawget, rawset,
pcall, type, table, string, math

local h = require "syscall.helpers"

local octal = h.octal

local arch = {}

arch.syscall = {
  zeropad = true,
}

arch.SYS = {
  restart_syscall         = 0,
  exit                    = 1,
  fork                    = 2,
  read                    = 3,
  write                   = 4,
  open                    = 5,
  close                   = 6,
  waitpid                 = 7,
  creat                   = 8,
  link                    = 9,
  unlink                 = 10,
  execve                 = 11,
  chdir                  = 12,
  time                   = 13,
  mknod                  = 14,
  chmod                  = 15,
  lchown                 = 16,
  ["break"]              = 17,
  oldstat                = 18,
  lseek                  = 19,
  getpid                 = 20,
  mount                  = 21,
  umount                 = 22,
  setuid                 = 23,
  getuid                 = 24,
  stime                  = 25,
  ptrace                 = 26,
  alarm                  = 27,
  oldfstat               = 28,
  pause                  = 29,
  utime                  = 30,
  stty                   = 31,
  gtty                   = 32,
  access                 = 33,
  nice                   = 34,
  ftime                  = 35,
  sync                   = 36,
  kill                   = 37,
  rename                 = 38,
  mkdir                  = 39,
  rmdir                  = 40,
  dup                    = 41,
  pipe                   = 42,
  times                  = 43,
  prof                   = 44,
  brk                    = 45,
  setgid                 = 46,
  getgid                 = 47,
  signal                 = 48,
  geteuid                = 49,
  getegid                = 50,
  acct                   = 51,
  umount2                = 52,
  lock                   = 53,
  ioctl                  = 54,
  fcntl                  = 55,
  mpx                    = 56,
  setpgid                = 57,
  ulimit                 = 58,
  oldolduname            = 59,
  umask                  = 60,
  chroot                 = 61,
  ustat                  = 62,
  dup2                   = 63,
  getppid                = 64,
  getpgrp                = 65,
  setsid                 = 66,
  sigaction              = 67,
  sgetmask               = 68,
  ssetmask               = 69,
  setreuid               = 70,
  setregid               = 71,
  sigsuspend             = 72,
  sigpending             = 73,
  sethostname            = 74,
  setrlimit              = 75,
  getrlimit              = 76,
  getrusage              = 77,
  gettimeofday           = 78,
  settimeofday           = 79,
  getgroups              = 80,
  setgroups              = 81,
  select                 = 82,
  symlink                = 83,
  oldlstat               = 84,
  readlink               = 85,
  uselib                 = 86,
  swapon                 = 87,
  reboot                 = 88,
  readdir                = 89,
  mmap                   = 90,
  munmap                 = 91,
  truncate               = 92,
  ftruncate              = 93,
  fchmod                 = 94,
  fchown                 = 95,
  getpriority            = 96,
  setpriority            = 97,
  profil                 = 98,
  statfs                 = 99,
  fstatfs               = 100,
  ioperm                = 101,
  socketcall            = 102,
  syslog                = 103,
  setitimer             = 104,
  getitimer             = 105,
  stat                  = 106,
  lstat                 = 107,
  fstat                 = 108,
  olduname              = 109,
  iopl                  = 110,
  vhangup               = 111,
  idle                  = 112,
  vm86                  = 113,
  wait4                 = 114,
  swapoff               = 115,
  sysinfo               = 116,
  ipc                   = 117,
  fsync                 = 118,
  sigreturn             = 119,
  clone                 = 120,
  setdomainname         = 121,
  uname                 = 122,
  modify_ldt            = 123,
  adjtimex              = 124,
  mprotect              = 125,
  sigprocmask           = 126,
  create_module         = 127,
  init_module           = 128,
  delete_module         = 129,
  get_kernel_syms       = 130,
  quotactl              = 131,
  getpgid               = 132,
  fchdir                = 133,
  bdflush               = 134,
  sysfs                 = 135,
  personality           = 136,
  afs_syscall           = 137,
  setfsuid              = 138,
  setfsgid              = 139,
  _llseek               = 140,
  getdents              = 141,
  _newselect            = 142,
  flock                 = 143,
  msync                 = 144,
  readv                 = 145,
  writev                = 146,
  getsid                = 147,
  fdatasync             = 148,
  _sysctl               = 149,
  mlock                 = 150,
  munlock               = 151,
  mlockall              = 152,
  munlockall            = 153,
  sched_setparam        = 154,
  sched_getparam        = 155,
  sched_setscheduler    = 156,
  sched_getscheduler    = 157,
  sched_yield           = 158,
  sched_get_priority_max= 159,
  sched_get_priority_min= 160,
  sched_rr_get_interval = 161,
  nanosleep             = 162,
  mremap                = 163,
  setresuid             = 164,
  getresuid             = 165,
  query_module          = 166,
  poll                  = 167,
  nfsservctl            = 168,
  setresgid             = 169,
  getresgid             = 170,
  prctl                 = 171,
  rt_sigreturn          = 172,
  rt_sigaction          = 173,
  rt_sigprocmask        = 174,
  rt_sigpending         = 175,
  rt_sigtimedwait       = 176,
  rt_sigqueueinfo       = 177,
  rt_sigsuspend         = 178,
  pread64               = 179,
  pwrite64              = 180,
  chown                 = 181,
  getcwd                = 182,
  capget                = 183,
  capset                = 184,
  sigaltstack           = 185,
  sendfile              = 186,
  getpmsg               = 187,
  putpmsg               = 188,
  vfork                 = 189,
  ugetrlimit            = 190,
  readahead             = 191,
  mmap2                 = 192,
  truncate64            = 193,
  ftruncate64           = 194,
  stat64                = 195,
  lstat64               = 196,
  fstat64               = 197,
  pciconfig_read        = 198,
  pciconfig_write       = 199,
  pciconfig_iobase      = 200,
  multiplexer           = 201,
  getdents64            = 202,
  pivot_root            = 203,
  fcntl64               = 204,
  madvise               = 205,
  mincore               = 206,
  gettid                = 207,
  tkill                 = 208,
  setxattr              = 209,
  lsetxattr             = 210,
  fsetxattr             = 211,
  getxattr              = 212,
  lgetxattr             = 213,
  fgetxattr             = 214,
  listxattr             = 215,
  llistxattr            = 216,
  flistxattr            = 217,
  removexattr           = 218,
  lremovexattr          = 219,
  fremovexattr          = 220,
  futex                 = 221,
  sched_setaffinity     = 222,
  sched_getaffinity     = 223,
  tuxcall               = 225,
  sendfile64            = 226,
  io_setup              = 227,
  io_destroy            = 228,
  io_getevents          = 229,
  io_submit             = 230,
  io_cancel             = 231,
  set_tid_address       = 232,
  fadvise64             = 233,
  exit_group            = 234,
  lookup_dcookie        = 235,
  epoll_create          = 236,
  epoll_ctl             = 237,
  epoll_wait            = 238,
  remap_file_pages      = 239,
  timer_create          = 240,
  timer_settime         = 241,
  timer_gettime         = 242,
  timer_getoverrun      = 243,
  timer_delete          = 244,
  clock_settime         = 245,
  clock_gettime         = 246,
  clock_getres          = 247,
  clock_nanosleep       = 248,
  swapcontext           = 249,
  tgkill                = 250,
  utimes                = 251,
  statfs64              = 252,
  fstatfs64             = 253,
  fadvise64_64          = 254,
  rtas			= 255,
  sys_debug_setcontext  = 256,
  migrate_pages		= 258,
  mbind		 	= 259,
  get_mempolicy		= 260,
  set_mempolicy		= 261,
  mq_open		= 262,
  mq_unlink		= 263,
  mq_timedsend		= 264,
  mq_timedreceive	= 265,
  mq_notify		= 266,
  mq_getsetattr		= 267,
  kexec_load		= 268,
  add_key		= 269,
  request_key		= 270,
  keyctl		= 271,
  waitid		= 272,
  ioprio_set		= 273,
  ioprio_get		= 274,
  inotify_init		= 275,
  inotify_add_watch	= 276,
  inotify_rm_watch	= 277,
  spu_run		= 278,
  spu_create		= 279,
  pselect6		= 280,
  ppoll			= 281,
  unshare		= 282,
  splice		= 283,
  tee			= 284,
  vmsplice		= 285,
  openat		= 286,
  mkdirat		= 287,
  mknodat		= 288,
  fchownat		= 289,
  futimesat		= 290,
  fstatat64		= 291,
  unlinkat		= 292,
  renameat		= 293,
  linkat		= 294,
  symlinkat		= 295,
  readlinkat		= 296,
  fchmodat		= 297,
  faccessat		= 298,
  get_robust_list	= 299,
  set_robust_list	= 300,
  move_pages		= 301,
  getcpu		= 302,
  epoll_pwait		= 303,
  utimensat		= 304,
  signalfd		= 305,
  timerfd_create     	= 306,
  eventfd		= 307,
  sync_file_range2	= 308,
  fallocate		= 309,
  subpage_prot		= 310,
  timerfd_settime	= 311,
  timerfd_gettime	= 312,
  signalfd4		= 313,
  eventfd2		= 314,
  epoll_create1		= 315,
  dup3			= 316,
  pipe2			= 317,
  inotify_init1		= 318,
  perf_event_open       = 319,
  preadv                = 320,
  pwritev               = 321,
  rt_tgsigqueueinfo     = 322,
  fanotify_init         = 323,
  fanotify_mark         = 324,
  prlimit64             = 325,
  socket                = 326,
  bind                  = 327,
  connect               = 328,
  listen                = 329,
  accept                = 330,
  getsockname           = 331,
  getpeername           = 332,
  socketpair            = 333,
  send                  = 334,
  sendto                = 335,
  recv                  = 336,
  recvfrom              = 337,
  shutdown              = 338,
  setsockopt            = 339,
  getsockopt            = 340,
  sendmsg               = 341,
  recvmsg               = 342,
  recvmmsg              = 343,
  accept4               = 344,
  name_to_handle_at     = 345,
  open_by_handle_at     = 346,
  clock_adjtime         = 347,
  syncfs                = 348,
  sendmmsg              = 349,
  setns                 = 350,
  process_vm_readv      = 351,
  process_vm_writev     = 352,
}

arch.SO = {
  RCVLOWAT    = 16,
  SNDLOWAT    = 17,
  RCVTIMEO    = 18,
  SNDTIMEO    = 19,
  PASSCRED    = 20,
  PEERCRED    = 21,
}

arch.OFLAG = {
  OPOST  = octal('00000001'),
  ONLCR  = octal('00000002'),
  OLCUC  = octal('00000004'),
  OCRNL  = octal('00000010'),
  ONOCR  = octal('00000020'),
  ONLRET = octal('00000040'),
  OFILL  = octal('00000100'),
  OFDEL  = octal('00000200'),
  NLDLY  = octal('00001400'),
  NL0    = octal('00000000'),
  NL1    = octal('00000400'),
  NL2    = octal('00001000'),
  NL3    = octal('00001400'),
  CRDLY  = octal('00030000'),
  CR0    = octal('00000000'),
  CR1    = octal('00010000'),
  CR2    = octal('00020000'),
  CR3    = octal('00030000'),
  TABDLY = octal('00006000'),
  TAB0   = octal('00000000'),
  TAB1   = octal('00002000'),
  TAB2   = octal('00004000'),
  TAB3   = octal('00006000'),
  BSDLY  = octal('00100000'),
  BS0    = octal('00000000'),
  BS1    = octal('00100000'),
  FFDLY  = octal('00040000'),
  FF0    = octal('00000000'),
  FF1    = octal('00040000'),
  VTDLY  = octal('00200000'),
  VT0    = octal('00000000'),
  VT1    = octal('00200000'),
  XTABS  = octal('00006000'),
}

arch.LFLAG = {
  ISIG    = 0x00000080,
  ICANON  = 0x00000100,
  XCASE   = 0x00004000,
  ECHO    = 0x00000008,
  ECHOE   = 0x00000002,
  ECHOK   = 0x00000004,
  ECHONL  = 0x00000010,
  NOFLSH  = 0x80000000,
  TOSTOP  = 0x00400000,
  ECHOCTL = 0x00000040,
  ECHOPRT = 0x00000020,
  ECHOKE  = 0x00000001,
  FLUSHO  = 0x00800000,
  PENDIN  = 0x20000000,
  IEXTEN  = 0x00000400,
  EXTPROC = 0x10000000,
}

-- TODO these will be in a table
arch.CBAUD      = octal('0000377')
arch.CBAUDEX    = octal('0000020')

arch.CFLAG = {
  CSIZE      = octal('00001400'),
  CS5        = octal('00000000'),
  CS6        = octal('00000400'),
  CS7        = octal('00001000'),
  CS8        = octal('00001400'),
  CSTOPB     = octal('00002000'),
  CREAD      = octal('00004000'),
  PARENB     = octal('00010000'),
  PARODD     = octal('00020000'),
  HUPCL      = octal('00040000'),
  CLOCAL     = octal('00100000'),
}

arch.IFLAG = {
  IGNBRK  = octal('0000001'),
  BRKINT  = octal('0000002'),
  IGNPAR  = octal('0000004'),
  PARMRK  = octal('0000010'),
  INPCK   = octal('0000020'),
  ISTRIP  = octal('0000040'),
  INLCR   = octal('0000100'),
  IGNCR   = octal('0000200'),
  ICRNL   = octal('0000400'),
  IXON    = octal('0001000'),
  IXOFF   = octal('0002000'),
  IXANY   = octal('0004000'),
  IUCLC   = octal('0010000'),
  IMAXBEL = octal('0020000'),
  IUTF8   = octal('0040000'),
}

arch.CC = {
  VINTR           = 0,
  VQUIT           = 1,
  VERASE          = 2,
  VKILL           = 3,
  VEOF            = 4,
  VMIN            = 5,
  VEOL            = 6,
  VTIME           = 7,
  VEOL2           = 8,
  VSWTC           = 9,
  VWERASE         = 10,
  VREPRINT        = 11,
  VSUSP           = 12,
  VSTART          = 13,
  VSTOP           = 14,
  VLNEXT          = 15,
  VDISCARD        = 16,
}

arch.B = {
  ['0'] = octal('0000000'),
  ['50'] = octal('0000001'),
  ['75'] = octal('0000002'),
  ['110'] = octal('0000003'),
  ['134'] = octal('0000004'),
  ['150'] = octal('0000005'),
  ['200'] = octal('0000006'),
  ['300'] = octal('0000007'),
  ['600'] = octal('0000010'),
  ['1200'] = octal('0000011'),
  ['1800'] = octal('0000012'),
  ['2400'] = octal('0000013'),
  ['4800'] = octal('0000014'),
  ['9600'] = octal('0000015'),
  ['19200'] = octal('0000016'),
  ['38400'] = octal('0000017'),
  ['57600'] = octal('00020'),
  ['115200'] = octal('00021'),
  ['230400'] = octal('00022'),
  ['460800'] = octal('00023'),
  ['500000'] = octal('00024'),
  ['576000'] = octal('00025'),
  ['921600'] = octal('00026'),
  ['1000000'] = octal('00027'),
  ['1152000'] = octal('00030'),
  ['1500000'] = octal('00031'),
  ['2000000'] = octal('00032'),
  ['2500000'] = octal('00033'),
  ['3000000'] = octal('00034'),
  ['3500000'] = octal('00035'),
  ['4000000'] = octal('00036'),
}

arch.O = {
  DIRECTORY    = octal('040000'),
  NOFOLLOW     = octal('0100000'),
  LARGEFILE    = octal('0200000'),
  DIRECT       = octal('0400000'),
}

arch.MAP = {
  NORESERVE  = 0x40,
  LOCKED     = 0x80,
}

arch.MCL = {
  CURRENT    = 0x2000,
  FUTURE     = 0x4000,
}

arch.PROT = {
  SAO       = 0x10, -- Strong Access Ordering
}

return arch

