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

    set -l filename
    set -l scale -1
    set -l fps 15

    for i in (seq 1 (count $argv))
      echo $argv[$i]
      switch $i;
        case 1;
          set filename $argv[$i]
        case 2;
          set scale $argv[$i]
        case 3;
          set fps $argv[$i]
        case '*'
          echo "Ignored argument: $argv[$i]"
      end
    end

    # set -l i 1
    # for arg in $argv;
    #   echo "$i:$arg"

    #   switch $i;
    #     case 1;
    #       set filename $arg
    #     case 2;
    #       set scale $arg
    #     case 3;
    #       set fps $arg
    #     case '*'
    #       echo "err"
    #   end

    #   set i (math $i+1)
    # end

    echo "$filename:$scale:$fps"
    ffmpeg -y -i "$filename" -vf fps=$fps,scale=$scale:-1:flags=lanczos,palettegen "$filename".png
    # ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
    ffmpeg -i $filename -i $filename.png -filter_complex "fps=$fps,scale=$scale:-1:flags=lanczos[x];[x][1:v]paletteuse" "$filename".gif
    # ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
    rm -f "$filename".png
  else
    echo "require ffmpeg\n install with: brew install ffmpeg/apt install ffmpeg/yum install ffmpeg"
    return 1
  end
end
