#!/bin/bash
set -e

USER="r"
GROUP="r"
USER_ID=${USER_ID:-1000}
GROUP_ID=${USER_ID:-1000}
R_DIR=/R/R-dyntrace
R_LIBS=/work/data/library

ENV_FILE=/etc/environment

echo "R_DIR=\"$R_DIR\"" > $ENV_FILE
echo "PATH=\"$PATH\"" >> $ENV_FILE
echo "IN_DOCKER=1" >> $ENV_FILE
echo "R_LIBS=\"$R_LIBS\"" >> $ENV_FILE

groupmod -g $GROUP_ID $GROUP &>/dev/null
usermod -u $USER_ID -g $GROUP_ID $USER &>/dev/null

if [ -z "$NO_X11" ]; then
    local_display=:6
    echo "Starting Xvfb..."
    nohup Xvfb $local_display -screen 0 1280x1024x24 &>/var/log/Xvfb.log &
    sleep 1

    export DISPLAY=$local_display
    if ! xdpyinfo &>/dev/null; then
        echo "There is something wrong with the Xvfb server." >&2
        exit 1
    else
        echo "DISPLAY=\"$DISPLAY\"" >> $ENV_FILE
    fi
fi

if [ -z "$NO_EXEC_SUDO" ]; then
     # not setting home will source the wrong .bashrc (/root/.bashrc)
     exec sudo -u $USER HOME="/home/$USER" "$@"
else
     exec "$@"
fi

