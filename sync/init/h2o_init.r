


check_h2o_active <- function(){
   cnamejson <- suppressWarnings(system("curl -s http://localhost:54321/3/Cloud",intern=T))
   cname <- sub('.*"cloud_name":"([^"]*).*', "\\1", cnamejson)
   return(identical(cname,"h2o_cloud"))
}

if(check_h2o_active()) {
    cat('Existing H2O Cloud...')
} else { 
	cat('Initiating H2O Cloud...')
    system('/home/cloudera/demo/init/h2o_hadoop_init.sh')   
}

x <- 0
while(x < 120 && !check_h2o_active()) {
	x <- x + 1
	Sys.sleep(1.5)
	cat('.')
	}
cat('\n')
# Loaded incorrectly in image... will correct for next version
invisible(install.packages("/opt/h2o-3.2.0.5-cdh5.4.2/R/h2o_3.2.0.5.tar.gz", repos = NULL, type="source"))
try(suppressWarnings(suppressMessages(library(h2o))))
hc = h2o.init(ip = "localhost", port = 54321, startH2O = FALSE)
cat('H2O Cluster connection is available as hc')









