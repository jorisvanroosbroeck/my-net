# ================
# INFO: ansible.sh
# ================


# ====================
# FUNCTION: ansible.sh
# ====================
function ansible.inst {
    # Install "software-properties-commen" voor Python libraries
    # Dit is nodig om goed met PPA te kunnen werken
    apt-get install software-properties-common
    # Add PPA Ansible to system
    sudo apt-add-repository -y ppa:ansible/ansible
    # Update repository
    sudo apt-get update
    # Install Ansible
    sudo apt-get install -y ansible
}

function ansible.conf {
    # Enable logging for Ansible
    FILE='/etc/ansible/ansible.cfg'
    SEARCHSTR="#log_path = \/var\/log\/ansible.log"
    REPLACESTR="log_path = \/var\/log\/ansible.log"
    changeLine "$FILE" "$SEARCHSTR" "$REPLACESTR"

    # Ansible-Playbook fail, put file in Retry Folder
    FILE='/etc/ansible/ansible.cfg'
    SEARCHSTR="#retry_files_enabled = False"
    REPLACESTR="retry_files_enabled = False"
    changeLine "$FILE" "$SEARCHSTR" "$REPLACESTR"

    RETRYDIR="RETRY"
    SEARCHSTR="#retry_files_save_path = ~\/.ansible-retry"
    REPLACESTR="retry_files_save_path = $SCRIPTDIR\/$RETRYDIR"
    changeLine "$FILE" "$SEARCHSTR" "$REPLACESTR"
    if [ ! -d "$RETRYDIR" ]
    then
        mkdir "$RETRYDIR"
    fi

    # Check Configured Options Ansible
    FILE="/etc/ansible/ansible.cfg"
    CHECKSTRING='log_path = /var/log/ansible.log'
    checkConfig $FILE $CHECKSTRING

    CHECKSTRING='retry_files_enabled = False'
    checkConfig $FILE $CHECKSTRING
}

function ansible.hostfile {
    FILE="/etc/ansible/hosts"

    sed -i "$ a\ " $FILE
    sed -i "$ a\[jumpers]" $FILE
    sed -i "$ a\bastion" $FILE
    sed -i "$ a\ " $FILE
    sed -i "$ a\[masters]" $FILE
    sed -i "$ a\master01" $FILE
    sed -i "$ a\master02" $FILE
    sed -i "$ a\master03" $FILE
    sed -i "$ a\ " $FILE
    sed -i "$ a\[infra]" $FILE
    sed -i "$ a\infra01" $FILE
    sed -i "$ a\infra02" $FILE
    sed -i "$ a\ " $FILE
    sed -i "$ a\[nodes]" $FILE
    sed -i "$ a\node01" $FILE
    sed -i "$ a\node02" $FILE
    sed -i "$ a\node03" $FILE
}

# ====================
case $1 in
    "$1")
        $1
        ;;
esac