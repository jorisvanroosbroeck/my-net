# ====================
# INFO: base-system.sh
# ====================
# Needed:   my-net/scripts/bash/func/
#               file.sh


# =================
# VARIABLEN: ssh.sh
# =================
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"
MNHAND="$HOME/my-net/scripts/bash/handlers"
source "$MNVAR/mn-vars"


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

function base.net.clean {
    PATH=$1

    $MNFUNC/files.sh "$PATH"
}

function base.net.ip.dhcp {
    FILE=$1
    MSG=$2
    IFACE=$3

    sed -i "$ a\# My-Net: $IFACE - $MSG" $FILE
    sed -i "$ a\auto $IFACE" $FILE
    sed -i "$ a\iface $IFACE inet dhcp"
}

function base.net.ip.static {
    FILE=$1
    MSG=$2
    IFACE=$3
    IP=$4
    GW=$5
    DNS=$6
    SRCH=$7

    sed -i "$ a\# My-Net: $IFACE - $MSG" $FILE
    sed -i "$ a\auto $IFACE" $FILE
    sed -i "$ a\iface $IFACE inet static" $FILE
    sed -i "$ a\t\addresst\ $IP" $FILE
    sed -i "$ a\t\gatewayt\ $GW" $FILE
    sed -i "$ a\t\nameservert\ $DNS" $FILE
    sed -i "$ a\t\searcht\ $SRCH" $FILE
}

function base.net.ip.other.static {
    FILE=$1
    MSG=$2
    IFACE=$3
    IP=$4

    sed -i "$ a\# My-Net: $IFACE - $MSG" $FILE
    sed -i "$ a\auto $IFACE" $FILE
    sed -i "$ a\iface $IFACE inet static" $FILE
    sed -i "$ a\t\addresst\ $IP" $FILE
}

function base.net.bridge.inst {
    # Install needed tools
    sudo apt-get -y install bridge-utils
}

function base.net.bridge.ip.dhcp {
    base.system.net.ip.dhcp "$1" "$2" "$3"
    # Hier moet nog extra code komen voor connectie naar netwerkcard
}

function base.net.bridge.ip.static {
    base.system.net.ip.static "$1" "$2" "$3" "$4" "$5" "$6" "$7"
    sed -i "$ a\t\t\blablabla" $1
    sed -i "$ a\t\t\blablabla" $1
    sed -i "$ a\t\t\blablabla" $1
}

# ========================
case $1 in
    "$1")
        $1
        ;;
esac