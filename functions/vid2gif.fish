# Convert video to gif file.
# Usage: vid2gif video_file (scale) (fps)
# Converted to fish from bash:
#    https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality
function vid2gif -d "Convert video to gif file with ffmpeg"
    if command -sq ffmpeg
        if test -z "$argv"
            echo "Usage: vid2gif <video file> (scale) (fps)"
            return 1
        end

        set -l filename argv[1]
        set -l scale -1
        set -l fps 15

        if set -q argv[2]
            set scale $argv[2]
        end

        if set -q argv[3]
            set fps $argv[3]
        end

        ffmpeg -y -i "$filename" -vf fps=$fps,scale=$scale:-1:flags=lanczos,palettegen "$filename".png
        ffmpeg -i $filename -i $filename.png -filter_complex "fps=$fps,scale=$scale:-1:flags=lanczos[x];[x][1:v]paletteuse" "$filename".gif
        rm -f "$filename".png
    else
        printf "This script requires ffmpeg\nInstall ffmpeg with your package manager:\n    macOS: brew install ffmpeg\n    Linux: https://www.ffmpeg.org/download.html#build-linux\n    Windows: http://ffmpeg.zeranoe.com/builds/"
        return 1
    end
end
