@echo off
title PC Performance Cleanup
color 0A

echo ==========================================
echo   PC Performance Cleanup and Optimization
echo ==========================================
echo.

:: Require admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this script as Administrator.
    pause
    exit /b
)

echo Cleaning temporary files...
del /q /f /s "%temp%\*" 2>nul
del /q /f /s "C:\Windows\Temp\*" 2>nul

echo Clearing DNS cache...
ipconfig /flushdns

echo Resetting network cache...
netsh winsock reset >nul

echo Trimming system drive...
defrag C: /O /U /V

echo Running system file check...
sfc /scannow

echo Checking image health...
DISM /Online /Cleanup-Image /RestoreHealth

echo Done. A restart is recommended.
pause