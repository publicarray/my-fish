if command -sq sk
    function sk --description 'Fuzzy Finder in rust! - cargo install skim'
        set SKIM_DEFAULT_COMMAND "fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."
        command sk --reverse --margin 1 --border=rounded $argv
    end
end
