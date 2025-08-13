@echo off
@REM chcp 65001 >null
setlocal enabledelayedexpansion

set "logfile=%~dp0deploy_log.txt"

set msg=%1
if "%msg%"=="" set msg=update

call hexo g 
call hexo d 

git add . 
git commit -m "%msg%" 
git push all source