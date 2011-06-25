@echo off
cd /d %~dp0
for /f "delims=" %%a in ('git rev-list HEAD -1 --abbrev-commit') do echo #define GPAC_GIT_REVISION "%%a" > test.h
if not exist include\gpac\version.h goto create 
ECHO n|COMP test.h include\gpac\version.h > nul 
if errorlevel 1 goto create
DEL test.h
exit/b
:create
MOVE /Y test.h include\gpac\version.h
