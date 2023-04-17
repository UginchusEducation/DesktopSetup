@echo off

call "%~dp0\..\..\my-config.bat"

cd %ProjectRoot%

git pull

PAUSE