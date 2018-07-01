#!/bin/bash

# ================
# INFO: testing.sh
# ================


# VARIABLEN
# =========
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"

source "$MNVAR/mn-vars.sh"

# FUNCTIONS
# =========
source "$MNFUNC/base-system.sh"

# PROGRAM
# =======
base.system.upgrade-release