#!/bin/bash
#文件名：ftp.sh
#用途：自动化FTP传输

HOST='192.168.214.137'
USER='kay'
PASSWD='kay'

echo -e "\e[1;32mStarting to sftp...\e[0m"
lftp -u $USER,$PASSWD sftp://$HOST <<EOF
cd ~/Downloads
get data.txt
bye
EOF
echo -e "\e[1;32mDone\e[0m"
