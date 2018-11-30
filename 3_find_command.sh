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


# Archive all the files that are not modified in the last x60 days
find /testdir/ -type f -mtime +60 | xargs tar -cvf /tmp/`date '+%d%m%Y'_archive.tar`


# Suppress standard error and output using "> /dev/null"
cat file.txt > /dev/null	# wont display echo messages
cat invalidfile.txt 2> /dev/null


# Supress output and error message of a cron task
30 1 * * *  command > /dev/null 2>&1

