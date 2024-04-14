@echo off
goto :main

:check_character
    if "!content:~%~1,1!" equ "!search:~%~2,1!" (
        if %~2 equ !search_limit! (
            set /a position=%~1 - %~2
            set %~3=!position!

            set found=true
        )
    )
goto :eof

:main
    call create-string content %1
    call create-string search %2
    set found=

    set /a %3=-1

    set start_pos=%4

    if "%start_pos%" equ "" (
        set start_pos=0
    )

    set /a content_limit=!content_length! - 1
    set /a search_limit=!search_length! - 1

    for /l %%g in ( %start_pos%, 1, %content_limit% ) do (
        set character=!content:~%%g,1!

        if "!character!" equ "!search:~0,1!" (
            for /l %%h in ( 0, 1, %search_limit% ) do (
                set /a offset=%%g + %%h

                call :check_character !offset! %%h %3
                if defined found (
                    goto :eof
                )
            )
        )
    )

goto :eof