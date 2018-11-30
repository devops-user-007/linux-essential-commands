# wget is the best option to download files from internet
# it can handle large, recursive, non interactive, multiple file downloads
# your_url => https://pkg.jenkins.io/debian-stable/jenkins.io.key

wget your_url
wget -O jenkinskey your_url	# save with different file name
wget --limit-rate=200k your_url	# useful in prod when downloading large files
wget -c your_url		# continue incomplete download (eg. big file interrupted)
wget -b your_url		# download in the background
tail -f wget-log		# check status of your download. works only when file is getting downloaded in background
wget --spider your_url		# --spider - check if the link is valid and if download will be successful (before scheduling)
wget --tries=75 your_url	# default is 20 tries. use since download might break due to poor connection
wget -i download-url-list.txt	# download multiple urls
wget --mirror -p --convert-links -P ./LOCAL-DIR WEBSITE_URL # download full website
# mirror : turn on options suitable for mirroring
# p : download all files necessary to display given html page
# convert-links : convert the links in document for local viewing
# P : save files to the specified directory

wget --reject=gif WEBSITE_URL	# reject certain file types while downloading
wget -r -A.pdf WEBSITE_URL	# download certain file types
wget -o download.log your_url	# log messages to a log file instead of stderr
wget -Q5m -i your_url		# quit downloading after it exceeds certain size
wget ftp_url			# FTP download using wget
wget --ftp-user=USERNAME --ftp-password=PASSWORD your_url	# ftp with authentication

