#! /bin/sh

cd /home/pi/records
/opt/gitlab/embedded/bin/git pull origin master

#for i in $(find /home/pi/records -maxdepth 1 -type d)
#do
#    cd "$i"
#    mkdocs build --clean --site-dir /var/www/snowden.pingswept.org/"$i"
#done

cd /home/pi/records/blue-hour-baltimore
/usr/local/bin/mkdocs build --clean --site-dir /var/www/records.pingswept.org/blue-hour-baltimore

cd /home/pi/records/color-commons
/usr/local/bin/mkdocs build --clean --site-dir /var/www/records.pingswept.org/color-commons

cd /home/pi/records/ourself
/usr/local/bin/mkdocs build --clean --site-dir /var/www/records.pingswept.org/ourself
