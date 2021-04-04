
if ! command -sq http and command -sq hx
    function http --wraps=xh --description 'alias http=xh'
        xh  $argv;
    end
end
