#!/usr/bin/env Rscript

library("RMySQL")
source("data_interfaces/json_util.R")

#######################################################################
#######################################################################
# MySQL Data    
db_mysql_param <- readDBConfigFromJSON("mysql")

getMySQLConn = function() {
    # Create a connection Object to MySQL database.
    mysqlconnection = dbConnect(
						MySQL(), 
						user = as.character(db_mysql_param$conn.username), 
						password = as.character(db_mysql_param$conn.password), 
						dbname = as.character(db_mysql_param$conn.db_name),
    					host = as.character(db_mysql_param$conn.server)
                        )

    return (mysqlconnection)
}   # end getMySQLConns

closeMySQLConn = function(mysqlconnection) {
    dbDisconnect(mysqlconnection)
}

#######################################################################
#######################################################################
# MS-SQL DATA
mssql.data <- data.frame(
    serverName = c("SQLServerDSN"),
    username = c("sa"),
    password = c("Cisco2018")
)

db_mssql_param <- readDBConfigFromJSON("mssql")

getSQLData = function(sql_query) {

    library(RODBC)

    odbc.key = odbcConnect(
                    as.character(db_mssql_param$conn.server), 
                    uid=as.character(db_mssql_param$conn.username), 
                    pwd=as.character(db_mssql_param$conn.password))

    rawdata = sqlQuery( channel= odbc.key, 
                        query = sql_query)

    odbcClose(odbc.key)

    return (rawdata);
}

