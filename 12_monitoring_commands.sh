#######################
# MONITORING
#######################

# Commands we will look into :
# 1. free - displays all the necessary information about system "physical (RAM)" and "swap" memory
# 2. top  - displays real time information about various performance metrics of the system viz CPU and Memory Usage, Processes list, etc
# 3. df   - displays amount of total and free disk space available on the mounted filesystems
# 4. du   - prints file space usage for a particular directory and its subdirectories
# 5. lsof - lists all open files in the system (includes network connection, devices and directories)
# 6. vmstat  - Monitor performance of the system
# 7. netstat - Displays network related information like network connections, route tables, etc.
# 8. sysctl  - Helps to configure Linux Kernel parameters during runtime
# 9. nice    - 
# 10. renice - 
# 11. kill   - 
# 12. ps     - 
# 13. sar    - 

# free - displays all the necessary information about system "physical (RAM)" and "swap" memory
# m - displays values in "MB"
# t - displays "Total" line which is sum of physical and swap memory values
# o - hide the buffers/cache line from the above example ("not working")

free			# show RAM and swap of the system
free -mt		# Total memory on system including RAM and Swap



###########################
# TOP
###########################
# top - displays real time information about various performance metrics of the system such as :
# CPU Load, Memory Usage, Processes list, etc

# "Output of top command : "
# Line 1   - "Top" indicates no. of days the system has been up and running
# Line 2   - "Tasks" total no. of processes along with breakdown of running, sleeping, stopped and zombie processes count
# Line 3   - "CPU(s)" current CPU Utilization of the system
# Line 4,5 - "Mem, Swap" Memory information from the "free" command
# Rest	   - active processes on the system, sorted default by CPU usage (most intensive processes on top by default)

top		# displays current CPU usage and System status. Press "Q" or "CTRL + C" to execute it


# Find most Memory Intensive Process
# This needs to be done when the "top" command is running
# To manage ("add or remove") the fields from top commands display, press "F"
# Then move the arrow key up and down to navigate through the fields
# Press "d" to hide/display the fields from top commands result
# Navigate over a field and press "s" to make it the sorting field for top command
# Thus once can also find the fields that are consume most memory (Memory Intensive Processes)


# To get full path name and parameters of the running process, press "C" while the top process is running

# To display performance data of individual CPU's, press "1"


##########################
# DF - Disk Free
##########################
# Display total and free disk space available on mounted file systems
# h - display values in human readable format eg. K for Kb, M for Mb, etc how much GB of disk space is free on the system
# T - display information about the filesystem type
# a - display all the filesystems including the 0 sie filesystem used by the system

df -h 		# displays disk space data in KB, MB, GB
df -Tha		# what type of filesystem do we have on our system



#########################
# DU - Disk Usage
#########################
# -s - Summary only
# -h - display information in human readable format

du -sh /var		# directory
du -h /var		# directory and its sub directories


#########################
# LSOF - ls Open Files
#########################
# Output consists of the following fields :
# COMMAND(Process name), PID(Process ID), USER(Username), FD(File Descriptor), TYPE (Node type of the file),
# DEVICE(Device Number), SIZE(File Size), NODE(Node number), NAME(Full Path of the file name)

lsof | more		# view all open files of the system
lsof | wc -l		# Get count of the number of open files
lsof -u osboxes		# Get open files for a specific user. To check what users are executing on the system
lsof /bin/vi		# Display all users using vi


#########################
# VMSTAT
#########################
# Used for performance monitoring
# displays rb process, memory, swap, i/o, system and CPI performance information
# r - runnable process count
# b - blocked process count
#########
# Memory
#########
# swpd field : used swap space
# free field : available free RAM
# buff field : RAM used for buffers
# cache field: RAM used for filesystem cache

########
# Swap
########
# Si field : Amount of memory swapped from disk per second
# So field : Amount of memory swapped to disk per second


#####
# IO
#####
# Bi field : Blocks received from disk
# Bo field : Blocks sent to disk


#########
# SYSTEM
#########
# In field : Number of interrupts per second
# Cs field : Number of context switches per second


######
# CPU
######
# Us field : Time spent running user code (non-kernel code)
# Sy field : Time spent running kernel code
# Id field : Ifle time
# Wa field : Time spent waiting for the IO

vmstat
vmstat 1 100		# execute vmstat every 1 second for 100 times


#########################
# NETSTAT
#########################
# Displays network related information such as network connections, routing tables, interface statistics

netstat -an			# active internet connections and domain sockets
netstat -tap			# active connections with Process ID and Program Name
netstat --route			# display routing table
netstat -mC			# display routing cache
netstat --statistics --raw	# display RAW network statistics
netstat --tcp --numeric		# list of TCP connections to and from the machine
netstat --tcp --listening	# TCP port that the server is listening


#########################
# SYSCTL
#########################
# Helps to configure Linux Kernel parameters during runtime
sysctl -a

vi /etc/sysctl.conf		# modify kernel parameter in /etc/sysctl.conf for permanent change
sysctl -p			# commit the changes (after the reboot)
sysctl -w { var-name = value }	# modify kernel parameter temporarily (changes will be lost after reboot)


#########################
# NICE
#########################
# Kernel decides how much processor time is needed for a process based on the nice value.
# Possible range for Nice value : -20 to 20
# Process with nice value of -20 is high priority and 20 is low priority

ps axl			# display nice value of all running process

./script.sh &		# assign low priority to a shell script (run it in background for it to get nice value "0")
ps axl | grep script	# 6th column shows the nice value

nice -10 ./script.sh &  # assign 10 nice value
nice --10 ./script.sh & # assign -10 nice value. Negative value can be set only by the root user



#########################
# RENICE
#########################
# To Alter scheduling priority of a running process
# Decrease priority of a running process
ps axl | grep script		# shows nice value 10
renice 16 -p 14252		# 14252 is the PID


#########################
# KILL
#########################
# To terminate running processes. Typically used to kill processes that are hangign out, not responding, taking long time or not needed

ps aux | grep httpd
kill 142 1734			# kill multiple processes (142, 1734 - PID)
# This command tries to kill the process by sending a signal called SIGTERM. If the process does not get terminated,
# you can forcefully terminate the process by passing a signal called SIGKILL using the option -9
# You should either be owner of the process or a privileged user to kill a process
kill -9 142 1734

# Another way to kill multiple processes together easily is by adding the following in .bash_profile
# Refer page 257


#########################
# PS - Process Status
#########################
# Display snapshot information of all active processes

ps aux | more		# display all processes running in the system
ps auxf			# print the process tree
ps U osboxes		# view process owned by a particular user
ps U $USER		# view process owned by current user


######################
# SAR
######################
# SAR commands come with sysstat package. So make sure that it is installed
# used as a monitoring tool that displays performance data of pretty much every resource of the system
# It includes CPU, memory, IO, paging, networking, interrupts, etc.

sar -u			# CPU usage
sar -d			# disk io
sar -n DEV | more	# networking statistics
sar -n SOCK | more
sar -u -P ALL		# breakdown of CPU performance data for individual CPU's
