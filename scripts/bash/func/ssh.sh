# ============
# INFO: SSH.sh
# ============
# Needed:   my-net/scripts/bash/func/
#               file.sh


# =================
# VARIABLEN: ssh.sh
# =================
MNVAR="$HOME/my-net/env-vars"
MNFUNC="$HOME/my-net/scripts/bash/func"
MNHAND="$HOME/my-net/scripts/bash/handlers"

source "$MNVAR/mn-vars"


# ================
# FUNCTION: SSH.sh
# ================
function ssh.client.conf {
    # Add SSH public key $SSH_PUBLIC_KEY
    if [ ! -d "$HOME/.ssh/" ]
    then
        mkdir "$HOME/.ssh/"
    fi
    if [ ! -f "$HOME/.ssh/authorized_keys" ]
    then
        touch "$HOME/.ssh/authorized_keys"
    fi
    echo "$SSH_PUBLIC_KEY" > "$HOME/.ssh/authorized_keys"
    $MNFUNC/file.sh 'file.line.check' "$HOME/.ssh/authorized_keys" "$SSH_PUBLIC_KEY"
}

function ssh.server.conf {
    # Config SSH Port
    FILE='/etc/ssh/sshd_config'
    SEARCHSTR="#Port 22"
    REPLACESTR="Port $SSH_PORT"
    $MNFUNC/file.sh 'file.line.change' "$FILE" "$SEARCHSTR" "$REPLACESTR"
    $MNFUNC/file.sh 'file.line.check' "$FILE" "$REPLACESTR"
    
    # Restart SSH Daemon
    sudo service ssh restart
}

# ================
case $1 in
    "$1")
        $1
        ;;
esac