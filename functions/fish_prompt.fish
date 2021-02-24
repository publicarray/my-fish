if command -sq starship
    function fish_prompt
        switch "$fish_key_bindings"
            case fish_hybrid_key_bindings fish_vi_key_bindings
                set keymap "$fish_bind_mode"
            case '*'
                set keymap insert
        end
        starship prompt --status=$status --keymap=$keymap --cmd-duration=(math --scale=0 "$CMD_DURATION / 1000") --jobs=(count (jobs -p))
    end
    export STARSHIP_SHELL="fish"
end
