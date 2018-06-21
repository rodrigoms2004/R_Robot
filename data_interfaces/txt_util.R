#!/usr/bin/env Rscript

source("db/db_conn.R")

#######################################################################
processFile = function(filepath) {

  	con = file(filepath, "r")
  	while ( TRUE ) {
    	line = readLines(con, n = 1)
    	if ( length(line) == 0 ) {
      		break
    	}
        db_cod_insert(line)
  	}	

	close(con)
}
