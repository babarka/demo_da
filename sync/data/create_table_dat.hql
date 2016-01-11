-- Create Table dat

CREATE EXTERNAL TABLE IF NOT EXISTS default.dat (
    y  FLOAT,
    x1 FLOAT,
    x2 FLOAT,
    x3 FLOAT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' location 'hdfs://quickstart.cloudera:8020/user/cloudera/dat';