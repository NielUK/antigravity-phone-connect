@echo off
setlocal enabledelayedexpansion
title Phone Connect (Home) - Same Wi-Fi Connection
cd /d "%~dp0.."

echo.
echo  ====================================================
echo   Phone Connect - Control Antigravity From Your Phone
echo  ====================================================
echo.

if not exist ".env" (
    if exist ".env.example" (
        echo [INFO] Creating .env from template...
        copy .env.example .env >nul
    )
)

echo [1/3] Checking Antigravity...
powershell -Command "try { $r = Invoke-WebRequest -Uri 'http://localhost:9000/json' -UseBasicParsing -TimeoutSec 2; Write-Host '[OK] Antigravity detected on port 9000.' } catch { Write-Host '[WARNING] Antigravity not on port 9000. Run Launch Antigravity.bat first. Continuing...' }"
echo.

echo [2/3] Checking Node.js...
node --version >nul 2>&1
if errorlevel 1 ( echo [ERROR] Node.js not found! & pause & exit /b 1 )
echo [OK] Node.js found.
echo.

echo [3/3] Checking dependencies...
if not exist "node_modules" ( echo [INFO] Installing... & npm install )
echo [OK] Ready.
echo.

echo  ====================================================
echo   Starting server... QR code will appear below!
echo  ====================================================
echo.

python launcher.py --mode local

echo.
echo [INFO] Server stopped. Press any key to exit.
pause >nul
