#!/bin/bash
. /root/.tnvm/tnvm.sh && agenthub start alinode-config.json && ENABLE_NODE_LOG=YES pm2 start pm2.yml --no-daemon
