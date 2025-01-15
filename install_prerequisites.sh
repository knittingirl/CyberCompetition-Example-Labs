#! /bin/bash

sudo apt-get update
#Cloning the repository

sudo apt install -y git-all
#Pre-requisites for VMware
sudo apt install -y gcc
sudo apt install -y gcc-12
sudo apt install -y make

git clone https://github.com/Orange-Cyberdefense/GOAD.git
echo "If you do not already have VMware Workstation, you will need to download from Broadcom's website yourself at https://www.vmware.com/products/desktop-hypervisor.html. Ensure that the appropriate bundle file is in the same directory as this script"

chmod +x VMware-Workstation*

./VMware-Workstation* --eulas-agreed
vmware-modconfig --console --install-all



cd GOAD/

#apt-get install open-vm-tools-desktop
echo "Installing vagrant"
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant

vagrant plugin install vagrant-reload

vagrant plugin install vagrant-vmware-desktop
vagrant plugin install winrm
vagrant plugin install winrm-fs
vagrant plugin install winrm-elevated

#vmware-vagrant-utility is also a problem btw. Can do a static link for now
sudo apt install -y curl
curl https://releases.hashicorp.com/vagrant-vmware-utility/1.0.22/vagrant-vmware-utility_1.0.22-1_amd64.deb > vagrant-vmware-utility_1.0.22-1_amd64.deb
sudo apt install vagrant-vmware-utility_1.0.22-1_amd64.deb
#Getting docker

sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
