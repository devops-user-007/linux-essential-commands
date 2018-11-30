# ROLES : u - user, g - group, o - others
# PERMISSIONS : r - read, w - write, x - execute

chmod u+x myfile		# add permission to single file/directory
chmod u-x myfile		# remove permission
chmod u+x,g+x myfile		# add multiple permissions
chmod a+x myfile		# add permission to all roles
chmod --reference=file1 file2	# copy permission from one file to another
chmod -R 755 /opt/testdir/	# set permission on all the files within a directory
chmod u+X *			# execute permission only on subdirectory and not on files
