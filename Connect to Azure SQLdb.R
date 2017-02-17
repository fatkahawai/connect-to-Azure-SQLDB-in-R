# connect to a SQL database on Azure
# first install RODBC in RStudio
# install unixODBC if nec - brew install unixODBC

library(RODBC)           # Provides database connectivity
 
# The Connection string comes from the Azure ODBC text box
connectionString <- "Driver={FreeTDS};Server=monthly-metrics.database.windows.net,1433;Database=sqldb_monthly_metrics;Uid=vmob@monthly-metrics;Pwd=c&Bd8[wyty=wa'Tz;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;"

#Open your RODBC connection
myConn <- odbcDriverConnect(connectionString)
 
sqlQueryString <- "SELECT TOP 10 * FROM dbo.client_names"
m1 <- sqlQuery(myConn, sqlQueryString)
m1
dim(m1)
#      client_id            client_name
#1       mcd ndl McDonald's Netherlands
#2        oliver               Oliver's
#3       loyalty             Loyalty NZ
#4    mcd baltic      McDonald's Baltic
#5       mcd aus   McDonald's Australia
#6  ikea belgium           IKEA Belgium
#7        techno    Technovation Centre
#8    mcd canada      McDonald's Canada
#9       7eleven               7-Eleven
#10   mcd sweden      McDonald's Sweden
#11    mcd japan       McDonald's Japan
#12   mcd global         McDonald's USA

sqlQueryString <- "SELECT * FROM client_names WHERE client_name LIKE 'M%'"
m2 <- sqlQuery(myConn, sqlQueryString)
m2
#    client_id            client_name
#1    mcd ndl McDonald's Netherlands
#2 mcd baltic      McDonald's Baltic
#3    mcd aus   McDonald's Australia
#4 mcd canada      McDonald's Canada
#5 mcd sweden      McDonald's Sweden
#6  mcd japan       McDonald's Japan
#7 mcd global         McDonald's USA

odbcCloseAll()
