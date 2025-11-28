au BufRead,BufNewFile *.ds,*.eds,*.dragonstone setfiletype dragonstone
au BufRead,BufNewFile * if getline(1) =~ '^#!.*\bdragonstone' | setfiletype dragonstone | endif
