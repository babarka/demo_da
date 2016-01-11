#!/usr/bin/env Rscript
#/home/cloudera/demo/data/dat_gen.R

# b0=10
# b1=3
# b2=-2
# b3=-1

options(scipen=999)
set.seed(6875309)

dat    <- data.frame(x1=runif(10000,-1,1))
dat$x2 <- runif(10000,-1,1)
dat$x3 <- runif(10000,-1,1)
dat$y  <- 3*dat$x1 - 2*dat$x2 - 1*dat$x3 + 10 + rnorm(10000,0,0.1)

dat <- dat[,c("y","x1","x2","x3")]

writeFile <- commandArgs(trailingOnly = TRUE)

write.table(dat,
            file = writeFile, 
            sep = ",",
            eol = "\n",
            row.names = FALSE,
            col.names = FALSE)

