# ===================
# INFO: base-tools.sh
# ===================
# $SSH_PUBLIC_KEY = Mandatory in calling script!

# =======================
# FUNCTION: base-tools.sh
# =======================
function instBaseTools {
    # Install Ubuntu Base Tools
    sudo apt-get install htop iftop ncdu
}