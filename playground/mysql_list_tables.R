
library("RMySQL")

# Create a connection Object to MySQL database.
# We will connect to the sampel database named "sakila" that comes with MySql installation.
mysqlconnection = dbConnect(MySQL(), user = 'radius_user', password = 'radiuspass', dbname = 'radius_db',
   host = '172.16.105.153')

# List the tables available in this database.
 dbListTables(mysqlconnection)
