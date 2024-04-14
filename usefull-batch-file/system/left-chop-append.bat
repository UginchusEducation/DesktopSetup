@echo off
goto :main

:: left-chop-append %1"source" %2"target" %3"count" %4"append"

:main
    set %2=
    for %%g in ( %3 ) do (
            set local_string=%1
            set local_aapend=%4
            set %2=!local_aapend!!local_string:~%%g!
        )
goto :eof