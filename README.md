# frankcarnovale/dbsbox

# Base
Starts FROM wnameless/postgresql-phppgadmin which provides Postgres, PhpPgAdmin, and ssh access.
Go there first for info on ports, etc.

# Extension

We run 2 user-supplied sql scripts to build a database:
- test_user.sql -- connect as postgres; typically creates a database and a schema owner called test_user
- test_data.sql -- connect as test_user; typically builds tables and test data via insert statements
These scripts should be provided via a volume shared to /sql.  If no volume is shared, a trivial 
default set is run instead.  See the build source for the defaults.

# Usage notes
```
############################################
# Name the database server..
dbsi=frankcarnovale/dbsbox

############################################
# Starting the database server..

# 1) with dummy test db..
# 2) with dummy test db and expose phppgadmin..
# 3) with our own test db..
# 4) with our own test db and expose phppgadmin..

docker run -d -p 5432:5432 -p 49160:22                                   $dbsi
docker run -d -p 5432:5432 -p 49160:22 -p 80:80                          $dbsi
docker run -d -p 5432:5432 -p 49160:22          -v /some/project/sql:/sql $dbsi
docker run -d -p 5432:5432 -p 49160:22 -p 80:80 -v /some/project/sql:/sql $dbsi

# call up phppgadmin..
(browse to http://e1a-eslmp-pocd-01.es-dte.co.uk/phppgadmin)

# getting into dbsbox via ssh.. all passwds are x
ssh root@localhost -p 49160     
ssh postgres@localhost -p 49160

# once in as postgres..
cd /sql
psql
# to connect to different dbs or users called xyz as set up in our own test db..
PGPASSWORD=xyz PGDATABASE=xyz PGUSER=xyz psql
```
