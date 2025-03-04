#!/bin/bash

echo "Creating release for ref: $2"

# Replace / with _ in the ref name
ref_name=$(echo $2 | sed 's/\//_/g')

echo "Sanitized ref name: $ref_name"

mkdir temp temp/business_objects_upload temp/postman_collection temp/business_objects_upload/config_templates
# General stuff
cp ./README.pdf ./temp/Manual-$ref_name.pdf
# Upload script stuff
cp ./business_objects_upload/BusinessObjectsUpload.ps1 ./temp/business_objects_upload
cp ./business_objects_upload/config_templates/* ./temp/business_objects_upload/config_templates -r
cp ./business_objects_upload/supplier.csv ./temp/business_objects_upload
cp ./business_objects_upload/ScriptConfig.json ./temp/business_objects_upload/ScriptConfig.json
cp ./business_objects_upload/CONFIGURATION.pdf ./temp/business_objects_upload/Configuration-$ref_name.pdf
cp ./business_objects_upload/README.pdf ./temp/business_objects_upload/Manual-$ref_name.pdf
# Postman stuff
cp ./postman_collection/Business_Objects_Environment.postman_environment.json ./temp/postman_collection
cp ./postman_collection/Business_Objects.postman_collection.json ./temp/postman_collection
cp ./postman_collection/README.pdf ./temp/postman_collection/Manual-$ref_name.pdf

cd temp

zip -r $1-release-$ref_name.zip *
mv ./$1-release-$ref_name.zip ../.

cd ..
rm ./temp -r

# Create copy of the zip file with the latest tag
cp ../$1-release-$ref_name.zip ../$1-release-latest.zip