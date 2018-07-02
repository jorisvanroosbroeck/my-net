# ===================
# INFO: base-tools.sh
# ===================


# =================
# VARIABLEN: ssh.sh
# =================
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"
MNHAND="$HOME/my-net/scripts/bash/handlers"

source "$MNVAR/mn-vars.sh"


# =======================
# FUNCTION: base-tools.sh
# =======================
function base.tools.inst {
    # Install Ubuntu Base Tools
    sudo apt-get -y install htop
    sudo apt-get -y install iftop
    sudo apt-get -y ncdu
}

function base.security.inst {
    # Install Security Tools
    sudo apt-get -y install rkhunter
    sudo apt-get -y install chkrootkit
}

# ===================
case $1 in
    "$1")
        $1
        ;;
esac