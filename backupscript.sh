#!/bin/bash

# Set your WordPress site directory (replace with your actual path)
SITE_DIR="/var/www/html"

# Set your backup directory (create it if it doesn't exist)
BACKUP_DIR="/home/ubuntu/Capstone_Wordpress/backups/wordpress"
DATE=$(date +"%Y-%m-%d")  # Get current date for filename
BACKUP_FILE="$BACKUP_DIR/wordpress-$DATE.tar.gz"

# Check if backup directory exists, create it if not
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
  echo "Backup directory created: $BACKUP_DIR"
fi

# Database credentials (replace with your actual credentials)
DB_NAME="wpdb"
DB_USER="mohan"
DB_PASSWORD=""

# AWS S3 configuration (replace with your actual credentials)
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
S3_BUCKET=""

# Ensure required commands are available
if ! command -v mysqldump &> /dev/null; then
  echo "mysqldump command not found. Please install the mysql-client package."
  exit 1
fi

# Dump the database
mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$BACKUP_DIR/database-$DATE.sql"

# Compress site directory and database dump into a single archive
tar -zcvf "$BACKUP_FILE" "$SITE_DIR" "$BACKUP_DIR/database-$DATE.sql"

# ... rest of the script (uploading to S3, etc.)

# Set your WordPress site directory (replace with your actual path)
SITE_DIR="/var/www/html"

# Set your backup directory (create it if it doesn't exist)
BACKUP_DIR="/home/ubuntu/Capstone_Wordpress/backups/wordpress"
DATE=$(date +"%Y-%m-%d")  # Get current date for filename
BACKUP_FILE="$BACKUP_DIR/wordpress-$DATE.tar.gz"

# Check if backup directory exists, create it if not
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
  echo "Backup directory created: $BACKUP_DIR"
fi

# Database credentials (replace with your actual credentials)
DB_NAME="wpdb"
DB_USER="mohan"
DB_PASSWORD="M@keinindia1"

# AWS S3 configuration (replace with your actual credentials)
AWS_ACCESS_KEY_ID="AKIAZAWOA5P3WOD3IPUW"
AWS_SECRET_ACCESS_KEY="C9mkaZPSSOOVmYzxTlzgqWxkMdp7WYvdNEebQ7Z7"
S3_BUCKET="capstone-onlinecloudschool"

# Dump the database
mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$BACKUP_DIR/database-$DATE.sql"

# Compress site directory and database dump into a single archive
tar -zcvf "$BACKUP_FILE" "$SITE_DIR" "$BACKUP_DIR/database-$DATE.sql"

# Print success message
echo "Backup created: $BACKUP_FILE"

# Upload backup to S3 using aws cli
aws s3 cp "$BACKUP_FILE" "s3://$S3_BUCKET/"

# Optional: Remove old backups (adjust number of days to keep as needed)
find "$BACKUP_DIR" -type f -name "wordpress-*.tar.gz" -mtime +7 -delete
echo "Removed old backups (older than 7 days)"
