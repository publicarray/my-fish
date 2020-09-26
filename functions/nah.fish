# Defined in - @ line 1
function nah --wraps='git reset --hard;git clean -df' --wraps='git reset --hard && git clean -df' --description 'alias nah git reset --hard && git clean -df'
  git reset --hard && git clean -df $argv;
end
