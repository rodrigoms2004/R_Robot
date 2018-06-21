#!/usr/bin/env Rscript

source("db/db_conn.R")
source("db/crud_mysql.R")
source("data_interfaces/txt_util.R")

#######################################################################
main = function() {

	db_cod_deleteAll()	# limpa a tabela 

	main_dir <- paste(getwd(), '/', "ftp/in_files", sep="")		# define pasta de arquivos
	list_files <- strsplit(list.files(main_dir), '\t')			# adiciona lista de paths

	for(file in list_files) { 
		processFile(paste(main_dir,'/',file, sep=""))			# processa lista
	}															# fazendo a inclusão no DB
}	#end main

#######################################################################
#######################################################################
main()

