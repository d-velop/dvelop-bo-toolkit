echo "Generating for ref name: $1"

npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$1/business_objects_upload/\"}" ./business_objects_upload/README.md
npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$1/business_objects_upload/\"}" ./business_objects_upload/CONFIGURATION.md
npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$1/postman_collection/\"}" ./postman_collection/README.md
npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$1/\"}" ./README.md