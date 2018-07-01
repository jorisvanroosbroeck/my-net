#!/bin/bash

# VARIABLEN
# =========
source "$HOME/my-net/env-vars/mn-vars.sh"

# FUNCTIONS
# =========
function updateBase {
    # Update & Upgrade System
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get dist-upgrade -y
}

function installBaseTools {
    # Install Needed Tools
    sudo apt-get install htop iftop ncdu -y

    # Install Security Tools
}

function configSSH {
    # Add SSH public key
    mkdir "$HOME/.ssh/"
    touch "$HOME.ssh/authorized_keys"
    echo "$SSH_PUBLIC_KEY" > "$HOME/.ssh/authorized_keys"

    # Config SSH Port

    # Start SSH Daemon
    sudo service ssh start
}

function rebootHost {
    sudo shutdown -r now
}

# PROGRAM
# =======
updateBase
installBaseTools
configSSH
#rebootHost