#!/bin/bash

# VARIABLEN
# =========
source "$HOME/my-net/env-vars/mn-vars.sh"

# FUNCTIONS
# =========
source "$HOME/my-net/scripts/bash/func/confUpdateSystem.sh"
source "$HOME/my-net/scripts/bash/func/instBaseTools.sh"
source "$HOME/my-net/scripts/bash/func/confSSH.sh"

function rebootHost {
    sudo shutdown -r now
}

# PROGRAM
# =======
confUpdateSystem
instBaseTools
confSSH
#rebootHost