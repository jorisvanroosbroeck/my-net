# ===================
# INFO: base-tools.sh
# ===================
# $SSH_PUBLIC_KEY = Mandatory in calling script!

# =======================
# FUNCTION: base-tools.sh
# =======================
function base.tools.inst {
    # Install Ubuntu Base Tools
    sudo apt-get install htop iftop ncdu
}

case $1 in
    "$1")
        ;;
esac