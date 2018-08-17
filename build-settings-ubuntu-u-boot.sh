#!/usr/bin/env bash

########################################################################
#
# Copyright (C) 2015 Martin Wimpress <code@ubuntu-mate.org>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
########################################################################

FLAVOUR="ubuntu-u-boot"
FLAVOUR_NAME="Ubuntu"
RELEASE="xenial"
VERSION="16.04.2"
QUALITY="beta"

# Either 'ext4' or 'f2fs'
FS_TYPE="ext4"

# Target image size, will be represented in GB
FS_SIZE=2

# Either 0 or 1.
# - 0 don't make generic rootfs tarball
# - 1 make a generic rootfs tarball
MAKE_TARBALL=0

TARBALL="${FLAVOUR}-${VERSION}${QUALITY}-server-armhf-rootfs.tar.bz2"
IMAGE="${FLAVOUR}-${VERSION}${QUALITY}-server-armhf-raspberry-pi.img"
BASEDIR=${HOME}/PiFlavourMaker/${RELEASE}
BUILDDIR=${BASEDIR}/${FLAVOUR}
BASE_R=${BASEDIR}/base
DESKTOP_R=${BUILDDIR}/desktop
DEVICE_R=${BUILDDIR}/pi
ARCH=$(uname -m)

# CROSS COMPILER will be installed in /opt
# Path to tree will be /opt/$CROSS_INSTALL/$CROSS_BASE
# DO NOT specify /opt here, it will be forced later.
CROSS_INSTALL=linaro
CROSS_ARCH=arm-linux-gnueabihf
CROSS_RELEASE=gcc-linaro-6.4.1-2018.05-x86_64_${CROSS_ARCH}
CROSS_SOURCE=https://releases.linaro.org/components/toolchain/binaries/6.4-2018.05/${CROSS_ARCH}/${CROSS_RELEASE}.tar.xz

# KERNEL tree will be relative to your HOME.
# DO not specify it in the path here, it will be enforced later
KERNEL_TREE=github/raspberrypi/linux

# U-BOOT tree will be relative to your HOME.
# DO not specify it in the path here, it will be enforced later
U_BOOT_TREE=github/raspberrypi/u-boot

export TZ=UTC

