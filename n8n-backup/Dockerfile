FROM alpine:latest

# VOLUME_PATH: Path inside this container where volume will be mounted
ENV VOLUME_PATH="/backup_data"

ENV CRON_SCHEDULE="0 2 * * *"
ENV BACKUP_DIR="/backups"
ENV LOG_FILE="${BACKUP_DIR}/backup.log"

COPY backup.sh /usr/local/bin/backup.sh
RUN chmod +x /usr/local/bin/backup.sh

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir "${BACKUP_DIR}" && touch "${LOG_FILE}" && chmod 644 "${LOG_FILE}"

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["crond", "-f", "-d", "8", "-L", "/backups/cron_daemon.log"]