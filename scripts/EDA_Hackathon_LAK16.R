# Example R Code for reviewing hackathon data
# Alan Berg

file<-file.choose()
#file<-"r01.csv"
jisc_data <- read.csv2(file, sep =",", header = TRUE, stringsAsFactors = FALSE)

## Overview from CSV file import based on the JISC dataset
names(jisc_data)
jisc_data$VERB <- as.factor(jisc_data$VERB)
plot(jisc_data$VERB, main="Verbs",las=1, ylab="Number")

jisc_data$COURSE <- as.factor(jisc_data$COURSE)
plot(jisc_data$COURSE, main="Courses",las=1, ylab="Number")

length(jisc_data$COURSE)
length(unique(jisc_data$UID))
unique(jisc_data$OBJECT)

jisc_data$OBJECT<-gsub("http://moodle.data.alpha.jisc.ac.uk/", "", jisc_data$OBJECT )
unique(jisc_data$OBJECT)
jisc_data$OBJECT<-as.factor(jisc_data$OBJECT)
plot(jisc_data$OBJECT,las=2,cex.lab=.5, cex.axis=.5, cex=.5, cex.sub=.5)
table(jisc_data$OBJECT)

## Get 100 live records
library(httr)
library(jsonlite)
url <- "http://jisc.learninglocker.net/data/xAPI/statements?offset=100"
auth <-"Basic YmI4MjU0NDBjYjA1YWJhMzFmNzQ2MzE4NjRlNjAxZTM1NmQyYTM5ZDowYjNmNWY0MzhlZmFkZTgwZGVlOWU2ZjlkYzJkODcxMjZmZmU3YjBk"
ver <-"1.0.1"
req <- GET(url, add_headers("Authorization" = auth, "X-Experience-API-Version" = ver))
json <- content(req, as = "text")
info <- fromJSON(json)
class(info)
length(info)
where_next<-info[1]$more
where_next
statements<-info[2]$statements

def_name<-as.factor(statements$object$definition$name$en)
plot(def_name, main="Definition.namme",las=2, cex.axis=.5)