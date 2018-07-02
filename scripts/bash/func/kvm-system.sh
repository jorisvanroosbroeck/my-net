# ============
# INFO: kvm.sh
# ============


# =================
# VARIABLEN: kvm.sh
# =================
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"
MNHAND="$HOME/my-net/scripts/bash/handlers"


# ================
# FUNCTION: kvm.sh
# ================
function kvm.system.conf {
    # Install needed tools
    sudo apt-get -y ubuntu-vm-builder bridge-utils

    # Install kvm / qemu
    sudo apt-get -y install qemu-kvm libvirt-bin

    # Add $USR to group
    sudo adduser $USR libvirtd
}

# ====================================
case $1 in
    "$1")
        $1
        ;;
esac