# Simple R Script to initiate an sc & sqlCtx


Sys.setenv(YARN_CONF_DIR = "/etc/hadoop/conf.cloudera.yarn/")
Sys.setenv(SPARK_HOME = "/opt/spark-1.5.0-bin-hadoop2.6")
home <- Sys.getenv("SPARK_HOME")
.libPaths(c(file.path(home, "R", "lib"), .libPaths()))
Sys.setenv(NOAWT=1)
# Make sure SparkR package is the last loaded one
old <- getOption("defaultPackages")
options(defaultPackages = c(old, "SparkR"))

sink("/dev/null")
options(warn=-1)
suppressMessages(suppressWarnings(invisible(library(SparkR, lib.loc="/opt/spark-1.5.0-bin-hadoop2.6/R/lib"))))
suppressMessages(suppressWarnings(invisible(sc <- sparkR.init(master="yarn-client", 
                  appName="SparkR",
                  sparkHome="/opt/spark-1.5.0-bin-hadoop2.6"))))
sink()
options(warn=0)

assign("sc", sc, envir=.GlobalEnv)
sqlContext <- sparkRHive.init(sc)
assign("sqlContext", sqlContext, envir=.GlobalEnv)

sparkVer <- SparkR:::callJMethod(sc, "version")
cat("\n Welcome to")
cat("\n")
cat("    ____              __", "\n")
cat("   / __/__  ___ _____/ /__", "\n")
cat("  _\\ \\/ _ \\/ _ `/ __/  '_/", "\n")
cat(" /___/ .__/\\_,_/_/ /_/\\_\\")
if (nchar(sparkVer) == 0) {
  cat("\n")
} else {
  cat("   version ", sparkVer, "\n")
}
cat("    /_/", "\n")
cat("\n")
cat("\n Spark context is available as sc, Hive context is available as sqlContext\n")

