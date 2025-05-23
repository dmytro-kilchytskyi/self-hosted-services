#!/bin/sh

TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BACKUP_FILE="backup-${TIMESTAMP}.tar"

tar cvf "/backups/${BACKUP_FILE}" "${VOLUME_PATH}" >> "${LOG_FILE}" 2>&1

if [ $? -eq 0 ]; then
    echo "[$(date)] Backup successful: ${BACKUP_DIR}/${BACKUP_FILE}" >> "${LOG_FILE}"
    # Optional: Add commands here to prune old backups
else
    echo "[$(date)] ERROR: Backup failed" >> "${LOG_FILE}"
    exit 1
fi

exit 0