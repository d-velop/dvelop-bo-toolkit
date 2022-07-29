echo "Creating release for ref: $2"

mkdir temp temp/business_objects_upload temp/postman_collection temp/business_objects_upload/config_templates
# General stuff
cp ./README.pdf ./temp/Manual-$2.pdf
# Upload script stuff
cp ./business_objects_upload/BusinessObjectsUpload.ps1 ./temp/business_objects_upload
cp ./business_objects_upload/config_templates/* ./temp/business_objects_upload/config_templates -r
cp ./business_objects_upload/supplier.csv ./temp/business_objects_upload
cp ./business_objects_upload/ScriptConfig.json ./temp/business_objects_upload/ScriptConfig.json
cp ./business_objects_upload/CONFIGURATION.pdf ./temp/business_objects_upload/Configuration-$2.pdf
cp ./business_objects_upload/README.pdf ./temp/business_objects_upload/Manual-$2.pdf
# Postman stuff
cp ./postman_collection/Business_Objects_Environment.postman_environment.json ./temp/postman_collection
cp ./postman_collection/Business_Objects.postman_collection.json ./temp/postman_collection
cp ./postman_collection/README.pdf ./temp/postman_collection/Manual-$2.pdf

cd temp

zip -r $1-release-$2.zip *
mv ./$1-release-$2.zip ../.

cd ..
rm ./temp -r