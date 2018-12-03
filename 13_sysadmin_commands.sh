#################
# FDISK
#################
# After you have installed brand new disk on your server, you have to use tools like fdisk to partition it accordingly
# 5 typical actions with fdisk :
# 1. n - New Partition Creation
# 2. d - Delete existing partition
# 3. p - Print partition table
# 4. w - Write changes to the partition table
# 5. q - Quit fdisk utility

fdisk /dev/sda		# create /dev/sda partition
			# prompts for input. 
			# Enter "p". This will print total space. But in the below table in output, table is empty since no partition
			# Enter "n" for second prompt. This will create new partition
			# Enter number of partitions when prompted for "Partition number"

fdisk /dev/sda		# Verify by entering "p", the table below must show record for the partition



########################
# mke2fsk
########################
# After partitioning the disks, it is still not ready for usage as we need to format the disk.
# At this stage, if you try to view the disk information, it will give following error message indicating no valid superblock is present
# tune2fs -l /dev/sda1
# tune2fs: Bad magic number in super-block whilre tryinh to open /dev/sda1
# Couldnt find valid filesystem superblock
mke2fs /dev/sda1			# format the disk
mke2fs -m 0 -b 4096 /dev/sda1		# m 0: reserved-blocks-percentage: % of filesystem blocks reserved for root user.Default 5%. Set to 0
					# b 4096: block-size in bytes. Valid values are 1024, 2048, 4096 bytes per block
					# will create ext2 filesystem.
mkfs.ext3 /dev/sda1			# create ext3 filesystem
mke2fs -j /dev/sda1



###########################
# MOUNT A PARTITION
###########################
# After creating a partition and formatting, you can mount it to a mount point
# 1. Create a directory where the partition should be mounted
mkdir /home/database
# 2. Mount the file system
mount /dev/sda1 /home/database

# To automatically mount the filesystem after the reboot, add the following entry to "/etc/fstab" :
/dev/sda1 /home/database ext3 default 0 2


#########################
# TUNE2FS
#########################
tune2fs -l /dev/sda1





######################
# USER CREATION
######################
# c - description about the user
# e - expiry date of the user in mm/dd/yy format

useradd testuser		# basic command to add user
adduser -c "Test User - Created for Testing" -e 12/31/09 testuser
grep /etc/passwd		# verify if the user is created

passwd testuser			# change user password
useradd -D			# fetch default values that will be used when an user is created



########################
# GROUP CREATION
######################## 
groupadd dev			# basic group creation
grep dev /etc/group
useradd -G dev testuser		# Add "new user" to existing group.
usermod -g dev testuser		# Add "existing" user to existing group
grep testuser /etc/passwd
id testuser			# get user id
grep testuser /etc/group



###########################
# Passwordless SSH Login
###########################
# Step 1
ssh-keygen			# Generate public/private key pair

# Step 2
ssh-copy-id -i ~/.ssh/id_rsa.pub remotehost	# enter remote host password when prompted
						# ssh-copy-id appends key to .ssh/authorized_keys
ssh remotehost					# you wont be prompted for password

# ssh-copy-id does not check for duplicate entries in authorized_keys


#########################
# CRONTAB
#########################
# Using crontab, you can execute shell scripts or Linux commands at a specific date and time
# Eg. sysadmin can schedule a backup job that will run every day
crontab -e			# Edit the crontab file. This will create a crontab if it doesnt exist
0 5 * * * /root/bin/backup.sh (runs at 5am every day)

# Format : minute hour day-of-month month day-of-week full-path-to-script
# minute 	: 0-59
# hour 		: 0-23
# day-of-month	: 0-31
# month		: 1-12
# day-of-week	: 0-7. Sunday is either 0 or 7


1 0 * * * /opt/backup.sh		# runs at 12:01 am every day
59 11 * * 1,2,3,4,5 /opt/backup.sh	# Mon-Fri at 11:59 am
59 11 * * 1-5 /opt/backup.sh		# Same as above
*/5 * * * * /opt/backup.sh		# Execute every 5 min
10 13 1 * * /opt/backup.sh		# 1:10 pm on 1st day of every month
0 23 * * 1-5 /opt/backup.sh		# 11 pm on weekdays


crontab -l		# display crontab file
crontab -r		# remove crontab file
crontab -ir		# prompt user before deleting a crontab


#################################
# Safe reboot using SysRq Key
#################################
# Magic SysRq is a key combination in Linux Kernel which allows user to perform various low level commands regardless of the systems state
# Used to recover from freezes or to reboot a computer without corrupting the filesystem
# Key combination : ALT + SysRq + COMMANDKEY
# In many systems SysRq key is the printscreen key
echo "1" > /proc/sys/kernel/sysrq
# k - kills all the process running on the current virtual console
# s - attempt to sync all the mounted file system
# b - immediately reboot the system without unmounting partitions or syncing
# e - Sends SIGTERM to all 



#########################
# RSYNC - Remote Sync
#########################
# use to perform backup operation in Linux
# used to synchronize the files and directories from one location to another in an effective way
# Backup location could be on local server or on remote server

# Good things about rsync :
# 1. Speed : 1st time rsync replicates the whole content between source and destination.
# The 2nd time, rsync only transfers changed blocks or bytes to destination. Hence it is fast
# And it can also be used in shaky connections for transfering huge files since it would resume copying only the left portion
# in case of connection failure
# 2. Security : allows encryption of data using ssh protocol during transfer
# 3. Privilege : no special privilege is required to install and execute rsync
# 4. Less bandwidth : uses compression and decompression of data block by block at the sending and receiving end.
# So bandwidth is always less as compared to other file transfer protocols

# rsync options source destination
# z - enable compression
# v - verbose
# r - recursive
rsync -zvr /var/testdir/ /opt/temp/	# local to local. rsync does not preserve file timestamp during sync
rsync -zva /var/testdir/ /opt/temp/	# preserves the file timestamp
# a does the following :
# recursive mode, preserves symbolic links, preserves permissions, preserves timestamps, preserves owner and group

rsync -v /vosboxes@192.168.10.3:/opt/temp/ /opt/temp/				# sync single file
rsync -zva /var/testdir/ osboxes@192.168.10.3:/opt/temp/	# local to remote syncing
								# format username@ip-host:path
rsync -zva osboxes@192.168.10.3:/var/testdir/ /opt/temp		# remote to local syncing



###################
# CHKCONFIG
###################
# to setup, view or change services that are configured to start automatically during system startup
# list - display all services with current startup configuration status
chkconfig --list
chkconfig --list | grep network		# grep output of chkconfig --list
chkconfig --add iptables		# iptables added to the list of startups
chkconfig --del iptables		# remove service from startup



#######################
# Anacron
#######################
# is the cron for desktop and laptops
# it does not expect the system to run 24*7 like a server
# use when you want a bg job to be executed automatically on a machine that is not running 24*7
# eg. if you have backup scheduled at 11 pm as a regular cron job and your laptop is not up till 11 pm, your job will not be executed
# same job is executed using anacron when the laptop is up
# has granularity in days (not time)
# you need to be super user (but there are work arounds to make it run by normal user)

# cron 		: /etc/crontab
# anacron	: /etc/anacrontab

# format of anacron tab :
# period  delay  job-identifier  command

# period :
# 1			- daily
# 7 			- weekly
# 30 (or @monthly)	- monthly
# N 			- can be any numeric value (number of days)

# delay			: no. of minutes anacron must wait before executing the job after the machine starts
# job-identifier 	: is the name for jobs timestamp file. Must be unique for each job. Available under /var/spool/anacron directory
# command		: command or shell script to be executed

 
7 15 test.daily /bin/sh		# script will run after 15 min of machine start without waiting for next 7 days



##########################
# IPTABLES
##########################
iptables -F			# delete existing rules
iptables --flush		# delete existing rules

# Set default chain policy
# default chain policy is ACCEPT
# change this to DROP for all INPUT, FORWARD and OUTPUT
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# When you make both INPUT and OUTPUT policy to DROPm for every firewall rule requirement you have, you must define 2 rules :
# incoming and outgoing
# If you can trust internal users, no need to DROP outgoing packets

# Block specific Ip address
# Useful when you find some strange activities from specific IP address in your log files
BLOCK_IP="192.168.10.1"
iptables -A INPUT -s "$BLOCK_IP" -j DROP

# Block TCP traffic on eth0 connection for this IP
iptables -A INPUT -i eth0 -s "$BLOCK_IP" -j DROP		# or below command
iptables -A INPUT -i eth0 -p tcp -s "$BLOCK_IP" -j DROP



# Allow all incoming SSH
iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT



# Allow SSH from specific network
iptables -A INPUT -i eth0 -p tcp --dport 22 -s 192.168.100.0/24 -m state --state NEW,ESTABLISHED -j ACCEPT
i[tables -A INPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
