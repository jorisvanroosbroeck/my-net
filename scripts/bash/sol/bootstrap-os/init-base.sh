#!/bin/bash

# ==================
# INFO: init-base.sh
# ==================


# VARIABLEN
# =========
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"
MNHAND="$HOME/my-net/scripts/bash/handlers"

source "$MNVAR/mn-vars.sh"

# FUNCTIONS
# =========
source "$MNFUNC/base-system.sh"
source "$MNFUNC/base-tools.sh"
source "$MNFUNC/ssh.sh"
source "$MNHAND/file.sh"

# PROGRAM
# =======
base.system.upgrade-full
base.tools.inst
ssh.client.conf
ssh.server.conf
base.system.clean


# =================
case $1 in
    "--reboot")
        shutdown -r now
        ;;
    "-r")
        shutdown -r now
        ;;
esac