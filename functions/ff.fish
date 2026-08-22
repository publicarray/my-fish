function ff --description 'fuzzy find files with preview (fzf, falls back to skim)'
    if command -sq fzf
        fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
    else if command -sq sk
        sk --preview 'bat --color=always --style=numbers --line-range=:500 {}'
    end
end
