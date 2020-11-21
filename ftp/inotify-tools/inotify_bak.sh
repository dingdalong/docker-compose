#!/bin/bash
src=/home/develop/ftp/vsftpd/<account>
/usr/local/bin/inotifywait -mrq --timefmt '%d/%m/%y %H:%M' --format '%T %w%f%e' -e close_write,delete,create,attrib $src |  while read file
do
    /usr/bin/rsync -arzuq $src <account>@192.168.130.71::helloRsync --password-file=/etc/rsync.password
    echo "  ${file} was rsynced" >>/var/log/rsync.log 2>&1
done
