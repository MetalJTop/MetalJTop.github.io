@echo off
set msg=%1
if "%msg%"=="" set msg=update

git add .
git commit -m "%msg%"
git push all source
