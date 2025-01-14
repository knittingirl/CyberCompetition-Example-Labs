#This may take a while on the initial setup
vagrant up
#Occasionally, when setting up multiple labs, the existent recognized SSH fingerprint will change causing Ansible to fail. This line resets the known fingerprint just in case.
#Comment out any lines relating to agents you do not intend to use. Also please deploy all connected agents fully first.

ssh-keygen -R 192.168.56.100

ansible-playbook manager.yml -i inventory.txt --extra-vars 'ansible_password=vagrant ansible_user=vagrant'

ansible-playbook vsftp_agent.yml -i ../VSFTP_Box/inventory.txt --extra-vars 'ansible_password=vagrant ansible_user=vagrant'

ansible-playbook -i ../Windows_Webshell/inventory.txt wazuh_winweb.yml
