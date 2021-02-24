if command -sq narn
    function yarn --wraps=narn --description 'alias yarn=narn'
        narn $argv
    end
end
