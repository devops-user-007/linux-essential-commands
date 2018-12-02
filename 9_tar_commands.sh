# tar is used to convert a group of files into an archive
# c - create archive
# v - verbose mode
# f - archive file name
# x - extract file names
# z - when dealing with tar.gz (gzip) compressed file
# j - when dealing with tar.bz2 (bzip2) compressed file

tar  cvf /tmp/test.tar /opt/testdir		# create arcive
tar tvf /tmp/test.tar				# view all the files inside the tar archive
tar xvf /tmp/test.tar				# extract files from tar archive
tar xvfz /tmp/test.tar -C /var/test		# extract files to a specific directory
tar -rvf /opt/testdir.tar testfile.txt		# add file to existing tar file

# Using gzip with tar. Its faster than bzip2
tar cvfz /tmp/test.tar.gz /opt/testdir
tar xvfz /tmp/test.tar.gz
tar tvfz /tmp/test.tar.gz

# Using bzip2 with tar
tar cvfj /tmp/test.tar.gz /opt/testdir
tar xvfj /tmp/test.tar.gz
tar tvfj /tmp/test.tar.gz

# bzip2 will compress better than gzip
# bzip2 is slower than gzip
# bzip2 provides high rate of compression with reasonable speed


