#!/bin/sh

if [ -z "${CRON_SCHEDULE}" ]; then
  echo "[$(date)] Error: CRON_SCHEDULE environment variable is not set." >&2
  exit 1
fi

echo "[$(date)] Setting up cron job with schedule: ${CRON_SCHEDULE}"
echo "${CRON_SCHEDULE} /usr/local/bin/backup.sh >> ${LOG_FILE} 2>&1" > /etc/crontabs/root

tail -f "${LOG_FILE}" &

exec "$@"