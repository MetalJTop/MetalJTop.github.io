@echo off
@REM chcp 65001 >null
setlocal enabledelayedexpansion

set "logfile=%~dp0deploy_log.txt"

set msg=%1
if "%msg%"=="" set msg=update

call hexo g >> "%logfile%" 2>&1
call hexo d >> "%logfile%" 2>&1

git add . >> "%logfile%" 2>&1
git commit -m "%msg%" >> "%logfile%" 2>&1
git push all source >> "%logfile%" 2>&1