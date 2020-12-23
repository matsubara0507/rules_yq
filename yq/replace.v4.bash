#!/usr/bin/env bash

ROOT=$(pwd)
cd "$BUILD_WORKSPACE_DIRECTORY"
for SRC_PATH in @@SRC_PATHS@@; do
  $ROOT/@@YQ_COMMAND@@ eval '.@@YAML_KEY@@ = @@YAML_VALUE@@' -i $SRC_PATH
done
