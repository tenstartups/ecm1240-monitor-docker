#!/bin/sh
set -e

# Exit with error if required environment is not present
if [ -z "${BTMON_CONFIG}" ]; then
  echo "Envrionment variable BTMON_CONFIG must be provided"
  exit 1
fi

# Exit with error if config is missing
if ! [ -f "${BTMON_CONFIG}" ]; then
  echo "Configuration file '${BTMON_CONFIG}' not found"
  exit 1
fi

# Execute the btmon python script
/usr/local/bin/btmon -c "${BTMON_CONFIG}"
