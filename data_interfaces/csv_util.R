#!/usr/bin/env Rscript

#######################################################################
generateCSV = function(cod_cli, rawdata, maxNumberOfRows) {

    numberOfRows <- nrow(rawdata)
    numberOfFiles <- ceiling(numberOfRows / maxNumberOfRows)    # ceiling = arredonda para cima


    main_dir <- paste(getwd(), '/', "ftp/result", sep="")
    cod_cli_folder <- paste(main_dir,'/',cod_cli,"-cod_cli",sep="")
    if(!dir.exists(cod_cli_folder)) {
        dir.create(cod_cli_folder)
    }

    file_count <- 1
    start <- 1
    end <- maxNumberOfRows
        while (file_count <= numberOfFiles) {
            
            if (numberOfRows <= maxNumberOfRows) {
                df_buffer <- rawdata[start:numberOfRows,]    
            } else {
                df_buffer <- rawdata[start:end,]
            }
            
            time_stamp <- format(Sys.time(), "%Y%m%d")
            file_name <- paste("output-",cod_cli,"-",time_stamp,"-", file_count,".csv", sep="")
            write.csv(df_buffer, paste(cod_cli_folder,'/',file_name, sep=""))

            file_count = file_count + 1

            start <- start + maxNumberOfRows

            if(file_count == numberOfFiles) {       # se chegar ao ultimo arquivo
                end <- end + (numberOfRows - end)   # gerar indice final somente dos numeros restantes
            } else {
                end <- end + maxNumberOfRows        # senão adiciona novo indice
            }
        
        }   # end while

}


# Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause 
# and contains nonaggregated column 'planta_cliente.TB_PARQUE_MOVEL_ATUAL.ID_MES' 
# which is not functionally dependent on columns in GROUP BY clause; 
# this is incompatible with sql_mode=only_full_group_by
