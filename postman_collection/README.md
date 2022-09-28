# business objects Postman collection

## Overview

With d.velop business objects you can store self-defined data objects in d.velop cloud and thus complement d.velop data models with your own data models and entities
that can be used in other apps, services and custom code.

This Postman collection contains requests that represent some basic use cases to demonstrate the business objects API.

## Getting started

To execute the requests some things must be observed and configured.
A Postman environment is needed to configure user authentication and store some requests return values that can then be used/are needed by subsequent requests.

1. Download the release zip archive [`dvelop-bo-toolkit-release-vx.x.x.zip`](https://github.com/d-velop/dvelop-bo-toolkit/releases) from the release section and extract it
   or clone this repository by executing `git clone https://github.com/d-velop/dvelop-bo-toolkit.git`
2. Go to the `postman_collection` sub folder
3. Import the file [`Business_Objects_Environment.postman_environment.json`](Business_Objects_Environment.postman_environment.json) into Postman to create an environment.
   This can be done by pressing the *file* button in the toolbar and hitting *import*.
   In the following dialog just select the mentioned environment file and hit *import*.
4. After the import succeeded the environment can be selected (if not already happened) by selecting it from the environment drop down menu in the top right corner.
   Now it can be inspected and edited by hitting the eye-icon-button also in the top right corner.
5. Import the [`Business_Objects.postman_collection.json`](Business_Objects.postman_collection.json) into Postman
6. Set [environment variables](README.md#environment-variables)

> Additional information on Postman environments and how to import and manage them can be found in the
> [Postman documentation](https://learning.postman.com/docs/sending-requests/managing-environments/).

### Environment variables

The following variables are used in the course of these steps, some of which have to be filled in by yourself:

| Variable name    | Set automatically | Description                                                                                |
|------------------|-------------------|--------------------------------------------------------------------------------------------|
| apiKey           | No                | Needed for authentication (generated and copied from the IDP app configuration)            |
| baseUri          | No                | Host of the business objects instance (e. g. `https://<tenant-domain>.d-velop.cloud`)      |
| modelId          | Yes               | GUID of the example model `ERP-Data`                                                       |
| supplierId       | Yes               | GUID of the example entity type `Supplier`                                                 |
| modelName        | No                | Name of a model. Only used in requests contained in the *Quick start* folder               |
| entityPluralName | No                | Plural name of an entity type. Only used in requests contained in the *Quick start* folder |

#### apiKey
The variable `apiKey` requires an API key that can be generated via the d.velop platform.
In this collection of requests, it is used for the authorization of all requests in the collection.
To reference it correctly, the following steps are required:

*  Open the collection by clicking on it
*  Choose the *Authorization* tab
*  Choose *Bearer Token* as type
*  Specify the API key variable under *Token+. The variable name must be placed in double curly brackets: `{{apiKey}}`.
*  Save changes by using `Ctrl+S`

> Additional information on how to configure authorization in Postman can be found in the [Postman documentation](https://learning.postman.com/docs/sending-requests/authorization/).
> In the context of authorization and collections see especially [this](https://learning.postman.com/docs/sending-requests/authorization/#inheriting-authorization) section.

From now on the required authorization header will be sent with all requests of the collection.

#### baseUri

`baseUri` contains the base URI of the d.velop cloud instance and contains the protocol, host and port parts of a URI.
It is constructed like `https://<tenant-domain>.d-velop.de`, so for example `https://my-company.d-velop.cloud`.

#### modelId

GUID of the model that is created as part of this tutorial and for example used to delete the created model.
It is set automatically and must generally not be touched.

#### supplierId

GUID of the `Supplier` entity type that is created as part of this tutorial and for example used to modify the entity type.
It is set automatically and must generally not be touched.

#### modelName

`modelName` is only used in requests in the *Quick start* folder and must contain the name of the model that shall be used in those requests.
It can be the same model as that, that is created as part of this tutorial but can be any other model.

#### entityPluralName

`entityPluralName` is only used in requests in the *Quick start* folder and must contain the name of the entity type that shall be used in those requests.
It can be the same entity type as that, that is created as part of this tutorial but can be any other entity type.

If the environment has now been selected, the requests in the collection can be successfully executed, provided that the order of execution is observed,
which is explained in the next section.

## Example requests

There are three main folders in this Postman collection: *Quick start*, *Model configuration* and *Data delivery and queries*.
The folder *Quick start* contains requests for creating, querying and deleting entities, which are intended for a quick start and to used with own models.
The folder *Model configuration* contains a routine for creating the model and the associated entity types as well as a further folder that exemplifies all other request possibilities.
The folder *Data delivery and queries*, on the other hand, contains the necessary requests to create, query, modify and delete actual entities.

### Model configuration: Model and entity type creation and interaction

The model is called `ERP_Data` and it contains two entity types: `Supplier` and `Customer`.

The entity type `Supplier` requires a supplier number as a key. Furthermore, there are the properties `Name` and `City`.
The entity type `Customer` is to receive a customer number as a key and can be filled with the values for `Name`, `Country` and `ContactPersons`.
The latter is represented as a list of strings.

To be able to start with this project, the `ERP_Data` model and the entity types must be created at the beginning.
For this purpose, the *Routine* folder is used, in which all requests have to be executed *one after another* from *top to bottom*.
The procedure is as follows: First, the `POST` request *new model erp data* is executed. The model GUID of the model just created is returned in the response and stored in the environment variable (`modelId`).
This variable is used in subsequent requests for the entity types, as well as in the `GET`, `PUT` and `DELETE` requests of the model, which are located in the folder *Templates & Examples*.
The same principle for creating, editing, retrieving and deleting applies for the entity types `Supplier` and `Customer`.
The suppliers' and only the suppliers' GUID is extracted from the response and stored in the `supplierId` environment variable, so that it can be used for future requests to modify, delete or query the entity type.

It should be noted that all types of requests besides the `POST` request are only implemented for the entity type `Supplier` and can be found in the *Templates & Examples/Supplier (Entity type)* folder.
The request *new entity type supplier* must be executed once before the other requests in the folder *Supplier* can be executed successfully.

Now that the configuration of the model and the entity types have been completed by executing the `POST` requests, the model must first be set to the `Published` status. Further information on the staging mechanism can be found in the service documentation.
We achieve this by executing the `PATCH` requests, which represent the end of the routine. As soon as these requests have been executed, it is possible to deliver the business objects and query, modify or delete them afterwards.

### Templates & Examples

The templates and examples folder contains all the requests from the *Routine* folder and in addition to that requests for deleting, querying and modifying the model as well as the two entity types.

### Data delivery and queries: Creating, Modifying, Querying and Deleting entities

> **_Note:_** In order to start with this project, the `ERP_Data` model and entity types need to be created first.

Sample requests can be found in the main folder *Data delivery and queries*. As with the entity type interaction all types of requests are only implemented for the supplier entity type, but are generally the same for the customer entity type.
It contains requests for creating (`POST`), modifying (`PUT`/`PATCH`), querying (`GET`) and deleting (`DELETE`) entities.
For multiple execution of the create (`POST`) requests, the key attributes should be adjusted or the business object with the same key has to be deleted.
These cannot occur twice.
If suppliers and/or customers exist, their values can be adjusted or they can be deleted entirely using the `PUT` and `DELETE` requests.

> **_Note:_** Requests with the *- state: staged* prefix only work if the model has not already been published.

## API Documentation
Additional information can be found in the [d.velop business objects API Guide](https://dv-businessobjects-assets.s3.eu-central-1.amazonaws.com/apidoc/latest/index.html).
