@echo off
cls
:menu
echo.
echo =============================
echo Choose option:
echo [1] Start service
echo [2] Stop service
echo [3] Restart service
echo [4] Close controller
echo =============================
set /p choice=Select option and confirm with enter: 
echo.

if "%choice%"=="1" goto startserv
if "%choice%"=="2" goto stopserv
if "%choice%"=="3" goto restartserv
if "%choice%"=="4" goto ende
echo There is no such choice! & goto menu

:startserv
sc start ctwFiveMServer
if %ERRORLEVEL% == 0 (
    echo The service ctwFiveMServer has been started successfully.
) else (
    echo Error: Failed to start the service ctwFiveMServer.
)
pause
goto ende

:stopserv
sc stop ctwFiveMServer
if %ERRORLEVEL% == 0 (
    echo The service ctwFiveMServer has been stopped successfully.
) else (
    echo Error: Failed to stop the service ctwFiveMServer.
)
pause
goto ende

:restartserv
sc stop ctdwFiveMServer
timeout /t 5 /nobreak >nul
sc start ctwFiveMServer
if %ERRORLEVEL% == 0 (
    echo The service ctwFiveMServer has been restarted successfully.
) else (
    echo Error: Failed to restart the service ctwFiveMServer.
)
pause
goto ende

:ende
exit
