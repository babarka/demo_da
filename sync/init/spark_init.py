import os
import sys

# Path for spark source folder
os.environ['SPARK_HOME']="/usr/lib/spark"
os.environ['PYSPARK_PYTHON']="/opt/anaconda/bin/python"
os.environ['PYSPARK_SUBMIT_ARGS']="--master yarn"
sys.path.append("/usr/lib/spark/python/")
sys.path.append("/usr/lib/spark/python/lib/py4j-0.8.2.1-src.zip")

import atexit
import platform
import py4j
import pyspark
from pyspark.context import SparkContext
from pyspark.sql import SQLContext, HiveContext
from pyspark.storagelevel import StorageLevel

# this is the deprecated equivalent of ADD_JARS
if os.environ.get("SPARK_EXECUTOR_URI"):
    SparkContext.setSystemProperty("spark.executor.uri", os.environ["SPARK_EXECUTOR_URI"])

sc = SparkContext(appName="pySpark", pyFiles='')
atexit.register(lambda: sc.stop())

try:
    # Try to access HiveConf, it will raise exception if Hive is not added... but it's there
    sc._jvm.org.apache.hadoop.hive.conf.HiveConf()
    sqlCtx = HiveContext(sc)
except py4j.protocol.Py4JError:
    sqlCtx = SQLContext(sc)

print("""Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /__ / .__/\_,_/_/ /_/\_\   version %s
      /_/
""" % sc.version)
print("Using Python version %s (%s, %s)" % (
    platform.python_version(),
    platform.python_build()[0],
    platform.python_build()[1]))
print("SparkContext available as sc, %s available as sqlCtx." % sqlCtx.__class__.__name__)
