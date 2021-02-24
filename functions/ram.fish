# by paulmillr <https://github.com/paulmillr/dotfiles/blob/master/home/.zshrc.sh>
# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
function ram
    set -l sum
    set -l app $argv
    if [ -z $app ]
        echo "First argument - pattern to grep from processes"
    else
        set sum 0
        for i in (ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}')
            set sum (math $i + $sum)
        end
        set sum (echo "scale=2; $sum / 1024.0" | bc)
        if test $sum != "0"
            echo (set_color blue)"$app"(set_color reset)" uses "(set_color green)"$sum"(set_color reset)" MBs of RAM."
        else
            echo "There are no processes called "(set_color blue)"$app"(set_color reset)" running."
        end
    end
end
