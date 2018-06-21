
processFile = function(filepath) {

	list_data <- list("CODCLI")

  	con = file(filepath, "r")
  	while ( TRUE ) {
    	line = readLines(con, n = 1)
    	if ( length(line) == 0 ) {
      		break
    	}
		list_data[length(list_data)+1] <- line
  	}	

	close(con)

	list_data[1] <- NULL	

	for(i in list_data) { print(i) }


}

processFile("codcli.txt")

