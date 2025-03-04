#!/bin/bash

# This script is used to generate the PDF files from the markdown files.

# Since ubuntu 23.04, unprivileged user namespaces are restricted by default for security reasons.
# See https://chromium.googlesource.com/chromium/src/+/main/docs/security/apparmor-userns-restrictions.md
echo 0 | sudo tee /proc/sys/kernel/apparmor_restrict_unprivileged_userns

echo "Generating for ref name: $1"

# Replace / with _ in the ref name
ref_name=$(echo $1 | sed 's/\//_/g')

npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$ref_name/business_objects_upload/\"}" ./business_objects_upload/README.md
npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$ref_name/business_objects_upload/\"}" ./business_objects_upload/CONFIGURATION.md
npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$ref_name/postman_collection/\"}" ./postman_collection/README.md
npx md-to-pdf --marked-options "{\"baseUrl\":\"https://github.com/d-velop/dvelop-bo-toolkit/tree/$ref_name/\"}" ./README.md