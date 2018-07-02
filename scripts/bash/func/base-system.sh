# ====================
# INFO: base-system.sh
# ====================

# ========================
# FUNCTION: base-system.sh
# ========================
function base.system.upgrade-full {
    # Update Package Repository
    sudo apt-get update -y
    # Update Packages System
    sudo apt-get upgrade -y
    # Upgrade Packages System
    sudo apt-get dist-upgrade -y
}

function base.system.upgrade-release {
    # Upgrade to new LTS version of Ubuntu Server
    sudo do-release-upgrade
}

function base.system.clean {
    sudo apt-get autoremove
    sudo apt-get autoclean
}

function base.system.net.ip.dhcp {
    #
}

function base.system.net.ip.static {
    #
}

function base.system.net.bridge.inst {
    # Install needed tools
    sudo apt-get -y install bridge-utils
}

function base.system.net.bridge.ip.dhcp {
    #
}

function base.system.net.bridge.ip.static {
    #
}

# ========================
case $1 in
    "$1")
        $1
        ;;
esac