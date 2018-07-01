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
source "$MNFUNC/UpdateSystem.sh"
source "$MNFUNC/BaseTools.sh"
source "$MNFUNC/SSH.sh"

# PROGRAM
# =======
confUpdateSystem
instBaseTools
confSSH

#shutdown -r now