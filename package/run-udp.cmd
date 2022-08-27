@echo off
:start
TITLE Client V41 - UDP server
echo %DATE% %TIME% Auth server is running! >> udp_is_running.tmp
echo Starting Point Blank Auth Server.
echo.
java.exe -Dfile.encoding=UTF-8 -Xms32m -Xmx32m -cp jar/*; battle.Program
if ERRORLEVEL 2 goto restart
if ERRORLEVEL 1 goto error
goto end
:restart
echo.
echo %DATE% %TIME% Auth Server is restarted >> udp_is_running.tmp
echo.
goto start
:error
echo.
echo %DATE% %TIME% Auth Server terminated abnormaly>> udp_is_running.tmp
echo.
:end
echo.
echo %DATE% %TIME% Auth Server terminated >> udp_is_running.tmp
echo.
pause
