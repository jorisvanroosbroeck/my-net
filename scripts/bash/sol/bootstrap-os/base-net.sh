#!/bin/bash

# =================
# INFO: base-net.sh
# =================


# ======================
# VARIABLEN: base-net.sh
# ======================
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"
MNHAND="$HOME/my-net/scripts/bash/handlers"
source "$MNVAR/mn-vars"

FILE="/etc/networking/interfaces"
MSG="Management Network"
IFACE="eth0"
IP="10.254.254.252/24"
GW="10.254.254.254"
DNS="8.8.8.8"
SRCH="google.com"


# =====================
# FUNCTION: base-net.sh
# =====================


# ====================
# PROGRAM: base-net.sh
# ====================
sed -i "$ a\# ======================================" $FILE
sed -i "$ a\# My-Net - FrameWork v.01: Configuration" $FILE
sed -i "$ a\# ======================================" $FILE
sed -i "$ a\ " $FILE
# ==== Default GW Network
$MNFUNC/base-system.sh 'base.net.clean' $FILE
$MNFUNC/base-system.sh 'base.net.ip.static' "$FILE" "$MSG" "$IFACE" "$IP" "$GW" "$DNS" "$SRCH"
sed -i "$ a\ " $FILE
# ==== Other Networks
MSG="My-Net Network"
IFACE="eth1"
IP="10.254.253.252/24"
GW="10.254.253.254"
$MNFUNC/base-system.sh 'base.net.ip.other.static' "$FILE" "$MSG" "$IFACE" "$IP"
sed -i "$ a\ " $FILE


# ====================================
case $1 in
    "$1")
        $1
        ;;
esac