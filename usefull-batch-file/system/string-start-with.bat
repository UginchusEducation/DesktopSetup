@echo off
goto :main

:main
    call create-string content %1
    call create-string start %2

    set /a limit=%start_length% - 1
    set /a %3=1

    for /l %%g in ( 0, 1, %limit% ) do (
        if "!content:~%%g,1!" neq "!start:~%%g,1!" (
            set %3=0
            goto :end
        )
    )
goto :eof