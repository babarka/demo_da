#!/usr/bin/env bash

/opt/spark-1.5.0-bin-hadoop2.6/bin/spark-submit \
  --class com.oreilly.learningsparkexamples.mini.scala.WordCount \
  /home/cloudera/demo/mini/target/scala-2.10/learning-spark-mini-example_2.10-1.0.jar \
  /opt/spark-1.5.0-bin-hadoop2.6/README.md \
  /home/cloudera/demo/mini/wordcounts
