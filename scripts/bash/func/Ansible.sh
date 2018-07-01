# ================
# INFO: ansible.sh
# ================
# $SSH_PUBLIC_KEY = Mandatory in calling script!

# ====================
# FUNCTION: ansible.sh
# ====================
function instAnsible {
    # Install Ansible
    sudo apt-get install ansible -y
}
function confAnsible {
    # Configure Ansible
}