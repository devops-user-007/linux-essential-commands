###############
# SORT
###############
sort employee.txt      			 # sort in ascending order
sort -r employee.txt   			 # sort in descending order
sort -n employee.txt			   # sort numerically
sort -c employee.txt			   # check if file is already sorted
sort -u employee.txt			   # sort and remove duplicates
sort -k 2 employee.txt			 # sort by column using k
sort -k 2n employee.txt			 # sort by numeric column using k
sort -o employee.txt sortedemployee.txt	 # output to a new file 
sort -t: -k 2 employee.txt     		       # sort colon delimited text file on 2nd field
sort -t: -u -k 3 employee.txt  		       # sort tab delimited text file on 3rd field
sort -t: -k 3n /etc/passwd | more      	 # sort by 3rd field (NUMERIC field)
sort employee.txt | uniq -c		           # sort and gives count of all the fields for dup and non dup data
sort employee.txt | uniq -cd		         # sorts and gives count of duplicate data

