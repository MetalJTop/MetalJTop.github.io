@echo off
@REM chcp 65001 >null
setlocal enabledelayedexpansion

set "logfile=%~dp0deploy_log.txt"

set msg=%1
if "%msg%"=="" set msg=update

echo "123"
call hexo g >> "%logfile%" 2>&1
echo hexo g done
pause
echo "456"
call hexo d >> "%logfile%" 2>&1

echo "789"
git add . >> "%logfile%" 2>&1
echo "110"
git commit -m "%msg%" >> "%logfile%" 2>&1
echo "111"
git push all source >> "%logfile%" 2>&1
echo "112"