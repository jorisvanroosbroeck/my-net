# ============
# INFO: lxc.sh
# ============

# ================
# FUNCTION: lxc.sh
# ================
function lxc.inst {
    # Install needed tools
    sudo apt-get install lxc

    # Initial lxd daemon
    sudo lxd init --auto
}