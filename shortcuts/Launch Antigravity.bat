@echo off
title Launch Antigravity
echo ===================================================
echo   Launching Antigravity with Phone Connect support
echo ===================================================
echo.
start "" "D:\Antigravity\Antigravity.exe" --remote-debugging-port=9000
echo [OK] Antigravity launched with debug port 9000.
echo      You may close this window.
timeout /t 3 /nobreak >nul
