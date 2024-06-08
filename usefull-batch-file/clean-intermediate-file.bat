@echo off

call "%~dp0\my-config.bat"

echo =========== Start delete intermediate files ===========
pushd "%ProjectRoot%"
FOR %%f in (%dirsToRemove%) do (
    echo %%f
    rmdir /s /q %%f
)

FOR %%f in (%filesToRemove%) do (
    echo %%f
    del /q %%f
)

echo =========== Finish deleting intermediate files ===========
echo ----
echo ----
set /p DirectoryToCopy="Press enter key to exit....."
popd