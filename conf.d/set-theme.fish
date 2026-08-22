function _set-theme_install --on-event my-fish_install
    for v in (set -Un | string match -er '^fish_(?:pager_)?color_')
        set -eU $v
    end
    echo y | fish_config theme save publicarray --color-theme=dark
end

function _set-theme_update --on-event my-fish_update
    for v in (set -Un | string match -er '^fish_(?:pager_)?color_')
        set -eU $v
    end
    echo y | fish_config theme save publicarray --color-theme=dark
end
