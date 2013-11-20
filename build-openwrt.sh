#!/bin/sh

ionice -c 3 nice -n 19 make world -j 5
