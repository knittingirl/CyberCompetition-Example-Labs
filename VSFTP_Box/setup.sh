sudo apt-get -y install build-essential
sudo apt-get -y install make
sudo apt-get -y install gcc
 sed -i "s/^LINK	=	-Wl,-s*/LINK	=	-Wl,-s,-lcrypt/" Makefile
make


sudo useradd nobody
sudo mkdir /usr/share/empty

sudo cp vsftpd /usr/local/sbin/vsftpd
sudo cp vsftpd.8 /usr/local/man/man8
sudo cp vsftpd.conf.5 /usr/local/man/man5
sudo cp vsftpd.conf /etc

sudo mkdir /var/ftp/
useradd -d /var/ftp ftp

sudo chown root:root /var/ftp
sudo chmod og-w /var/ftp

sudo sed -i "s/^#local_enable=YES*/local_enable=YES\nftp_username=nobody/" /etc/vsftpd.conf
sudo bash -c "echo 'flag{vsftpd_exploit_is_fun}' > /root/root.txt"
