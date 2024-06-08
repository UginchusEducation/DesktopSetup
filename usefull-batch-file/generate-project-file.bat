@echo off

call "%~dp0\my-config.bat"

echo ---------- Run Version Selector ------------
%VersionSelector% -switchversionsilent %ProjectPath% %MyEnginePath%

echo ---------- Run Auto Build Tool -------------
%UBTRelativePath% -projectfiles -progress -project=%ProjectPath%
:: -game -engine // flags for source engine code
echo ----
echo ----
set /p DirectoryToCopy="Press enter key to exit....."
popd