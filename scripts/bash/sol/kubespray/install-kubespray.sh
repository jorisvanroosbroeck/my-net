#!/bin/bash

# ==========================
# INFO: install-kubespray.sh
# ==========================
# Needed:   my-net/scripts/bash/func
#               ssh.sh


# ===============================
# VARIABLEN: install-kubespray.sh
# ===============================
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"
MNHAND="$HOME/my-net/scripts/bash/handlers"
MNFILE="$HOME/my-net/files"
ANSIBLEHOSTFILE="$HOME/kubespray/inventory/k8sswiss/hosts.ini"
ANSIBLEROLEPATH="$HOME/my-net/scripts/ansible"

SCRIPTNAME=${0##*/}
SCRIPTDIR=${0%/*}
SCRIPTFULLDIR=$(readlink -f $0)
SCRIPTFULLDIR=`dirname $SCRIPTFULLDIR`
TIMESTAMP=" "
LOGFILE=" "


# ===============================
# FUNCTIONS: install-kubespray.sh
# ===============================
function createLogFile {
    LOGDIR="$HOME/LOG/" 
    TIMESTAMP=`getDate`
    LOGFILE="$LOGDIR$SCRIPTNAME-$TIMESTAMP.log"

    if [ ! -d "$LOGDIR" ]
    then
        mkdir "$LOGDIR"
    fi
    
    TIMESTAMP=`date +"%Y%m%d-%H%M%S"`
    touch $LOGFILE

    exec > >(tee -a ${LOGFILE} )
    exec 2> >(tee -a ${LOGFILE} >&2)
}

function getDate {
    date +"%Y%m%d-%H%M%S"
}

function stateScript {
    STATE=$1
    TIMESTAMP=`getDate`

    if [ "$STATE" == "Start" ]
    then
        echo " "
        echo "=========== BEGIN - $SCRIPTNAME - $TIMESTAMP =========================="
        echo "Script Directory: $SCRIPTDIR"
        echo "Script Full Path: $SCRIPTFULLDIR"
	echo " "
    fi

    if [ "$STATE" == "End" ]
    then
	    echo " "
	    echo "Log file path: $LOGFILE"
	    echo " "
        echo "========== END - $SCRIPTNAME - $TIMESTAMP ============================="
        echo " "
    fi
}

function confSsh {
    # Create SSH private key
    SSHKEYFILE="$HOME/my-net/files/ssh/id_rsa"
    $MNFUNC/ssh.ssh 'ssh.client.key.new' $SSHKEYFILE
}

function createInfra {
    # Create Infra: Run Terraform Code

    # Get Bastion IP
    $CONSTRING=`terraform output control_machine_address`
    EXTIP=awk '{split($VAR, a, ":"); print a[1]}' <<< $CONSTRING
    EXTPORT=awk '{split($VAR, a, ":"); print a[2]}' <<< $CONSTRING
    echo "$EXTIP"
    echo "$EXTPORT"
}

function confKubespray {
    TIMESTAMP=`getDate`
    
    echo " "
    echo "========== $TIMESTAMP - Configure Kubespray =========="
    echo " "

    # Install Python requirements
    sudo apt-get install python python-pip -y

    # Install Kubespray requirements
    pip install -r kubespray/requirements.txt

    # Create host.ini file

    # Playbooks: Prepaire Kubernetes Cluster
    ansible-playbook --ask-become-pass -b -i $ANSIBLEHOSTFILE $ANSIBLEROLEPATH/config-k8s-cluster.yml
}

function instKubespray {
    TIMESTAMP=`getDate`
    
    echo " "
    echo "========== $TIMESTAMP - Install Kubespray =========="
    echo " "

    # Playbook: Install Kubernetes Cluster
    echo "ansible-playbook --ask-become-pass -b -i $ANSIBLEHOSTFILE kubespray/cluster.yml"
}


# =============================
# PROGRAM: install-kubespray.sh
# =============================
createLogFile
stateScript 'Start'
confSsh
createInfra
confKubespray
instKubespray
stateScript 'End'