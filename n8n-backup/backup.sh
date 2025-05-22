#!/bin/bash

# --- Configuration ---
VOLUME_PATH="/n8n_backup_data"
BACKUP_DIR="/backups"
BACKUP_FILENAME_PREFIX="n8n-backup"
# --- End Configuration ---

# Create a timestamp for unique backup file names
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BACKUP_FILE="${BACKUP_FILENAME_PREFIX}-${TIMESTAMP}.tar"
LOG_FILE="${BACKUP_DIR}/backup_log.txt"

# Ensure backup directory exists
mkdir -p "${BACKUP_DIR}"

# Logging
echo "----------------------------------------" >> "${LOG_FILE}"
echo "Starting backup..." >> "${LOG_FILE}"

# Backup command
echo "Running backup command: cvf \"/backups/${BACKUP_FILE}\" \"${VOLUME_PATH}\"" >> "${LOG_FILE}"
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