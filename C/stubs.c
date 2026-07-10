#include <sys/stat.h>
#include <sys/types.h>
#include <errno.h>

#undef errno
extern int errno;

/* MMIO addresses */
#define TTY_ADDR 0x1000000
volatile char *const TTY_PORT = (volatile char *)TTY_ADDR;
#define KB_DATA_ADDR 0x1000008
#define KB_AVAIL_ADDR 0x100000c
volatile char *const KB_PORT = (volatile char *)KB_DATA_ADDR;
volatile char *const KB_AVAIL = (volatile char *)KB_AVAIL_ADDR;

/* mandatory func to print strings to TTY */
int _write(int file, char *ptr, int len) {
    if (file == 1 || file == 2) {
        int i = 0;
        while (i < len) {
            *TTY_PORT = ptr[i];
	    i++;
        }
        return len;
    }
    else {
	errno = EBADF;
        return -1;
    }
}

/* mandatory func to get input from kb */
int _read(int file, char *ptr, int len) {
    if (len <= 0) return 0;
    if (file == 0) {
        int i = 0;
        while (i < len) {
            while (*KB_AVAIL == 0);
            char c = *KB_PORT;
            ptr[i] = c;
            i++;
            if (c == '\n' || c == '\r') {
                break;
            }
        }
        return i;
    }
    else {
	errno = EBADF;
        return -1;
    }
}

/* dummies for some newlib's dependencies */
int _close(int file) { return -1; }
int _fstat(int file, struct stat *st) { st->st_mode = S_IFCHR; return 0; }
int _isatty(int file) { return 1; }
int _lseek(int file, int ptr, int dir) { return 0; }

/* malloc support */
extern char _end; /* Defined by linker script */
static char *heap_end = &_end;

caddr_t _sbrk(int incr) {
    char *prev_heap_end = heap_end;
    heap_end += incr;
    return (caddr_t)prev_heap_end;
}

void _exit(int status) {
    while(1);
}

int _kill(int pid, int sig) { errno = EINVAL; return -1; }
int _getpid(void) { return 1; }
