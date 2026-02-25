@echo off
title yt-dlp Auto-Updater and Downloader
color 0b

echo ===================================================
echo       Checking and Updating Dependencies...
echo ===================================================
echo.

:: 1. Check for and Update yt-dlp
if not exist "yt-dlp.exe" (
    echo [1/2] yt-dlp.exe missing. Downloading the latest version...
    curl -L -o yt-dlp.exe https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe
) else (
    echo [1/2] yt-dlp found. Checking for updates...
    yt-dlp.exe -U
)

:: 2. Check for ffmpeg and auto-download if missing
if not exist "ffmpeg.exe" (
    echo.
    echo [2/2] ffmpeg missing. Downloading and extracting official build...
    echo       ^(This is a ~100MB download and may take a minute or two...^)
    powershell -Command "$ErrorActionPreference = 'SilentlyContinue'; Write-Host 'Downloading zip...'; Invoke-WebRequest -Uri 'https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip' -OutFile 'ffmpeg.zip'; Write-Host 'Extracting...'; Expand-Archive -Path 'ffmpeg.zip' -DestinationPath 'ffmpeg_temp' -Force; Write-Host 'Moving files...'; Move-Item -Path 'ffmpeg_temp\*\bin\ffmpeg.exe' -Destination '.\' -Force; Move-Item -Path 'ffmpeg_temp\*\bin\ffprobe.exe' -Destination '.\' -Force; Write-Host 'Cleaning up...'; Remove-Item 'ffmpeg.zip'; Remove-Item 'ffmpeg_temp' -Recurse -Force"
    echo ffmpeg setup complete!
) else (
    echo [2/2] ffmpeg found. Ready to go.
)

echo.
echo ===================================================
echo                 Setup Complete!
echo ===================================================
timeout /t 2 >nul

:start
cls
echo ===================================================
echo             yt-dlp Downloader Script
echo ===================================================
echo.
set /p url="Paste the video link here: "

echo.
echo ===================================================
echo Select your download type:
echo [1] Both (Video + Audio) - Best Quality (MP4)
echo [2] Both (Video + Audio) - Custom Resolution (MP4)
echo [3] Audio Only - Best Quality (MP3)
echo [4] Video Only - No Audio (MP4)
echo ===================================================
echo.
set /p type="Enter your choice (1-4): "

if "%type%"=="1" goto both_best
if "%type%"=="2" goto both_res
if "%type%"=="3" goto audio_only
if "%type%"=="4" goto video_only

echo Invalid choice. Please try again.
timeout /t 2 >nul
goto start

:both_best
echo.
echo Downloading Best Quality Video + Audio...
yt-dlp.exe -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --merge-output-format mp4 "%url%"
goto end

:both_res
echo.
set /p res="Enter max resolution (e.g., 1080, 720, 480): "
echo Downloading Video + Audio up to %res%p...
yt-dlp.exe -f "bestvideo[height<=%res%][ext=mp4]+bestaudio[ext=m4a]/best[height<=%res%][ext=mp4]/best" --merge-output-format mp4 "%url%"
goto end

:audio_only
echo.
echo Downloading Audio Only (MP3)...
yt-dlp.exe -x --audio-format mp3 "%url%"
goto end

:video_only
echo.
echo Downloading Video Only (No Audio)...
yt-dlp.exe -f "bestvideo[ext=mp4]/bestvideo" "%url%"
goto end

:end
echo.
echo ===================================================
echo Download Complete! The file is in this folder.
echo ===================================================
echo.
set /p again="Do you want to download another video? (Y/N): "
if /i "%again%"=="Y" goto start

exit