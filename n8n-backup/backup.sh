#!/bin/sh

TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BACKUP_FILE="backup-${TIMESTAMP}.tar"

# Logging
echo "----------------------------------------" >> "${LOG_FILE}"
echo "Starting backup..." >> "${LOG_FILE}"

# Backup command
echo "Running backup command: tar cvf \"/backups/${BACKUP_FILE}\" \"${VOLUME_PATH}\"" >> "${LOG_FILE}"
tar cvf "/backups/${BACKUP_FILE}" "${VOLUME_PATH}"

# Check backup status
if [ $? -eq 0 ]; then
    echo "Backup successful: ${BACKUP_DIR}/${BACKUP_FILE}" >> "${LOG_FILE}"
    # Optional: Add commands here to prune old backups
else
    echo "ERROR: Backup failed. Check ${LOG_FILE} logs for details." >> "${LOG_FILE}"
fi

echo "Backup finished at $(date)" >> "${LOG_FILE}"

exit 0