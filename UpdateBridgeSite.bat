@echo off
cd /d "%USERPROFILE%\Documents\BridgeHaifaSite"

echo ==============================
echo Updating Bridge Haifa website
echo ==============================

git add .

git diff --cached --quiet
if %errorlevel%==0 (
    echo.
    echo No new changes were found.
    pause
    exit /b
)

git commit -m "Website update %date% %time%"

if errorlevel 1 (
    echo.
    echo Commit failed.
    pause
    exit /b
)

git push

if errorlevel 1 (
    echo.
    echo Push failed.
    pause
    exit /b
)

echo.
echo ==============================
echo SUCCESS - website uploaded
echo ==============================
echo Wait 1-2 minutes for the website to update.
pause
