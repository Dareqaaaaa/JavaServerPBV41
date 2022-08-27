@echo off
:start
TITLE Client V41 - Game server
echo %DATE% %TIME% Auth server is running! >> game_is_running.tmp
echo Starting Point Blank Auth Server.
echo.
java.exe -Dfile.encoding=UTF-8 -Xms32m -Xmx32m -cp jar/*; game.Program
if ERRORLEVEL 2 goto restart
if ERRORLEVEL 1 goto error
goto end
:restart
echo.
echo %DATE% %TIME% Auth Server is restarted >> game_is_running.tmp
echo.
goto start
:error
echo.
echo %DATE% %TIME% Auth Server terminated abnormaly>> game_is_running.tmp
echo.
:end
echo.
echo %DATE% %TIME% Auth Server terminated >> game_is_running.tmp
echo.
pause
