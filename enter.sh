#!/bin/bash

docker run --rm -ti -v $(pwd):/work -e USER_ID=$(id -u) -e NO_X11=$NO_X11 -e GROUP_ID=$(id -g) -w /work prlprg/sle22-signatr bash
