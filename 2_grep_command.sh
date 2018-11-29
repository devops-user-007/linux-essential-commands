##################
# EXERCISE 1
##################
# Search for specific text in a file using grep
grep mytext /etc/passwd

# Search for specific text in a file ignoring the case using -i
grep -i mytext /etc/passwd	#i - case insensitive


# Display all lines that do not match using -v
grep -v mytext /etc/passwd

# Count the number of lines that match and did not match the pattern using -c
grep -c osboxes /etc/passwd	# number of lines that match
grep -cv osboxes /etc/passwd	# number of lines that do not match

# Search for all Subdirectories for the matching text pattern using -r
# Displays the file name and the matching string as well using -r
grep -ir osboxes /etc/
# Displays only the matching file name using -l
grep -irl osboxes /etc/


###################
# EXERCISE 2
###################
# Using Regular Expression with Grep command
grep -irl osb* /etc/

grep "^os" /etc/passwd		# string that starts with os
grep "bash$" /etc/passwd	# line that ends with bash
grep "^$" /etc/passwd		# find count of empty lines
grep ".xes" /etc/passwd		# replace dot with any character and find string in the file
grep ".x.s" /etc/passwd
grep ".xe." /etc/passwd
grep -i "authorization *" /var/log/kern.log	# * represents any number of occurences of any character

