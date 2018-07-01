#!/bin/bash

# ==================
# INFO: init-base.sh
# ==================


# VARIABLEN
# =========
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"

source "$MNVAR/mn-vars.sh"

# FUNCTIONS
# =========
source "$MNFUNC/base-system.sh"
source "$MNFUNC/base-tools.sh"
source "$MNFUNC/ssh.sh"

# PROGRAM
# =======
confUpdateSystem
instBaseTools
ssh.client.conf

#shutdown -r now