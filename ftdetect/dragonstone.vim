" Dragonstone filetype detection
au BufRead,BufNewFile *.ds,*.dragonstone setfiletype dragonstone
au BufRead,BufNewFile *.eds setfiletype dragonstone-embedded
au BufRead,BufNewFile *.forge setfiletype dragonstone-forge

" Detect dragonstone from shebang
au BufRead,BufNewFile * if getline(1) =~ '^#!.*\bdragonstone' | setfiletype dragonstone | endif
