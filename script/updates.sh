#!/bin/sh

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
echo "updating statistics"

cd /var/www/ebrs_dashboard; bundle exec rake ebrs:cron

exit
