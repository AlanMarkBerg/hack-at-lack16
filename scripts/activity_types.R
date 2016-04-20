# Get names of Activity types and display.
# Save to a CSV file
# Alan Berg

library(httr)
library(jsonlite)
url_adl<-"https://w3id.org/xapi/adl"
req_adl <- GET(url_adl, add_headers("Accept" = "application/ld+json" ))
json_adl <- content(req_adl, as = "text")
info_adl <- fromJSON(json_adl)
# Names of activities and descriptions
info_adl_table<-cbind(info_adl$`activity-types`$prefLabel,info_adl$`activity-types`$definition)
cat("Verbs")
info_adl_table[,1]
colnames(info_adl_table)<-c("ActivityType","Description")
write.table(info_adl_table, file = "activity_typesy.csv", sep = ",", row.names = FALSE)
