FOR /F %%x IN ('pwd') DO SET ROOT=%%x
ls %~dp0
ls
cd %BUILD_WORKSPACE_DIRECTORY%
FOR %%x IN (@@SRC_PATHS@@) DO (
  %ROOT%\@@YQ_COMMAND@@ w -i %%x @@YAML_KEY@@ --tag '@@YAML_TAG@@' @@YAML_VALUE@@
)
