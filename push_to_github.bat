@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1
title CRYPTO ML - Push to GitHub

echo.
echo ================================================================
echo   CRYPTO ML - 1-Click Push to Your New GitHub Account
echo   Target: https://github.com/yashvatsmrt-1306/CRYPTO-ML-
echo ================================================================
echo.
echo   Connecting using your browser session...
echo.
echo   1. An 8-character code will appear below and your browser will open.
echo   2. Simply enter the code and click "Authorize" in your browser.
echo.

gh auth login --hostname github.com --git-protocol https --web

if %errorlevel% neq 0 (
    echo.
    echo   Authentication was not completed.
    pause & exit /b 1
)

echo.
echo   Configuring Git to use your authenticated account...
gh auth setup-git

echo.
echo   Pushing project to https://github.com/yashvatsmrt-1306/CRYPTO-ML-...
git push -u origin main --force

if %errorlevel% equ 0 (
    echo.
    echo ================================================================
    echo   SUCCESS! The entire project is now live on your new GitHub!
    echo   View it here: https://github.com/yashvatsmrt-1306/CRYPTO-ML-
    echo ================================================================
) else (
    echo.
    echo   Push encountered an error. Check the message above.
)
echo.
pause
