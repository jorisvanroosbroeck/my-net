# ====================
# INFO: base-system.sh
# ====================

# ========================
# FUNCTION: base-system.sh
# ========================
function base.system.upgrade-full {
    # Update Package Repository
    sudo apt-get update -y
    # Update Packages System
    sudo apt-get upgrade -y
    # Upgrade Packages System
    sudo apt-get dist-upgrade -y
}