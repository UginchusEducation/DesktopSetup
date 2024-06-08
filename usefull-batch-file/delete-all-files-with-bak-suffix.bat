@echo off

call "%~dp0\my-config.bat"

echo =========== Start delete .bak files ===========

pushd "%ProjectRoot%"
del /s /q /f /a *.bak

echo =========== Finish deleting .bak files ===========
echo ----
echo ----
set /p DirectoryToCopy="Press enter key to exit....."
popd