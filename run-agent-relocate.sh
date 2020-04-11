#!/bin/bash
if [ -z "$RELOCATE_DIR" ]
then
  echo "Starting with default"
else
  echo "Starting to relocate to ${RELOCATE_DIR}"
  ln -nsf ${RELOCATE_DIR} /opt/buildagent
  sed -i "s|^AGENT_DIST=.*$|AGENT_DIST=${RELOCATE_DIR}|g" /run-agent.sh
  sed -i "s|^LOG_DIR=.*$|LOG_DIR=${RELOCATE_DIR}/logs|g" /run-agent.sh
fi
