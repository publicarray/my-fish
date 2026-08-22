
if not command -sq http; and command -sq xh
    function http --wraps=xh --description 'alias http=xh'
        xh  $argv;
    end
end
