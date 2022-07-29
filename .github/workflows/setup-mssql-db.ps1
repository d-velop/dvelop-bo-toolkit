param (
    [Parameter(Mandatory = $True)] $dbPassword
)

[Environment]::SetEnvironmentVariable('DB_PASSWORD', $dbPassword, 'Process')

docker-compose -f ./business_objects_upload/test/mssql/docker-compose.yaml up -d

Start-Sleep 30

sqlcmd -U sa -P $dbPassword -i ./business_objects_upload/test/mssql/setup_db.sql
sqlcmd -d dataupload_script  -U sa -P $dbPassword -i ./business_objects_upload/test/mssql/setup_table.sql
sqlcmd -d dataupload_script  -U sa -P $dbPassword -i ./business_objects_upload/test/mssql/insert_mock_data.sql