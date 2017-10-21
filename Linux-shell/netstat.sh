#!/bin/bash
#Program:
#	Using netstat and grep to detect WWW.SSH.FTP and Mail services.
#History:
#2017/06/19 Quanyin First Version

echo "Now, I will detect your Linux server's services!"
echo -e "The www,ftp,ssh,and mail(smtp) will be detect! \n"

testfile=/dev/shm/netstat_checking.txt
netstat -tuln >${testfile}
testing=$(grep ":80" ${testfile})
if [ "${testing}" != '' ];then
	echo "WWW is running in your system."
fi
testing=$(grep ":22" ${testfile})
if [ "${testing}" != '' ];then
	echo "SSH is running in your system."
fi
testing=$(grep ":21" ${testfile})
if [ "${testing}" != '' ];then
	echo "FTP is running in your system."
fi


