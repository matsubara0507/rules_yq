#!/usr/bin/env bash

ROOT=$(pwd)
cd "$BUILD_WORKSPACE_DIRECTORY"
for SRC_PATH in @@SRC_PATHS@@; do
  $ROOT/@@YQ_COMMAND@@ w -i $SRC_PATH @@YAML_KEY@@ --tag '@@YAML_TAG@@' @@YAML_VALUE@@
done
