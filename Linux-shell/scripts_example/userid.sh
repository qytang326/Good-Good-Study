#!/bin/bash
# Program
#       Use id, finger command to check system account's information.
# History
# 2015/07/17    VBird   first release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
users=$(cut -d ':' -f1 /etc/passwd)    # 擷取帳號名稱
for username in ${users}               # 開始迴圈進行！
do
        id ${username}
done
