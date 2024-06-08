@echo off
setlocal EnableDelayedExpansion
echo.
goto :main

:main
    setlocal
        echo =========== Enter directory to copy ===========
        :: set /p DirectoryToCopy=">> "
        :: if [%DirectoryToCopy%]==[] goto:begin
        call create-string global_dir "C:\Utils\MergeTool\"
        call create-string target_dir "C:\Utils\MergeTool\"
        call create-string current_proj_name "Witch"
        call create-string target_proj_name "Xena"
        echo !global_dir!
        cd !global_dir!
        echo ===============================================
        echo.
        call :copy-files
    endlocal
goto :eof

:: Files in Directory
:copy-files
    setlocal
        echo ====== Files in directory with name !current_proj_name! ======
        set loop_dir=!current_proj_name!*
        for /r %%g in ( !loop_dir! ) do ( 
            call left-chop-append %%g local_dir !global_dir_length!
            call string-find "!local_dir!" "!current_proj_name!" position
            for %%g in (!position!) do (
                set file_name=!local_dir:~%%g!
                set local_file_dir=!local_dir:~0,%%g!
                )
            echo !file_name!
            set full_dir=!global_dir!!local_file_dir!
            cd !full_dir!
            call left-chop-append !file_name! new_file_name !current_proj_name_length! !target_proj_name!
            type !file_name! > !new_file_name!
            echo !new_file_name!
            set copy_dir=!target_dir!!local_file_dir!
            echo !copy_dir!
            del !file_name!
            )
        cd C:\Utils\DesktopSetup\usefull-batch-file\
        echo ===============================================
    endlocal
goto :eof