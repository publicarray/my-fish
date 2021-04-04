if command -sq starship
    function fish_prompt
        switch "$fish_key_bindings"
            case fish_hybrid_key_bindings fish_vi_key_bindings
                set keymap "$fish_bind_mode"
            case '*'
                set keymap insert
        end
        starship prompt --status=$status --keymap=$keymap --cmd-duration=(math --scale=0 "$CMD_DURATION") --jobs=(count (jobs -p))
    end

    # disable virtualenv prompt, it breaks starship
    set VIRTUAL_ENV_DISABLE_PROMPT 1

    function fish_mode_prompt; end
    export STARSHIP_SHELL="fish"

    # Set up the session key that will be used to store logs
    # export STARSHIP_SESSION_KEY=("/usr/local/bin/starship" session)
end
