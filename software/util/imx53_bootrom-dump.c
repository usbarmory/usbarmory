/*
 * Simple utility to dump NXP i.MX53 internal Boot ROM
 *
 * i.MX53 Boot ROM mapping:
 *   0x00000000 - 0x00003FFF 16KB
 *   0x00404000 - 0x0040FFFF 48KB
 *
 * Instructions:
 *
 * gcc -o imx53_bootrom-dump imx53_bootrom-dump.c
 *
 * sudo ./imx53_bootrom-dump 0x00000000 16 > imx53-bootrom-16K.bin
 * sudo ./imx53_bootrom-dump 0x00404000 48 > imx53-bootrom-48K.bin
 *
 * Based on devmem2.c by Jan-Derk Bakker
 *  Copyright (C) 2000, Jan-Derk Bakker (jdb@lartmaker.nl)
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
 * Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <fcntl.h>
#include <ctype.h>
#include <termios.h>
#include <sys/types.h>
#include <sys/mman.h>

#define FATAL do { fprintf(stderr, "Error at line %d, file %s (%d) [%s]\n", \
  __LINE__, __FILE__, errno, strerror(errno)); exit(1); } while(0)
 
#define MAP_SIZE 1048576UL
#define MAP_MASK (MAP_SIZE - 1)

int main(int argc, char **argv) {
	int fd;
	int i, size;
	void *map_base, *virt_addr; 
	unsigned long read_result, writeval;
	off_t target;

	if ((argc < 3) || (strcmp(argv[1], "-h") == 0)) {
		fprintf(stderr, "\nUsage:\t%s <address> <len>\n"
			"\taddress : memory address to read\n"
			"\tlen	: number of KB to be read\n\n",
			argv[0]);
		fprintf(stderr, "\t%s 0x00000000 16 > bootrom-0-16k.bin\n", argv[0]);
		fprintf(stderr, "\t%s 0x00404000 48 > bootrom-1-48k.bin\n", argv[0]);
		exit(1);
	}
	target = strtoul(argv[1], 0, 0);
	size = strtoul(argv[2], 0, 0);
	size *= 1024;

	if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1) FATAL;
	fprintf(stderr, "/dev/mem opened.\n"); 
	fflush(stderr);

	/* Map one page */
	map_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, target & ~MAP_MASK);
	if(map_base == (void *) -1) FATAL;
	fprintf(stderr, "Memory mapped at address %p.\n", map_base);
	fflush(stderr);

	for (i = 0; i < size; i++) {
		virt_addr = map_base + ((target + i) & MAP_MASK);
		read_result = *((unsigned char *) virt_addr);
		write(1, &read_result, 1);
	}

	fflush(stdout);

	if (munmap(map_base, MAP_SIZE) == -1) FATAL;
	target += MAP_SIZE;

	close(fd);
	return 0;
}
