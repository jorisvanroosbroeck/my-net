#!/bin/bash

# ==================
# INFO: init-base.sh
# ==================
# Needed:   my-net/scripts/bash/func/
#               base-system.sh
#               base-tools.sh
#               ssh.sh
#               file.sh

# VARIABLEN
# =========
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"
MNHAND="$HOME/my-net/scripts/bash/handlers"

source "$MNVAR/mn-vars.sh"


# FUNCTIONS
# =========


# PROGRAM
# =======
$MNFUNC/base-system.sh "base.system.upgrade-full"
$MNFUNC/base-tools.sh "base.tools.inst"
$MNFUNC/ssh.sh "ssh.client.conf"
$MNHAND/file.sh "ssh.server.conf"
$MNFUNC/base-system.sh "base.system.clean"


# =================
case $1 in
    "reboot")
        # Seems not to work yet...
        # Priviles
        sudo shutdown -r now
        ;;
esac