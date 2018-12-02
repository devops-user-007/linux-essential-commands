# To search the history, we have a few options rather than pressing up and down arrow key to move forward and backward
# Press "CTRL + R" in CLI and the enter the keyword of the command you are looking for. Its like filtering.

# !!, CTRL + P	=> show previous command
# !-1		=> command executed before
# !-3		=> command executed 2 commands before

# Do "history | more" to see the numbered ordering of the commands. Then "!4" if you want to execute the 4th command

# !ps, !cat		 	previous command that start with specific character
history -c			# Clear previous history


# ENVIRONMENT VARIABLES  IN HISTORY COMMAND
export HISTTIMEFORMAT='%F %T '		# env variables for history to display timestamp for the commands
history | more				# show timestamp for executing the commands. Can be used for auditing.

history 10				# view last 10 executed commands 

alias h1 = 'history 2'

# Control total number of lines in the history using HISTSIZE
vi ~/.bash_profile
HISTSIZE=450
HISTFILESIZE=450


# CHANGE HISTORY FILE NAME
# Can be used whrn you want to track commands executed from different terminals using different history file name
# By default history is stored in ~/.bash_history file
vi ~/.bash_profile
HISTFILE=/root/.commandline_warrior


# IGNORE DUPLICATES
# Can be used to eliminate duplicate commands shown by history
pwd
pwd
pwd
history | tail -4		# will show you repeated pwd command thrice
export HISTCONTROL=ignoredups	# will show pwd only once now (since they are consecutive)


# IGNOREDUPS removes duplicates if they are consecutive. To remove duplicates from all history, use ERASEDUPS
export HISTCONTROL=erasedups


# FORCE history to not remember a particular command
# If you want a command to not appear in history, do it using ignorespace
export HISTCONTROL=ignorespace


# DISABLE history
export HISTSIZE=0


# Ignore specific commands in History
export HISTIGNORE="pwd:ls:ls -ltr:"
