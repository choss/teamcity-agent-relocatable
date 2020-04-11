#!/bin/bash
if [ -z "$RELOCATE_DIR" ]
then
  echo "Starting with default"
else
  echo "Starting to relocate to ${RELOCATE_DIR}"
  mkdir -p `dirname ${RELOCATE_DIR}`
  cp -rfv /opt/buildagent/. ${RELOCATE_DIR}
  sed -i "s|^AGENT_DIST=.*$|AGENT_DIST=${RELOCATE_DIR}|g" /run-agent.sh
  sed -i "s|^LOG_DIR=.*$|LOG_DIR=${RELOCATE_DIR}/logs|g" /run-agent.sh
fi
