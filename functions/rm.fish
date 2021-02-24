function rm --description 'alias rm=rm -i'
    # safer remove
    command rm -i $argv
end
