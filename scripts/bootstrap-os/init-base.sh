#!/bin/bash

# VARIABLEN
# =========

# FUNCTIONS
# =========
function updateBase {
    # Do Release Update
    sudo do-release-upgrade

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
    mkdir .ssh/
    touch .ssh/authorized_keys
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNYLhu/zjnPWyw6XRJokLhnfmkiJQl9JpZM7eThtGFPreOpNHAIkpIysQ1BZDIwjEIAKF6TT1Kzethx0Ux+yxo6PNz8PXWhOKd2pXEk0GwmqN7TuN614wWBs2sCPu99yqyRx1C/m8z6vA+ehiWYPJD/gJYLygz7B/bfVw6yNviOF9KBE/RxFdQTxD19CPpbXBt6THIn7opRMiHFm/NhxSPqTzU89OPa0TlbEzA96VcI1fN4XH9U3+nazW5qvXlBRBEExBmlgYFr9fAWGFvVDWl01nvqKUVrodTaXoISOW1juB8/+yFNusoeIq4rqKCdGMc7b6+ndl2LT4dv5+t6nGj farique@temp-01" > .ssh/authorized_keys

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