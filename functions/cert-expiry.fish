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

    echo Certificate exirary date: (date -d "$cert_end_date")
    printf "Certificate expires in $bold%.0f$reset days\n" $remaining
    if [ $remaining -gt 30 ]
        printf "$green%s$reset\n" "Certificate is valid for over 1 month 👍"
    else if [ $remaining -lt 10 ]
        printf "$yellow%s$reset\n" "⚠ Certificate is expiring soon!"
        return 2
    else if [ $remaining -lt 5 ]
        set print_str "$red%s$reset"
        printf "$red$bold%s$reset\n" "⚠ Certificate is expiring very soon!!! 🔥"
        return 1
    end
end
