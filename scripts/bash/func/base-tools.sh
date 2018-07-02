# ===================
# INFO: base-tools.sh
# ===================


# =================
# VARIABLEN: ssh.sh
# =================
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"

source "$MNVAR/mn-vars.sh"


# =======================
# FUNCTION: base-tools.sh
# =======================
function base.tools.inst {
    # Install Ubuntu Base Tools
    sudo apt-get install htop iftop ncdu
}

# ===================
case $1 in
    "$1")
        $1
        ;;
esac