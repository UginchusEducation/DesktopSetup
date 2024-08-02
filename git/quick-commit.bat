@echo off
git pull
git add -A
git qc "Charge commit"
git push origin HEAD:main
git status

PAUSE