########################################
# Display Total Connect Time of Users
########################################

# -d - breakdown output for individual days for the current logged in user.
# -p - displays connect time for all the users
ac -d
ac -p
ac -pd
ac -d osboxes
# for "ac" to work, you have to install a package "acct" using apt

# Execute commands in the background using :
# "&"
./my-shell-script.sh &

# "nohup"
# if you run a command or script in the "background" and "logout" from that session, 
# the commad will get killed. To avoid this, use "nohup"
nohup ./my-shll-script.sh &


# "screen"
# once you execute a command in background using nohup and &, the command will get executed even after
# you logout. But "you cannot connect to the same session" again to see what is happening on the screen
# hence use the screen command
# It offers ability to detach a session and then attach to it at later time


# "At"
# allows you to schedule a job to run at a particular date and time
at -f backup.sh 10 am tomorrow


# "Watch"
# execute a command continuously at a certain interval
watch df -h


###################################
# View Multiple Log files together
###################################
# Approach 1 :
tail -f /var/log/syslog -f /var/log/auth.log		# f : follow to receive messages continuously
tail -n 4 -f /var/log/syslog -f /var/log/auth.log	# show 4 records

