function fuck -d "Correct your previous console command"
    if command -sq thefuck
        set -l fucked_up_command $history[1]
        env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
        if [ "$unfucked_command" != "" ]
            eval $unfucked_command
            builtin history delete --exact --case-sensitive -- $fucked_up_command
            builtin history merge ^/dev/null
        end
    else
        echo "Please install thefuck first. Check https://github.com/nvbn/thefuck"
    end
end
