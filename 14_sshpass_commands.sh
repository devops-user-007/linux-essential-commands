apt-get install sshpass -y
1. sshpass -p 'mypassword' vagrant@192.168.20.2 'df -h'

2. Using environment variable
export SSHPASS='root'
sshpass -e ssh vagrant@192.168.20.2 'df -h'

3. Using a file to permanently store the password
nano /etc/profile
export SSHPASS='mypassword'	# write this in the file
source /etc/profile
sshpass -f /etc/profile ssh vagrant@192.168.20.2 'df -h'


4. Transfer files using scp and sshpass
scp -r /var/www/html/ index.html --rsh="sshpass -e ssh -l vagrant" 192.168.20.3:/var/www/html/

5. Transfer files using rsync and sshpass
rsync --rsh="sshpass -e ssh -l vagrant"  192.168.20.3:/data/backup /backup
