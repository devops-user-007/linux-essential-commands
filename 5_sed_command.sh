# s - substitute
# / - delimiter
# g - replace all with the replacement character
# n - any number, replace nth instance og the regexp with replacement
# p - print the new pattern space if subsitution was made
# i - case insensitive
# w - write result to given file

# Change the word "Linux" to "Linux-Unix" using sed
# since no flags are specified, the first match of line is replaced. So only first Linux is replaced
sed 's/Linux/Linux-Unix/' myfile.txt
sed 's/Linux/Linux-Unix/g' myfile.txt			# substitute all appearances now
sed 's/Linux/Linux-Unix/2' myfile.txt			# Change the second occurence
sed -n 's/Linux/Linux-Unix/gpw output' myfile.txt	# Change all occurences, print the  output and write it to a file
sed 's/\-/\/g' myfile.txt				# Replace "-" with empty string
