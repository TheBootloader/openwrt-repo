#!/bin/sh

svn up
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make menuconfig
