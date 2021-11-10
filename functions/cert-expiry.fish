function cert-expiry --description 'Show certificate expiry information. usage: cert-expiry example.com:443'
    set reset "\e[0m"
    set bold "\e[1m"
    set red "\e[31m"
    set green "\e[32m"
    set yellow "\e[33m"

    if test (count $argv) -eq 0; or test -z $argv[1]; or ! echo $argv | grep -Eq '^.*:[0-9]{1,5}$'
        printf "Show certificate expiry information.\n\t usage: cert-expiry example.com:443\n"
        return 1
    end

    # set cert_text (openssl s_client -connect $argv 2>/dev/null </dev/null | openssl x509 -text -noout)
    set cert_end_date (openssl s_client -connect $argv 2>/dev/null </dev/null | openssl x509  -enddate -noout | cut -d'=' -f2)

    set cert_end_time (date -d $cert_end_date "+%s")
    set current_time (date "+%s")
    set remaining (math "(($cert_end_time - $current_time) / 60 / 60 / 24)")

    echo Certificate expiry date: (date -d "$cert_end_date")
    printf "Certificate expires in $bold%.0f$reset days\n" $remaining
    if [ $remaining -gt 30 ]
        printf "$green%s %s %s$reset\n" "Certificate" $argv[1] "is valid for over 1 month 👍"
    else if [ $remaining -le 10 ] && [ $remaining -gt 5 ]
        printf "$yellow%s %s %s$reset\n" "⚠ Certificate" $argv[1] "is expiring soon!"
        return 2
    else if [ $remaining -le 5 ] && [ $remaining -gt 0 ]
        printf "$red$bold%s %s %s$reset\n" "⚠ Certificate" $argv[1] "is expiring very soon!!! 🔥"
        return 1
    else if [ $remaining -le 0 ]
        printf "$red$bold%s %s %s$reset\n" "🛑 Certificate" $argv[1] "has expired!!! 🛑"
        return 1
    else
        printf "$bold%s %s %s$reset\n" "Certificate" $argv[1] "is valid for less than 1 month 🙊"
        return 3
    end
end
