#! /bin/sh

cd /home/pi/documentation
/opt/gitlab/embedded/bin/git pull origin master

#for i in $(find /home/pi/documentation -maxdepth 1 -type d)
#do
#    cd "$i"
#    mkdocs build --clean --site-dir /var/www/snowden.pingswept.org/"$i"
#done

cd /home/pi/documentation/blue-hour-baltimore
/usr/local/bin/mkdocs build --clean --site-dir /var/www/snowden.pingswept.org/blue-hour-baltimore

cd /home/pi/documentation/color-commons
/usr/local/bin/mkdocs build --clean --site-dir /var/www/snowden.pingswept.org/color-commons

cd /home/pi/documentation/ourself
/usr/local/bin/mkdocs build --clean --site-dir /var/www/snowden.pingswept.org/ourself
