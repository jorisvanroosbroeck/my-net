# ============
# INFO: SSH.sh
# ============
# $SSH_PUBLIC_KEY = Mandatory in calling script!
# $SSH_PORT = Mandatory in calling script!
# my-net/scripts/func/file.sh = Mandatory in calling script!

# ================
# FUNCTION: SSH.sh
# ================
function ssh.client.conf {
    # Add SSH public key
    if [ ! -d "$HOME/.ssh/" ]
    then
        mkdir "$HOME/.ssh/"
    fi
    if [ ! -f "$HOME/.ssh/authorized_keys" ]
    then
        touch "$HOME/.ssh/authorized_keys"
    fi
    echo "$SSH_PUBLIC_KEY" > "$HOME/.ssh/authorized_keys"
}

function ssh.server.conf {
    # Config SSH Port
    FILE='/etc/ssh/sshd_config'
    SEARCHSTR="#Port 22"
    REPLACESTR="Port $SSH_PORT"
    file.line.change "$FILE" "$SEARCHSTR" "$REPLACESTR"
    file.line.check "$FILE" "$REPLACESTR"

    # Restart SSH Daemon
    sudo service ssh restart
}