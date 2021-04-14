#install.packages("RPostgreSQL")
# ********************************* CONNECTION BASE ORACLE *******************************

#Telecharger le driver JDBC au lien suivant :
# http://www.oracle.com/technetwork/database/enterprise-edition/jdbc-112010-090769.html 
# Telecharger le fichier ojdbc6.jar et le placer dans un dossier  (ex : driver_JDBC ) que l'on aura préalablement créé

# Installer le package RJDBC 
install.package(« RJDBC »)

# Configurer le driver JDBC a l'aide de la commande JDBC ( attention a préciser le bon chemin pour le fichier ojdbc6.jar)
jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver", classPath="C:/driver_JDBC/ojdbc6.jar","'")

# Lancer la commande dbConnect avec les paramètres de la base Oracle
conn_jdbc <- dbConnect(jdbcDriver,  "jdbc:oracle:thin:@SERVEUR24.domaine.exploitation.groupve.local:1432:v8", "uid", "pwd",encoding="UTF-8")


# ********************************* CONNECTION BASE ORACLE *******************************
# Chargement du package RJDBC
library(RJDBC)

# A noter : il faut au prealable telecharger le fichier sqljdbc4.jar
drv <- JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver" , "C:/jdbc/sqljdbc_4.0/enu/sqljdbc4.jar" ,identifier.quote="`")
d <- dbGetQuery(conn, "select * from sys.databases where database_id <= 4 ")


# ********************************* CONNECTION BASE POSTGREE *******************************
# Chargement des librairies
library(fst)
library(data.table)
library(dplyr)
library(RPostgreSQL)

# create a connection
# save the password that we can "hide" it as best as we can by collapsing it

# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")

# creates a connection to the postgres database
# note that "con" will be used later in each connection to the database
con <- dbConnect(drv,  user = "postgres", password = "my_pwd")

# Test if database exists 
dbExistsTable(con, "postgres")

# Read 
DATA <- read_fst("my_path",as.data.table = T)


# writes df to the PostgreSQL database "postgres", table "cartable"
dbWriteTable(con, 'DATA', value = DATA, append = TRUE, row.names = FALSE)


# Temps de lecture sans INDEX
df_postgres <- dbGetQuery(con, 'SELECT * FROM public."DATA_CONSO" WHERE "DAT_RLV" > \'2018-01-27 00:00:00.0\';') %>%
  as.data.table()


