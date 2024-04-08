@echo off
setlocal EnableDelayedExpansion
echo.
set DirectoryToCopy=c:\Users\n_uginchus\Documents\UnrealProjects\Xena\Source\Aura\

goto :main

:main
    setlocal
        echo =========== Enter directory to copy ===========
        :: set /p DirectoryToCopy=">> "
        :: c:\Users\n_uginchus\Documents\UnrealProjects\Xena\Source\Aura\
        :: if [%DirectoryToCopy%]==[] goto:begin
        echo !DirectoryToCopy!
        cd !DirectoryToCopy!
        echo ===============================================
        echo.

        call :files_in_directory
        ::call :file_content

    endlocal
goto :eof

:: Files in Directory
:files_in_directory
    setlocal
        echo ====== Files in directory with name Aura ======
        for /r %%g in ( Aura* ) do ( 
            call create-string var %%g
            echo !var!
            )

        :: echo !var:~4!
        :: To get all dir info into text
        :: dir /b > all_files_in_dir.txt 2>&1
        echo ===============================================
    endlocal
goto :eof

:: File Content
:file_content
    setlocal
        echo ============== File Content ===================
        ::for /f "delims=/ skip=1" %%g in ( Aura.Build.cs ) do ( echo %%g )
        type Aura.Build.cs
        echo ===============================================
    endlocal
goto :eof