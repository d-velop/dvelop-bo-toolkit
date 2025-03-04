#!/bin/bash

# This script is used to generate the PDF files from the markdown files.

# Since ubuntu 23.04, unprivileged user namespaces are restricted by default for security reasons.
# See https://chromium.googlesource.com/chromium/src/+/main/docs/security/apparmor-userns-restrictions.md
echo 0 | sudo tee /proc/sys/kernel/apparmor_restrict_unprivileged_userns

echo "Generating for ref name: $1"

npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$1/business_objects_upload/\"}" ./business_objects_upload/README.md
npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$1/business_objects_upload/\"}" ./business_objects_upload/CONFIGURATION.md
npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$1/postman_collection/\"}" ./postman_collection/README.md
npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$1/\"}" ./README.md