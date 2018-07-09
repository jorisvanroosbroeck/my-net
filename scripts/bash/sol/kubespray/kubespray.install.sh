DIR="/mnt/c/Users/JorisVanRoosbroeck/Documents/Visual Studio Code/github.com/my-net"
cat $DIR"/scripts/terraform/sol/hiag/k8sswiss/terraform.tfstate" | grep -i "network_adapter.0.ip_address"