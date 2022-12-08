set nocompatible 
set t_Co=256

set incsearch
set showmatch 
set nohlsearch
set ignorecase
set smartcase

set smarttab
set smartindent 
set expandtab 
set nocindent 
set autoindent 
set ts=3 
set sw=3 
set softtabstop=3 

set laststatus=2
set pastetoggle=<F1>

nnoremap <tab> %
vnoremap <tab> %
nnoremap / /\v
vnoremap / /\v


filetype plugin indent on
syntax on
syn sync fromstart
colorscheme ir_black

" syntax checking on save
autocmd BufWritePost *.bash !bash -n <afile>
autocmd BufWritePost *.sh !bash -n <afile>
autocmd BufWritePost *.pl !perl -c <afile>
autocmd BufWritePost *.perl !perl -c <afile>
autocmd BufWritePost *.rb !ruby -c <afile>
" run spec on ruby test file saves automatically
"autocmd BufWritePost *test.rb !spec <afile>

" save file and run all tests in this dir on F12
autocmd FileType ruby map <silent> <F10> :w<CR>:!rspec %:p:h/*test.rb<CR>
autocmd FileType ruby imap <silent> <F10> <Esc><F10>
" ruby should look a little different:
autocmd FileType ruby set nu sw=2 ts=2 softtabstop=2

autocmd FileType helpfile set nonumber
autocmd FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
autocmd FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
