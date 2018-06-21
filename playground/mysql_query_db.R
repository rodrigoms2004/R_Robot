
library("RMySQL")


# Create a connection Object to MySQL database.
mysqlconnection = dbConnect(MySQL(), user = 'radius_user', password = 'radiuspass', dbname = 'radius_db',
   host = '172.16.105.153')

data <- 3344
print(data)

#result = dbSendQuery(mysqlconnection, paste("INSERT INTO COD_CLIENTE(cod_cli) VALUES(", data, ")", sep=""))

result = dbSendQuery(mysqlconnection, "select * from TB_PARQUE_MOVEL_ATUAL tbpa
                                        inner join COD_CLIENTE cc ON cc.COD_CLI = tbpa.COD_CLI")

data <- dbFetch(result)# , n = 2)

print (data$COD_CLI);

#write.csv(data, "output.csv")


dbDisconnect(mysqlconnection)

