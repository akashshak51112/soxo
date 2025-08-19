#!/bin/bash

SOURCE_FOLDER="/home/ubuntu/project/dailycoding-app"
S3_BUCKET="akashshasoxobucket"
BACKUP_DIR="/home/ubuntu/project/backupfolder"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILENAME="backup_${TIMESTAMP}.tar.gz"
LOCAL_BACKUP_PATH="${BACKUP_DIR}/${BACKUP_FILENAME}"


mkdir -p "${BACKUP_DIR}"

tar -czf "${LOCAL_BACKUP_PATH}" -C "${SOURCE_FOLDER}" .

echo "Backup of '${SOURCE_FOLDER}' created at '${LOCAL_BACKUP_PATH}'"

echo "Uploading ${LOCAL_BACKUP_PATH} to s3://${S3_BUCKET}/${BACKUP_FILENAME}"

aws s3 cp "${LOCAL_BACKUP_PATH}" "s3://${S3_BUCKET}/${BACKUP_FILENAME}"
