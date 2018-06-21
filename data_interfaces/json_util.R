#!/usr/bin/env Rscript

# execute install.packages("rjson") in R console to install its library

# Load the package required to read JSON files.
library("rjson")

#######################################################################
readDBConfigFromJSON = function(db_type) {

    if (db_type == "mysql") {
        result <- fromJSON(file = "./config/mysql.json")
    } else if (db_type == "mssql") {
        result <- fromJSON(file = "./config/mssql.json")
    }

    json_data_frame <- as.data.frame(result)

    return (json_data_frame)
}

#######################################################################
getMaxNumberOfRows = function() {
    result <- fromJSON(file = "./config/general.json")
    json_data_frame <- as.data.frame(result)

    return (json_data_frame$maxNumberOfRows)
}

