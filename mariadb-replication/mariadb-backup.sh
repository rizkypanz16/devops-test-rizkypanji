#!/bin/bash
# MariaDB backup script

# Variables
USER="root"
PASSWORD="ijinmasuk"
DATABASE="laravel"
DATE=$(date +%Y-%m-%d)
FILENAME="$DATABASE-$DATE.sql"
BACKUP_DIR="/var/database-backups"

# membuat backup directory
mkdir -p $BACKUP_DIR

# backup dengan mysqldump dan memasukan pada directory
mysqldump --user=$USER --password=$PASSWORD $DATABASE > $BACKUP_DIR/$FILENAME

# delete backup setelah 7 hari
find $BACKUP_DIR/* -mtime +7 -exec rm {} \;