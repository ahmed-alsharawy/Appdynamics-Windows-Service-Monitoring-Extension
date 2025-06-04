@echo off
SETLOCAL

:: Set script directory
set SCRIPT_DIR=%~dp0

:: Check for initialization mode
if "%1" == "--init" (
    powershell -ExecutionPolicy Bypass -NoProfile -NonInteractive -File "%SCRIPT_DIR%servicemonitorp-shell.ps1" -init
    exit /b %ERRORLEVEL%
)

:: Normal execution mode with full path
powershell -ExecutionPolicy Bypass -NoProfile -NonInteractive -Command "& '%SCRIPT_DIR%servicemonitorp-shell.ps1'"

:: Error handling
if %ERRORLEVEL% neq 0 (
    echo Error occurred while executing PowerShell script
    exit /b %ERRORLEVEL%
)

ENDLOCAL