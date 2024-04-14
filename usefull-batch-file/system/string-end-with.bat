@echo off

call create-string content %1
call create-string start %2

set /a %3=1

for /l %%g in ( 0, 1, %start_length% ) do (
    if "!content:~-%%g,1!" neq "!start:~-%%g,1!" (
        set %3=0
        goto :end
    )
)

:end