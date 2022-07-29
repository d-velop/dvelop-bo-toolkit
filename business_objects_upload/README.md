# business objects upload script

With this PowerShell script, data can be retrieved from various data sources and uploaded to d.velop business objects.

It does **not create a model and it's entity types**, these have to be created manually either via the admin user interface, an HTTP request or any other viable method.

## Getting started

This step-by-step guide will show you how to run a simple hello world like demo of this script on your computer. If you run into issues, check the prerequisites below.

1. Download the release zip archive [`dvelop-bo-toolkit-release-vx.x.x.zip`](https://github.com/d-velop/dvelop-bo-toolkit/releases) from the release section and extract it
   or clone this repository by executing `git clone https://github.com/d-velop/dvelop-bo-toolkit.git`
2. Go to the `business_objects_upload` sub folder
3. Configure the following model and entity type in business objects by using one of following alternatives.

   **Alternative 1:** Use the business objects admin user interface available at `https://<your-tenant-name>.d-velop.cloud/businessobjects/admin/models`:
   1. Create model with name: `ERP_Data` in initial state
   2. In that model create an entity type with the following properties
      * Name: `Supplier`
      * Plural name: `Suppliers`
      * Key property name `SupplierNo` and type `int32`
      * Additional property `Name` and type `string`
      * Additional property `City` and type `string`
   3. Stage the model
   4. Publish the model

   **Alternative 2:** Use this [Postman collection](./../postman_collection).
   After you [configured](./../postman_collection/README.md) it, execute the following requests:
   1. Model Configuration/Routine/new model erp data (Creates the model)
   2. Model Configuration/Routine/new entity type supplier (Creates the supplier entity type)
   3. Model Configuration/Routine/model erp data state = published (Publishes the model)

4. Generate a d.velop cloud API key on the configuration page of the identity provider app available at `https://<your-tenant-name>.d-velop.cloud/identityprovider/config/apikey`
5. Next you need to edit the config file that defines the import process:
   * Open the configuration file in this directory named `ScriptConfig.json` in an editor of your choice
   * Set the value of `baseUri` to your base URI. It usually has the following structure `https://<your-tenant-name>.d-velop.cloud`
   * Enter the generated API key in the `apiKey` property
6. Now you can start the script and 30 suppliers from the `suppliers.csv` file located in this directory will be uploaded to business objects

After the first import runs successfully, the script waits 600 seconds (10 minutes) and runs the import again.
To end the script you can simply press `CTRL+C` or close the window.

## Further documentation & Next steps

* How to use and configure the script to your needs can be found on the [CONFIGURATION](CONFIGURATION.md) page.
* This repository also provides [example script configurations](config_templates) for imports from a MSSQL and Oracle DB data source.

## Prerequisites

- PowerShell version >= 5.1 is installed
- You may encounter errors if the execution of PowerShell scripts is not allowed. This can be configured using `Set-ExecutionPolicy RemoteSigned`, for more information see the [PowerShell docs on this topic](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies)
- d.velop business objects is subscribed in the d.velop cloud tenant
- A business objects model and an entity type are configured. To learn how to achieve this, see the Postman collection (can be downloaded as a separate archive from the Releases section, where this archive was also downloaded)
- An API key for a user with the following permissions was generated in the IDP app configuration (and is configured in the config json):
  - Query data
  - Deliver data
- If the data source is a SQL database:
  - Database connection information are available (read access)
  - SQL Query to request the relevant data from the database is created

## Data type constraints

Not all data types supported by business objects are currently supported by the upload script. The supported and unsupported data types are broken down in more detail below.

### Key property types

The following data types can be used for the key property of an entity type:
- guid
- int32
- int64
- string

### Property types

The following types are supported for the properties of an entity type:
- boolean
- dateTimeOffSet
- double
- guid
- int16
- int32
- int64
- date
- string

However, the following data types are not currently supported:
- binary
- byte
- list\<string\>
- decimal
- sByte
- single

**Notes**

- `.` must be used as a decimal separator in CSV files
- Values of type `date` must be in the format `yyyy-MM-dd`, e.g. `2013-07-05`
- `dateTimeOffset` values must be in the format `yyyy-MM-ddTHH:mm:ssZ`, e.g. `2013-07-05T00:00:00Z`

## Disclaimer

- The PowerShell script only communicates with the d.velop service business objects and, if configured, a database to perform the import.
- Besides the config json and the CSV file (if configured) it does not access any files on your computer.
- If configured it also creates and deletes log files, but these are the only files this script creates and/or deletes.

## API Documentation

Additional information can be found in the [d.velop business objects API Guide](https://dv-businessobjects-assets.s3.eu-central-1.amazonaws.com/documentation/latest/business_objects_api.html).