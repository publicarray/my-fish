function fuck -d "Correct your previous console command"
    if command -sq pay-respects
        # https://github.com/iffse/pay-respects - rust rewrite of thefuck
        pay-respects fish | source
        pay-respects $argv
    else if command -sq thefuck
        set -l fucked_up_command $history[1]
        env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
        if [ "$unfucked_command" != "" ]
            eval $unfucked_command
            builtin history delete --exact --case-sensitive -- $fucked_up_command
            builtin history merge ^/dev/null
        end
    else
        echo "Please install pay-respects (https://github.com/iffse/pay-respects) first."
    end
end
