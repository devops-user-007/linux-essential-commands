zip archive.zip /opt/testdir/*		# zip multiple files together
zip -r archive.zip /opt/testdir/	# zip directory and its files recursively
unzip archive.zip			# unzip the zipped file
unzip -t archive.zip            	# validate a zip file
unzip -v archive.zip			# unzip with detailed output
unzip -l archive.zip			# list contents of zip file


# There are 10 types of compression provided by the zip command
# 0 - lowest level (archive files without compression)
# 1 - performs little compression very fast
# 6 - default compression level
# 9 - maximum level of compression. Its slower compared to default. Unless compressing huge file, use 9


zip archive.zip /opt/testdir/*
zip -0 archive.zip /opt/testdir/*
zip -9 archive.zip /opt/testdir/*
zip -P mypassword archive.zip /opt/testdir/*		# assign password to the zip file

# The above command can be uesd if you are using the command inside shell script for background jobs.
# However, when you are performing the compression interactively on the CLI, you dont want the password to be 
# visible in the history. So use -e option
zip -e archive.zip /opt/testdir/*		# prompts to enter the password and it cant be seen when you enter it

