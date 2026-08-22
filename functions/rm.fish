function rm --description 'safer rm: prompt once for bulk/recursive deletes, not per-file'
    if test (uname) = Darwin
        # BSD rm has no -I
        command rm -i $argv
    else
        command rm -I $argv
    end
end
