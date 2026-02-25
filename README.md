# downloadyoutubevideos

***Manual Way*** <br> <br>
Run cmd as Admin and paste this: <br>
winget install yt-dlp <br>
winget install ffmpeg <br>

Then paste this including the video link: <br>

yt-dlp "LINK" <br>

| More options                          | Use this Command                                                |
|-------------------------------------- |------------------------------------------------------------------|
| Best Quality (MP4)                    | `yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" "URL"`          |
| Audio Only (MP3)                      | `yt-dlp -x --audio-format mp3 "URL"`                             |
| Entire Playlist                       | `yt-dlp --yes-playlist "URL"`                                    |
| Specific Resolution (e.g., 720p)      | `yt-dlp -S "res:720" "URL"`                                       |
<br><br><br>

***Automated Way*** <br><br>

Simply Download the file and run it as Admin
