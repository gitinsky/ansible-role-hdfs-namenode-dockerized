#!/bin/sh
set -e
chown -R hadoop:hadoop /var/hadoop
chown -R hadoop:hadoop /var/log/hdfs
if [ ! -e /var/hadoop/dfs ]; then
   sudo -E -u hadoop /hadoop/bin/hdfs namenode -format
fi
exec sudo -E -u hadoop /hadoop/bin/hdfs namenode 1>>/var/log/hdfs/namenode.log 2>&1
