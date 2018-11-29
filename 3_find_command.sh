####################
# EXERCISE 1
####################

# Find file in /etc directory that contains "mail" in its name using "name"
find /etc -name "*mail"

# Find files in the system that are greater than 10 MB using "size"
find / -type f -size +10M	# f - file, d - directory

# Find files that are "not modified" in the last 60 days using "-mtime"
find . -mtime +60

# Find files that are "modified" in the last 5 days
find . -mtime -5

# List and Delete all files greater than 100 MB in current directory using "exec"
find /testdir/ -type f -name t* -size +1M -exec ls -l {} \;
find /testdir/ -type f -name t* -size +1M -exec rm -f {} \;
