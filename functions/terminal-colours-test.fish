function terminal-colours-test -d "print a terminal colour test pattern"

    # Everything below uses ANSI indices, not hex, so it shows the palette the
    # terminal is actually using rather than the one terminal-colours writes.

    set -l names black red green yellow blue magenta cyan white

    printf '\n\e[1m1. PALETTE  (indices 0-15, live from your terminal)\e[0m\n\n'
    printf '   %-10s %-24s %-24s\n' '' 'normal 30-37' 'bright 90-97'
    for i in (seq 0 7)
        printf '   %-10s \e[%dm%s\e[0m  \e[%dm%-14s\e[0m   \e[%dm%s\e[0m  \e[%dm%s\e[0m\n' \
            $names[(math $i + 1)] \
            (math 40 + $i) '      ' (math 30 + $i) 'Sphinx of black' \
            (math 100 + $i) '      ' (math 90 + $i) 'Sphinx of black'
    end

    printf '\n\e[1m2. FOREGROUND ON BACKGROUND MATRIX\e[0m\n\n     '
    for i in (seq 0 7)
        printf ' %-4s' (string sub -l 4 $names[(math $i + 1)])
    end
    echo
    for f in (seq 0 7)
        printf '  %-3s' (string sub -l 3 $names[(math $f + 1)])
        for b in (seq 0 7)
            printf ' \e[%d;%dm Ag \e[0m' (math 30 + $f) (math 40 + $b)
        end
        printf '   '
        for b in (seq 0 7)
            printf '\e[%d;%dm Ag \e[0m' (math 90 + $f) (math 100 + $b)
        end
        echo
    end

    printf '\n\e[1m3. ATTRIBUTES\e[0m\n\n'
    for a in 0:normal 1:bold 2:dim 3:italic 4:underline 7:reverse 9:strikethrough 21:'double underline' 53:overline
        set -l p (string split ':' $a)
        printf '   \e[%sm%-22s\e[0m  \e[%sm%s\e[0m  \e[%s;34mblue\e[0m \e[%s;94mbrblue\e[0m \e[%s;31mred\e[0m \e[%s;32mgreen\e[0m\n' \
            $p[1] $p[2] $p[1] 'The quick brown fox jumps' $p[1] $p[1] $p[1] $p[1]
    end

    printf '\n\e[1m4. GREYSCALE RAMP  (232-255)\e[0m\n\n   '
    for i in (seq 232 255)
        printf '\e[48;5;%dm  \e[0m' $i
    end
    printf '\n   '
    for i in (seq 232 255)
        printf '\e[38;5;%dm#\e[0m ' $i
    end

    printf '\n\n\e[1m5. 256 COLOUR CUBE\e[0m\n\n'
    for row in (seq 0 5)
        printf '   '
        for block in (seq 0 5)
            for col in (seq 0 5)
                printf '\e[48;5;%dm  \e[0m' (math "16 + $block * 36 + $row * 6 + $col")
            end
            printf ' '
        end
        echo
    end

    # a smooth sweep means 24-bit colour works, banding means a 256 colour fallback
    printf '\n\e[1m6. TRUECOLOR GRADIENT  (should be smooth)\e[0m\n\n   '
    for i in (seq 0 71)
        set -l h (math "$i * 5")
        printf '\e[48;2;%d;%d;%dm \e[0m' \
            (math "round(127 + 127 * cos($h * 3.14159 / 180))") \
            (math "round(127 + 127 * cos(($h - 120) * 3.14159 / 180))") \
            (math "round(127 + 127 * cos(($h + 120) * 3.14159 / 180))")
    end

    printf '\n\n\e[1m7. REAL OUTPUT SAMPLES\e[0m\n\n'
    printf '   \e[94m~/git/my-fish\e[0m \e[92m(master)\e[0m \e[91m✗\e[0m fish shell prompt\n'
    printf '   \e[32mfunction\e[0m \e[97mterminal-colours\e[0m \e[90m-d\e[0m \e[33m"apply my palette"\e[0m\n'
    printf '   \e[90m# comment, autosuggestion and dim metadata\e[0m\n'
    printf '   \e[1;31merror:\e[0m cannot open \e[33m\'config.toml\'\e[0m: No such file or directory\n'
    printf '   \e[33mwarning:\e[0m 3 files changed, \e[32m+142\e[0m \e[31m-87\e[0m\n\n'
    printf '   \e[1mgit diff\e[0m\n'
    printf '   \e[36m@@ -1,4 +1,4 @@\e[0m\n'
    printf '   \e[31m-set -l palette \'#1c51c2\'\e[0m\n'
    printf '   \e[32m+set -l palette \'#2356c4\'\e[0m\n\n'
    printf '   \e[1mls -l\e[0m\n'
    printf '   \e[94mdrwxr-xr-x\e[0m \e[90mseb  4.0K Aug  5\e[0m \e[1;94mfunctions/\e[0m\n'
    printf '   \e[90m-rw-r--r--  seb  2.9K Aug  5\e[0m \e[92mpublicarray.theme\e[0m\n'
    printf '   \e[90m-rwxr-xr-x  seb  1.2K Aug  5\e[0m \e[1;92mrun.fish\e[0m\n'
    printf '   \e[90mlrwxrwxrwx  seb    12 Aug  5\e[0m \e[96mlink\e[0m \e[90m->\e[0m \e[96mtarget\e[0m\n'
    printf '   \e[90m-rw-r--r--  seb  842K Aug  5\e[0m \e[91marchive.tar.gz\e[0m\n\n'
end
