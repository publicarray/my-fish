# publicarray theme, baked from themes/publicarray.theme
# Regenerate if the .theme file changes.
if not set -q __publicarray_uvars_cleared
    for v in (set -Un | string match -er '^fish_(?:pager_)?color_')
        set -eU $v
    end
    set -U __publicarray_uvars_cleared 1
end

if status is-interactive
    function __publicarray_theme --on-variable fish_terminal_color_theme
        set -l m --theme=publicarray

        # shared between light and dark
        set -g fish_color_cancel -r $m
        set -g fish_color_command green $m
        set -g fish_color_cwd blue $m
        set -g fish_color_cwd_root red $m
        set -g fish_color_end normal $m
        set -g fish_color_error red --bold $m
        set -g fish_color_escape cyan $m
        set -g fish_color_history_current --bold $m
        set -g fish_color_host normal $m
        set -g fish_color_normal normal $m
        set -g fish_color_operator normal $m
        set -g fish_color_param normal $m
        set -g fish_color_redirection normal $m
        set -g fish_color_status red $m
        set -g fish_color_valid_path --underline $m
        set -g fish_pager_color_completion normal $m
        set -g fish_pager_color_prefix red $m
        set -g fish_pager_color_progress cyan $m
        set -g fish_pager_color_secondary cyan $m
        set -g fish_pager_color_selected_background -r $m

        if test "$fish_terminal_color_theme" = light
            set -g fish_color_autosuggestion brblack $m
            set -g fish_color_comment brblack $m
            set -g fish_color_host_remote magenta $m
            set -g fish_color_match magenta --background=white $m
            set -g fish_color_quote green $m
            set -g fish_color_search_match --background=bryellow $m
            set -g fish_color_selection black --bold --background=white $m
            set -g fish_color_user green $m
            set -g fish_pager_color_description brblack $m
        else
            set -g fish_color_autosuggestion 555 $m
            set -g fish_color_comment 555 $m
            set -g fish_color_host_remote yellow $m
            set -g fish_color_match purple --background=303030 $m
            set -g fish_color_quote yellow $m
            set -g fish_color_search_match --background=0A0682 $m
            set -g fish_color_selection white --bold --background=brblack $m
            set -g fish_color_user brgreen $m
            set -g fish_pager_color_description 777 yellow $m
        end
    end
    __publicarray_theme
end
