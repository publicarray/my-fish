function slt --description 'alias slt=subl'
  if command -sq subl3
    subl3 $argv
  else
    subl $argv
  end
end
