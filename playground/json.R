#!/usr/bin/env Rscript

# execute install.packages("rjson") in R console to install its library

# Load the package required to read JSON files.
library("rjson")

# Give the input file name to the function.
#result <- fromJSON(file = "./config/db.json")
#result <- fromJSON(file = "./config/mysql.json")
result <- fromJSON(file = "./playground/db.json")


# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(result)

print(json_data_frame)

print("###### MYSQL")
print(as.character(json_data_frame$mysql_conn.username))
print(as.character(json_data_frame$mysql_conn.password))
print(as.character(json_data_frame$mysql_conn.db_name))
print(as.character(json_data_frame$mysql_conn.server))

print("###### MSSQL")
print(as.character(json_data_frame$mssql_conn.username))
print(as.character(json_data_frame$mssql_conn.password))
print(as.character(json_data_frame$mssql_conn.db_name))
print(as.character(json_data_frame$mssql_conn.server))



# json format

# {
#     "mysql_conn" : {
#         "username" : "radius_user",
#         "password" : "radius_pass",
#         "db_name"  : "radius_db",
#         "server"   : "172.16.105.153"
#     },
#     "mssql_conn" : {
#         "username" : "sa",
#         "password" : "Cisco2018",
#         "db_name"  : "",
#         "server"   : "SQLServerDSN"        
#     }
# }