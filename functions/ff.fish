function ff --description 'alias ff=fzf with file preview'
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
end
