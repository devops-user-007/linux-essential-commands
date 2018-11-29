#################
# EXCERCISE 1
#################
# export and set the default path to /etc if the directory to cd does not exist
cd /opt
export CDPATH=/var/
# opt does not contain log directory
# cd would go to /var/log
cd log
# export will vanish once the session is terminated
# to make this permanent export CDPATH=/var/ in ~/.bash_profile



#################
# EXERCISE 2
#################
# If say you have a very long path that you have to cd into
# Rather than doing cd ../../../../../ you can follow the below approach
# Add any alias to your ~/.bash_profile eg. ..3 or ... or anything else
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
# Now every time rather than writing cd ../../../../../, you can use the below
..5

###################
# EXERCISE 3
###################
# Autocorrect spelling mistypes during cd
# Eg: If you want to cd to a /var/log and you type cd /var/lot, autocorrect will help you to  navigate
shopt -s cdspell
cd /var/lot
