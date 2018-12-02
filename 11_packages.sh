####################################
# Yellowdog Update Modifier (YUM)
####################################
yum install httpd			# Install packages using Yum
yum install httpd -y			# Install without prompt
yum install httpd git -y		# Install multiple packages
yum remove httpd -y			# Uninstall packages using Yum
yum update httpd			# Update a package
yum search firefox			# Search for packages in the repository
yum info firefox			# Get information on packages


####################################
# Redhat Package Manager (RPM)
####################################
# RPM has the following
# Package name, Package Version, Release, Architecture
# Eg: mysql-client-3.23.57-1.i386.rpm
# Package name : mysql-client
# Package version : 3.23.57
# Relase : 1
# Architecture : i386

# i - install
# v - verbose
# h - print hash marks as the package archive is unpacked
# q - query operation
# a - all installed packages
# d - documentation
# i - view information about rpm
# p - specify package name
# l - list the files in the package

rpm -ivh mysql-client-3.23.57-1.i386.rpm		# Install packages using rpm
rpm -qa							# Query all installed packages
rpm -qa | grep 'mysql-client'
rpm -q mysql-client					# Query installed package
rpm -qf /usr/bin/mysqlaccess				# which rpm package does the file belong to
rpm -qdf /usr/bin/mysqlaccess				# locate documentation of a package that owns file
rpm -qip mysql-client-3.23.57-1-i386.rpm		# lot of information on the package
rpm -qlp mysql-client-3.23.57-1-i386.rpm		# list contents of the rpm package
rpm -qRp mysql-client-3.23.57-1-i386.rpm		# list of package on which this package depends
rpm -e mysql-client-3.23.57-1-i386.rpm			# uninstall a package



##############################
# APT
##############################
# Used by debian systems to manage packages

apt-get search ^apache2$		# search for the package
dkpg -l | grep -i apache		# check if the package is already installed
apt-get install apache2			# install package
apt-get purge apache2			# remove the package
apt-get remove apache2			# remove the package


###########################
# INSTALL FROM SOURCE
###########################
# Sometimes you have to install a package from an external source and download tar or zip files for it
# Once you extract the files in a package to a folder, cd to that folder
./configure --help		# displays all application spscific configuration options available
./configure			# uses all default values to perform the configuration. Generates Makefile required for the installation

make				# uses the makefile created from the above step and create application binary executable
make install			# installs the application in the appropriate location
