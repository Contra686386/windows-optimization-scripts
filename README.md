# windows-optimization-scripts
Here’s a safe Windows batch script you can save as optimize_pc.bat and run as Administrator to clean temp files, clear DNS, trim the disk, and launch common maintenance checks that can help a slow PC feel more responsive.


Here’s a safe Windows batch script you can save as `optimize_pc.bat` and run as **Administrator** to clean temp files, clear DNS, trim the disk, and launch common maintenance checks that can help a slow PC feel more responsive. [geeksforgeeks](https://www.geeksforgeeks.org/techtips/how-to-improve-performance-of-pc-laptop/)

```bat
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
```

## How to use
1. Open Notepad.
2. Paste the script.
3. Save it as `optimize_pc.bat` with **All Files** selected.
4. Right-click it and choose **Run as administrator**.

## What it does
- Deletes temporary files to free space. [geeksforgeeks](https://www.geeksforgeeks.org/techtips/how-to-improve-performance-of-pc-laptop/)
- Flushes DNS and resets Winsock to help fix some network slowdowns. [geeksforgeeks](https://www.geeksforgeeks.org/techtips/how-to-improve-performance-of-pc-laptop/)
- Optimizes the system drive with Windows built-in tools. [github](https://github.com/Xcef-1/Windows-Performance-Optimizer-Script)
- Runs `sfc` and `DISM` to repair corrupted system files, which can improve stability. [youtube](https://www.youtube.com/watch?v=RmASU55-1RA)

## Important note
This script is generally safe, but `sfc` and `DISM` can take a while, and `netsh winsock reset` usually requires a restart to fully apply. [geeksforgeeks](https://www.geeksforgeeks.org/techtips/how-to-improve-performance-of-pc-laptop/)
