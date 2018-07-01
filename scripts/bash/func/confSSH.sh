function confSSH {
    # Variablen
    SSH_PUBLIC_KEY=$1

    # Add SSH public key
    mkdir .ssh/
    touch .ssh/authorized_keys
    echo "$SSH_PUBLIC_KEY" > .ssh/authorized_keys

    # Config SSH Port

    # Start SSH Daemon
    sudo service ssh start
}