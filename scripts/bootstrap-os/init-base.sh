# @ECHO off

# VARIABLEN
# =========

# FUNCTIONS
# =========
function updateBase {
    # Update & Upgrade System
    sudo apt-get Update -y
    sudo apt-get upgrade -y
    sudo apt-get dist-upgrade
}

function installBaseTools {
    sudo apt-get install htop iftop ncdu
}

function configSSH {
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
rebootHost