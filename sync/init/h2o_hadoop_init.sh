#!/usr/bin/env bash

# Shell script to initiate H2O on hadoop 
# http://h2o-release.s3.amazonaws.com/h2o/rel-slater/5/index.html

# Check to see if there is already an H2O cluster running:
HADOOP_USER_NAME=cloudera hdfs dfs -rmr /tmp/h2o_hadoop_demo > /dev/null 2>&1
HADOOP_USER_NAME=cloudera \
       hadoop jar /opt/h2o-3.2.0.5-cdh5.4.2/h2odriver.jar \
           -jobname h2o_cloud \
           -nodes 1 \
           -mapperXmx 1g \
           -output /tmp/h2o_hadoop_demo > /dev/null 2>&1 &