# Configuration

Documentation of the `ScriptConfig`, used as the only way to configure the data upload script. In the following each required and optional attribute, its type and its purpose will be explained.

Execute the following steps to use the script in your use case:

1. Meet [prerequisites](README.md#prerequisites)
2. Configure the import process by creating a script config. You can also use one from the [config_templates](config_templates)
3. Save it in the **same directory** as the `BusinessObjectsUpload.ps1` script, or specify it when executing the script using the `-configPath <configPath>` argument. **Note** that the path needs to start with `/` or `./`
4. Configure entity type attribute mapping through the `mapping` attribute in the `ScriptConfig.json` json file. See the [mapping section](CONFIGURATION.md#mapping) below for more information
5. Start `BusinessObjectsUpload.ps1`

## Scheduled imports

The preferred method is to use a task scheduler e. g. one provided by the operating system (e. g. [Windows Task Scheduler](https://learn.microsoft.com/en-us/windows/win32/taskschd/task-scheduler-start-page) or [systemd](https://systemd.io/) on Linux).
If this method is used, it is **strongly advised** to set the `execByScheduler` config property to `true`.

### Alternative option

As an alternative it is possible to configure the `importIntervalTime` property in the config, then the script waits after each execution according to the value configured in `importIntervalTime` (time to wait in seconds, if set to `0`, re-execution is disabled) and starts regularly importing the data into business objects

### Warning

Make sure that only **one** of the previously mentioned properties is set to true, otherwise the script will exit with a proper error message.

## business objects related configuration
| Name                      | Type               | Required                 | Example                              | Description                                                                                                                                                                                                                                                                                  |
|---------------------------|--------------------|--------------------------|--------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| scriptName                | string             | false                    | `"supplier_upload"`                  | Name of the script                                                                                                                                                                                                                                                                           |
| baseUri                   | string(valid URI)  | true                     | `"https://my-company.d-velop.cloud"` | Base URI, usually something like `https://<tenant-domain>.d-velop.cloud`, where the term *<tenant-domain\>* has to be replaced by your tenant specific subdomain                                                                                                                             |
| apiKey                    | string             | true                     | `"lsRafjkl[...]"`                    | Key for authentication                                                                                                                                                                                                                                                                       |
| modelName                 | string             | true                     | `"ERP_Data"`                         | Name of the model. If the model is staged do not append a `-staged` to the name, but instead set the `modelIsStaged` property to `true`                                                                                                                                                      |
| entityPluralName          | string             | true                     | `"Suppliers"`                        | Plural name of the entity type                                                                                                                                                                                                                                                               |
| entityKey                 | string             | true                     | `"SupplierNo"`                       | Name of the property that is the primary key of the entity                                                                                                                                                                                                                                   |
| entityKeyType             | string             | true                     | `"Int32"`                            | Type of the primary key. Can have the values `String`, `Int32`, `Int64` or `Guid`                                                                                                                                                                                                            |
| failOnError               | boolean            | false - Default: `false` | `true`                               | Whether the script should exit if an error occurs. For example, if an entity cannot be created in business objects because it is missing an attribute value, the script will exit if this option is set to `true`. If set to `false`, an error will be logged, but the script will continue to the next entry |
| modelIsStaged             | boolean            | false - Default: `false` | `true`                               | Set to `true` if the model is staged, `false` if it is published.                                                                                                                                                                                                                            |
| deleteNonExistingEntities | boolean            | false - Default: `false` | `true`                               | Indicates whether entities that are deleted in the data source should also be deleted in business objects                                                                                                                                                                                    |
| importIntervalTime        | uint               | false - Default: `0`     | `600`                                | Import interval time (in seconds) after which the script shall be re-executed; Min value is `60`; If value is `0` re-execution is disabled                                                                                                                                                     |
| execByScheduler        | boolean               | false - Default: `false`     | `true`                                | Whether the script is started by a scheduler (e. g. Windows Task Scheduler, systemd etc.). If set to `true` this option makes sure that the script does not wait for any user input if an error occurs. **Note** that `execByScheduler` and `importIntervalTime` can not be configured at the same time |
| noBatching               | boolean            | false - Default: `false` | `true`                               | Whether the script should use business objects's batching feature for the import or not. `false` means the batching feature will be used                                                                                                                                                       |
| logDir                    | string(valid path) | false - Default: `null`  | `"./Logs"`                           | Path where the log file should be stored, `null` means logs are written to the console only                                                                                                                                                                                                  |
| debugLog                  | boolean            | false - Default: `false` | `true`                               | Whether the logging level should be `DEBUG`, otherwise it is `INFO`. **Only considered when `logDir` is set, if not the log level is always `DEBUG`**                                                                                                                                        |
| deleteOldLogs             | uint               | false - Default: `0`     | `10`                                 | Number of days after which old logs are deleted. If the value is `0` the deletion of old logs is disabled. **Only considered when `logDir` is set**                                                                                                                                          |

## Datasource related configuration
| Name   | Type   | Required | Example  | Description                                                                  |
|--------|--------|----------|----------|------------------------------------------------------------------------------|
| dbType | string | true     | `"CSV"`  | Type of the datasource. Can have the values `"CSV"`, `"Oracle"` or `"MSSQL"` |

### __Required when DB type is 'CSV'__
| Name             | Type               | Required | Example                             | Description                                                                                         |
|------------------|--------------------|----------|-------------------------------------|-----------------------------------------------------------------------------------------------------|
| csvPath          | string(valid path) | true     | `"./Directory/supplier_data.csv"` | Path where to find the CSV file                                                                     |
| csvHeader        | string[]           | false    | `["SupplierNo", "Name", "City"]`    | An array of csv column header names. Specifies an alternate column header row for the imported file |
| csvFileDelimiter | string             | true     | `";"`                               | The character that separates each column                                                            |

### __Required when DB type is 'Oracle'__
| Name       | Type                   | Required | Example                                                                                                                            | Description                                                |
|------------|------------------------|----------|------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------|
| user       | string                 | true     | `"admin"`                                                                                                                          | The database user                                          |
| password   | string                 | true     | `"123456789"`                                                                                                                      | The database users' password                               |
| query      | string(SQL expression) | true     | `"SELECT SupplierNo, Name, City FROM CO_Suppliers"`                                                                                | The SQL query used to query the entities from the database |
| dataSource | string                 | true     | `"(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=<host>)(PORT=1521))(CONNECT_DATA = (SERVER=dedicated)(SERVICE_NAME=<Service_Name>)))"` | The definition of the data source                          |

### __Required when DB type is 'MSSQL'__
| Name         | Type                   | Required | Example                                             | Description                                          |
|--------------|------------------------|----------|-----------------------------------------------------|------------------------------------------------------|
| user         | string                 | true     | `"admin"`                                           | The database user                                    |
| password     | string                 | true     | `"123456789"`                                       | The database users' password                         |
| query        | string(SQL expression) | true     | `"SELECT SupplierNo, Name, City FROM CO_Suppliers"` | The SQL query used to query the entities from the db |
| dbServer     | string                 | true     | `"localhost"`                                       | The database server                                  |
| databaseName | string                 | true     | `"My_Database"`                                     | The name of the database                             |

### Mapping
| Name    | Type     | Required | Example   | Description                                                                                         |
|---------|----------|----------|-----------|-----------------------------------------------------------------------------------------------------|
| mapping | string[] | true     | See below | Mapping of the attributes from the datasource to the properties of the business objects entity type |

Mapping example:
```
[
    "SupplierNo = [int]$row.SupplierNo",
    "Name = $row.Name",
    "City = $row.City"
]
```
Each entry in the array defines exactly one mapping. On the left side is the name of the attribute in business objects, on the right side the value is extracted from the datasource entry.
The provided mapping code is executed for each row that will be imported into business objects. Technically the provided code is parsed as a PowerShell *scriptBlock* and is executed to define the properties of a PSObject, so for the mapping of each attribute any valid PowerShell **variable definition** can be provided.

#### Access values
The **row** can be accessed via `$row`.

The **property of a row** can be accessed via `$row.property_name`, if `dbType` is `CSV` and via `$row.item('property_name')` if `dbType` is `Oracle` or `MSSQL`.

**Note**: The CSV reader converts all values into a **string**, so if `dbType` is equal to `CSV`, an additional **cast** is needed when **mapping** the attributes. For example:
```
...
"SupplierNo = [int]$row.SupplierNo",
...
```

Additional examples:

The properties `Name` and `City` from the datasource are merged into one business objects property `company_address`:
```
[
    "SupplierNo = $row.SupplierNo",
    "company_address = \"$($row.Name) $($row.City)\""
]
```

The business objects property `SupplierNo` is generated randomly:
```
[
    "SupplierNo = Get-Random -Maximum 100 | Out-String -NoNewline",
    "Name = $row.name"
]
```

Full example with all possible property types that are supported by the data upload script:

Note that the null check can be done with a short conditional expression `'value' = $row.value ? $row.value : $null`, but that does not work in older PowerShell versions (lower than version 6).
Of course the null check is not mandatory, but depends on your mapping code.
```
[
    "primary_key = [int]$row.primary_key",
    "string = $row.string",
    "boolean = [bool]$row.boolean",
    "double = [double]$row.double",
    "guid = $row.guid",
    "int32 = [int]$row.int32",
    "date = if($row.date) {([datetime]::parse($row.date)).ToString('yyyy-MM-dd')} else {$null}"
]
```