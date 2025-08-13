@echo off
setlocal enabledelayedexpansion
set msg=%1
if "%msg%"=="" set msg=update

REM 出错就退出
call :run hexo g
call :run hexo d
call :run git add .
call :run git commit -m "%msg%"
call :run git push all source
exit /b

:run
%*
if errorlevel 1 (
    echo 命令执行失败: %*
    exit /b %errorlevel%
)
exit /b
