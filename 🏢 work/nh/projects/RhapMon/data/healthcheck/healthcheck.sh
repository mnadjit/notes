#/bin/bash
/opt/mssql-tools/bin/sqlcmd -U sa -P $(cat /run/secrets/mssql_password) -Q "Select 1"