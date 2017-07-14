---
platform: linux

image_resource:
  type: docker-image
  source: { repository: concourse/bosh-cli }

inputs:
  - name: resource-tutorial

run:
  path: bash
  args:
    - -e
    - -c
    - |
      ls -l
      pwd
      ls -R
      cd resource-tutorial
      PACKAGE_VERSION=$(awk '/version/{gsub(/("|",)/,"",$2);print $2};' package.json)
      echo $PACKAGE_VERSION
