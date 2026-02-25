# downloadyoutubevideos


winget install yt-dlp
winget install ffmpeg

yt-dlp "LINK"

| More options                          | Use this Command                                                |
|-------------------------------------- |------------------------------------------------------------------|
| Best Quality (MP4)                    | `yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" "URL"`          |
| Audio Only (MP3)                      | `yt-dlp -x --audio-format mp3 "URL"`                             |
| Entire Playlist                       | `yt-dlp --yes-playlist "URL"`                                    |
| Specific Resolution (e.g., 720p)      | `yt-dlp -S "res:720" "URL"`                                       |
