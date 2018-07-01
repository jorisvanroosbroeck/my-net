#!/bin/bash

# VARIABLEN
# =========
source "$HOME/my-net/env-vars/mn-vars.sh"

# FUNCTIONS
# =========
function rebootHost {
    sudo shutdown -r now
}

# PROGRAM
# =======
source "$HOME/my-net/scripts/bash/func/confUpdateSystem.sh"
source "$HOME/my-net/scripts/bash/func/instBaseTools.sh"
source "$HOME/my-net/scripts/bash/func/confSSH.sh"
#rebootHost