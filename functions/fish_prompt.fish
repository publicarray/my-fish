if command -sq starship
    function fish_prompt
        switch "$fish_key_bindings"
            case fish_hybrid_key_bindings fish_vi_key_bindings fish_helix_key_bindings
                set STARSHIP_KEYMAP "$fish_bind_mode"
            case '*'
                set STARSHIP_KEYMAP insert
        end
        starship prompt --status=$status --pipestatus=$pipestatus --keymap=$STARSHIP_KEYMAP --cmd-duration=(math --scale=0 "$CMD_DURATION") --jobs=(jobs -g 2>/dev/null | count)
    end

    # Disable virtualenv prompt, it breaks starship
    set -g VIRTUAL_ENV_DISABLE_PROMPT 1

    # Remove default mode prompt
    builtin functions -e fish_mode_prompt

    set -gx STARSHIP_SHELL "fish"

    # Set up the session key that will be used to store logs
    # We don't use `random [min] [max]` because it is unavailable in older versions of fish shell
    set -gx STARSHIP_SESSION_KEY (string sub -s1 -l16 (random)(random)(random)(random)(random)0000000000000000)
end
