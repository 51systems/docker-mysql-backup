# Mysql Backup

Docker mysql backup image that periodically backs up 
a mysql and uploads it using scp.
 
 
## Environment variables
| Name               | Description                 |
| ------------------ | ----------------------------|
| CRON_SCHEDULE      | Cron schedule in [crontab format](https://www.freebsd.org/cgi/man.cgi?crontab(5))|
| MYSQL_HOST         | Host where mysql is running |
| MYSQL_PORT         | Port to connect (3306 default) |
| MYSQL_USER         | Username to connect with |
| MYSQL_PASSWORD     | Password to connect with |
| MYSQL_DATABASE     | Name of mysql database to backup (optional) |
| UPLOAD_HOST        | Server to SCP the file to |
| UPLOAD_USER        | SSH Username             |
| UPLOAD_TARGET      | Path to upload the backup to |
| UPLOAD_SSHKEY      | Private key to use when connecting to ssh |


## Testing
There is an included `docker-compose` file for testing. 
It mounts the public key in `test/ssh/id_rsa.pub` to an
imaginary backup server, and then attempts to backup the database
every minute. 

### Gotachas
When the backup server runs, it will change the permission of
`id_rsa.pub`. You must `chown` it back to your current user
and group prior to calling `docker-compose` again.