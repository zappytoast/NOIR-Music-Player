@echo off
setlocal
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Install Node.js and npm first: https://nodejs.org/
  pause
  exit /b 1
)
if not exist node_modules\electron\dist\electron.exe (
  call npm install
  if errorlevel 1 goto failed
)
call npm run dist
if errorlevel 1 goto failed
echo.
echo Installer output is in the release folder.
pause
exit /b 0
:failed
echo The installer build failed. Review the error output above.
pause
exit /b 1
