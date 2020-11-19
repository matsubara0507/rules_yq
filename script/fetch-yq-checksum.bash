#!/bin/bash

VERSION=$1

for ARCH in "linux_amd64" "darwin_amd64" "windows_amd64.exe"
do
  wget --quiet "https://github.com/mikefarah/yq/releases/download/${VERSION}/yq_${ARCH}"
  shasum -a 256 "yq_${ARCH}"
  rm "yq_${ARCH}"
done
