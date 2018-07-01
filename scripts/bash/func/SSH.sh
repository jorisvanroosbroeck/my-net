# ============
# INFO: SSH.sh
# ============
# $SSH_PUBLIC_KEY = Mandatory in calling script!

# ================
# FUNCTION: SSH.sh
# ================
function confSSH {
    # Add SSH public key
    mkdir "$HOME/.ssh/"
    touch "$HOME/.ssh/authorized_keys"
    echo "$SSH_PUBLIC_KEY" > "$HOME/.ssh/authorized_keys"

    # Config SSH Port

    # Restart SSH Daemon
    sudo service ssh restart
}