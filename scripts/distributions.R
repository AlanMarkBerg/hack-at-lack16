# Generate different types of distributions we can feed
# In Jmeter testplans for different combinations
# Alan Berg

# Links
# http://www.r-bloggers.com/normal-distribution-functions/
# https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Distributions.html


# Normal

setwd("/Users/Alan/Desktop/Z-lak16/hack-at-lack16/data/")
mean<-12
sd<-4
number_rows<-800
randomdeviates<-rnorm(number_rows,mean,sd)
# Only discret unit of events
randomdeviates<-round(randomdeviates, digits = 0)
# Remove tail below 0
randomdeviates[which(randomdeviates < 0)] <- 0
write.table(randomdeviates, file = "normal_distribution.csv", sep = ",", row.names = FALSE, col.names = FALSE)

# Power Law
#install.packages("zipfR")
library(zipfR)
Z <- lnre("zm", alpha=.7, B=0.37)
pwr<- round(as.integer(rlnre(Z, 30)))
hist(pwr,breaks=25)
pwr[which(pwr < 45)] <- 0
write.table(pwr, file = "power_distribution.csv", sep = ",", row.names = FALSE, col.names = FALSE)

