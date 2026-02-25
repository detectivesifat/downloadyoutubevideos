# downloadyoutubevideos

## Manual Way

Run Command Prompt (not as Administrator) and paste this:

winget install yt-dlp  
winget install ffmpeg  

Then paste this including the video link:

yt-dlp "LINK"

| More options                         | Use this Command |
|-------------------------------------|------------------|
| Best Quality (MP4)                  | `yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" "URL"` |
| Audio Only (MP3)                    | `yt-dlp -x --audio-format mp3 "URL"` |
| Entire Playlist                     | `yt-dlp --yes-playlist "URL"` |
| Specific Resolution (e.g., 720p)    | `yt-dlp -S "res:720" "URL"` |

**The file will be downloaded to C:/user/yourusername/**

## Automated Way

Simply download the file and run it (not as Administrator).

Tips: Keep the file in a separate folder.
