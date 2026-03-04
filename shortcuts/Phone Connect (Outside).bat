@echo off
setlocal enabledelayedexpansion
title Phone Connect (Outside) - Remote Access via Internet
cd /d "%~dp0.."

echo ===================================================
echo   Phone Connect (Outside) - Access From Anywhere
echo ===================================================
echo.

:: Cleanup stuck processes from previous runs
echo [0/2] Cleaning up...
taskkill /f /im ngrok.exe >nul 2>&1
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :3000 ^| findstr LISTENING') do taskkill /f /pid %%a >nul 2>&1

:: Check dependencies
if not exist "node_modules" (
    echo [INFO] Installing dependencies...
    call npm install
)

where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js missing.
    pause
    exit /b
)

where python >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Python missing.
    pause
    exit /b
)

:: Check .env
if not exist ".env" (
    if exist ".env.example" (
        echo [INFO] Creating .env from template...
        copy .env.example .env >nul
        echo [ACTION] Open .env and add your NGROK_AUTHTOKEN, then re-run this.
        pause
        exit /b
    )
    echo [ERROR] No .env file found.
    pause
    exit /b
)

echo [1/1] Launching Phone Connect (Outside)...
python launcher.py --mode web
exit
