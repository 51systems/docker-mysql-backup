#!/usr/bin/env bash

confd -onetime -backend env

chmod +x /backup.sh
chmod +x /upload.sh

touch /var/log/cron.log

# prevent duplicate jobs when restart containers
if [ ! -f /.cronjob ]; then

    crontab -l | { cat; echo "$CRON_SCHEDULE /backup.sh >> /var/log/cron.log 2>&1"; } | crontab -
    touch /.cronjob

fi

#start logging the output and run cron in the foreground
tail -f /var/log/cron.log & cron -f