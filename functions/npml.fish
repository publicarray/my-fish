if command -sq npm
    function npml
        npm list -g --depth=0
    end
end
