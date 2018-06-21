#!/usr/bin/env Rscript

library("RMySQL")
source("db/db_conn.R")

#######################################################################
db_cod_deleteAll = function() {

	query <- "DELETE FROM COD_CLIENTE"

	mysqlconnection = getMySQLConn()
	result = dbSendQuery(mysqlconnection, query)

	if (dbIsValid(result)) {
		#print ("SQL-OK")
	} else {
		#print (paste("SQL-ERROR:", result, sep=""))
	}
	
	dbClearResult(result)
	closeMySQLConn(mysqlconnection)
}

#######################################################################
db_cod_insert = function(codcli) {

	query <- paste("INSERT INTO COD_CLIENTE(cod_cli, inserted_at) 
		 				VALUES(", codcli, ", unix_timestamp(now()))", sep="")
    
	mysqlconnection = getMySQLConn()
	result = dbSendQuery(mysqlconnection, query)

	if (dbIsValid(result)) {
		#print ("SQL-OK")
	} else {
		#print (paste("SQL-ERROR:", result, sep=""))
	}
	
	dbClearResult(result)
	closeMySQLConn(mysqlconnection)
}
