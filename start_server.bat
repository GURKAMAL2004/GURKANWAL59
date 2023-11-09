
@echo off
REM Start a local server
start /b python -m http.server

REM Wait for a few seconds to give the server time to start
timeout /t 2

REM Open the default web browser
start http://localhost:8000

REM Simple check to see if the server is still running, pause if not
tasklist /fi "IMAGENAME eq python.exe" |find /i "python.exe"
if errorlevel 1 (
    echo Server stopped running. Starting again...
    start /b python -m http.server
) else (
    echo Server is running.
)
pause
