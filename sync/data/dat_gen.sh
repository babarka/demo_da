#!/usr/bin/env bash

if hadoop fs -test -d /user/cloudera/dat ; then
   echo "Data already loaded, moving on."
else
   # Load file into hdfs
   /home/cloudera/demo/data/dat_gen.R /home/cloudera/demo/data/dat.csv
   HADOOP_USER_NAME=cloudera hdfs dfs -mkdir /user/cloudera/dat
   HADOOP_USER_NAME=cloudera hdfs dfs -put /home/cloudera/demo/data/dat.csv /user/cloudera/dat/
   # Run hive script to create table on text file
   HADOOP_USER_NAME=cloudera hive -f /home/cloudera/demo/data/create_table_dat.hql
   # ensure that table is accessible in impala
   HADOOP_USER_NAME=cloudera impala-shell -q 'invalidate metadata default.dat'
   rm -rf /home/cloudera/demo/data/dat.csv
fi
