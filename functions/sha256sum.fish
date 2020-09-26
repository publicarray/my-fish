# Defined in - @ line 1
function sha256sum --description 'alias sha256sum shasum --algorithm 256'
	shasum --algorithm 256 $argv;
end
