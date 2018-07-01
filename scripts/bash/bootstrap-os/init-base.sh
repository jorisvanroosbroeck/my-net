#!/bin/bash

# VARIABLEN
# =========
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"
source "$MNVAR/mn-vars.sh"

# FUNCTIONS
# =========
source "$MNFUNC/confUpdateSystem.sh"
source "$MNFUNC/instBaseTools.sh"
source "$MNFUNC/confSSH.sh"

# PROGRAM
# =======
confUpdateSystem
instBaseTools
confSSH

#shutdown -r now