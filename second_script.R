#!/usr/bin/env Rscript

source("db/db_conn.R")
source("data_interfaces/csv_util.R")
source("data_interfaces/json_util.R")

#######################################################################
main = function() {

    # número máximo de linhas por arquivo CSV
    maxNumberOfRows <- getMaxNumberOfRows()

    # SQL QUERY
    sql_query <- "select COD_CLI from COD_CLIENTE"

	mysqlconnection = getMySQLConn()
	result = dbSendQuery(mysqlconnection, sql_query)
    
	if (dbIsValid(result)) {
		print ("SQL-OK")
	} else {
		print (paste("SQL-ERROR:", result, sep=""))
	}

    data <- dbFetch(result, n = -1)

    for (row in 1:nrow(data)) {

        cod_cli <- data[row, "COD_CLI"]
        sql_query <- (paste("select * from TB_PARQUE_MOVEL_ATUAL where COD_cli = ", cod_cli, sep="")) 
        result = dbSendQuery(mysqlconnection, sql_query)

        data_tb <- dbFetch(result, n = -1)
        # print(nrow(data_tb))
        print(sql_query)

        if(nrow(data_tb) != 0) {

            generateCSV(
                    cod_cli,
                    data_tb,
                    maxNumberOfRows)                     

        }   # end if

        dbClearResult(result)
    }   # end for

    closeMySQLConn(mysqlconnection)
    
}   #end main

#######################################################################
#######################################################################
main()

