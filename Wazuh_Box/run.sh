#This may take a while on the initial setup
vagrant up
#Occasionally, when setting up multiple labs, the existent recognized SSH fingerprint will change causing Ansible to fail. This line resets the known fingerprint just in case.
#Please deploy all connected agents fully first.

ssh-keygen -R 192.168.56.100

#ansible-playbook manager.yml -i inventory.txt --extra-vars 'ansible_password=vagrant ansible_user=vagrant'

echo "Are we attaching the VSFTP lab? y/N"

read proceed

if [[ $proceed == "y" ]]; then
        ansible-playbook vsftp_agent.yml -i ../VSFTP_Box/inventory.txt --extra-vars 'ansible_password=vagrant ansible_user=vagrant'
fi
echo "Are we attaching the pwnable Linux lab? y/N"

read proceed2

if [[ $proceed2 == "y" ]]; then
        ansible-playbook pwnable_agent.yml -i ../Pwnable_Linux/inventory.txt --extra-vars 'ansible_password=vagrant ansible_user=vagrant'
fi
echo "Are we attaching the Windows webshell lab? y/N"

read proceed3

if [[ $proceed3 == "y" ]]; then
        ansible-playbook -i ../Windows_Webshell/inventory.txt wazuh_winweb.yml
fi
