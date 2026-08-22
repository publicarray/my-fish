function _set-theme_install --on-event my-fish_install
    fish_config theme choose publicarray
end

function _set-theme_update --on-event my-fish_update
    fish_config theme choose publicarray
end
