#!/usr/bin/env Rscript

source("db/db_conn.R")

main = function() {
    
    #SQL QUERY
    sql_query <- "delete from TB_PARQUE_MOVEL_ATUAL"

    mysqlconnection = getMySQLConn()
	result = dbSendQuery(mysqlconnection, sql_query)
    
	if (dbIsValid(result)) {
		print ("SQL-OK")
	} else {
		print (paste("SQL-ERROR:", result, sep=""))
	}

    dbClearResult(result)

    closeMySQLConn(mysqlconnection)
}

#######################################################################
#######################################################################
main()