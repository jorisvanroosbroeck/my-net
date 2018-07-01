function confSSH {
    # Add SSH public key
    mkdir "$HOME/.ssh/"
    touch "$HOME.ssh/authorized_keys"
    echo "$SSH_PUBLIC_KEY" > "$HOME/.ssh/authorized_keys"

    # Config SSH Port

    # Start SSH Daemon
    sudo service ssh start
}