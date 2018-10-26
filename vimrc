execute pathogen#infect()
"set tags=~/.vim/dsvm.tags,~/.vim/aotc.tags
set nocompatible
set softtabstop=4
set ts=4
set shiftwidth=4
set autoindent
"set nu
set splitright
set history=500
""""""
set hlsearch
"filetype on

" For GoLang Env
"set nocompatible
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'gmarik/Vundle.vim'
"call vundle#end()
filetype plugin indent on
"map <F2> :GoDef<CR>

"Plugin 'fatih/vim-go'

"au BufNewFile,BufRead,BufEnter *.java set tags=~/.vim/aotc.tags
"au BufNewFile,BufRead,BufEnter *.java set tags=~/.vim/jikes.tags
"au BufNewFile,BufRead,BufEnter *.java set tags=~/.vim/dsvm.tags
"au BufNewFile,BufRead,BufEnter *.c set tags=~/.vim/dsvm.tags
"au BufNewFile,BufRead,BufEnter *.cpp set tags=~/.vim/dsvm.tags
"au BufNewFile,BufRead,BufEnter *.cpp set tags=~/.vim/tags
"au BufNewFile,BufRead,BufEnter *.c set tags=~/.vim/tags

" Such as makefile, do not replace a tab by a space!
set expandtab
au BufNewFile,BufRead [mM]akefile,[mM]akefile*,GNUmakefile,*.mk,*.mak,*.dsp
\ set noexpandtab

au BufNewFile,BufRead *.qml         setf javascript

" Do not distinguish between uppercase and lowercase.
set ignorecase

" Setting editor status
set statusline=\ %f\ %m%h%r\ [%P]\ %a\ %<%l:%v\
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" show the seperate color for each file-type.
syntax on

function! InsertTabWrapper(direction) 
    let col = col('.') - 1 
    if !col || getline('.')[col - 1] !~ '\k' 
    return "\" 
    elseif "backward" == a:direction 
    return "\" 
    else 
    return "\" 
    endif 
endfunction 

inoremap =InsertTabWrapper ("forward") 
inoremap =InsertTabWrapper ("backward") 

if has("unix")
    hi Folded ctermbg=Brown ctermfg=Black
    hi FoldColumn ctermfg=DarkBlue ctermbg=NONE
    hi LineNr ctermfg=DarkBlue
    hi DiffAdd term=bold ctermbg=Brown
    "" bold off
    hi NonText cterm=NONE
    hi ErrorMsg cterm=NONE
    hi ModeMsg cterm=NONE
    hi StatusLine term=REVERSE cterm=NONE ctermfg=3 ctermbg=black
    hi VisualNOS term=NONE cterm=NONE
    hi DiffDelete term=NONE cterm=NONE
    hi DiffText cterm=NONE
    hi Error cterm=NONE
elseif has ("win32")
" MS 윈도우 버튼 기본 색깔인 회색으로 지정
"212 208 200    MS #D4D0C8
"199 199 199    MSB #C7C7C7
hi Normal guibg=#D4D0C8 guifg=Black
    hi NonText guibg=#C7C7C7 guifg=Black gui=NONE
    hi Visual guibg=Black guifg=grey69
    hi LineNr guibg=#C7C7C7 guifg=Blue
    hi Folded guibg=DarkYellow guifg=Black
    hi FoldColumn guibg=#C7C7C7 guifg=Blue
    hi StatusLine guibg=Yellow guifg=black gui=reverse
    hi Cursor guibg=Black guifg=white
    hi CursorIM guibg=Purple guifg=Black
    "" bold off
    hi MoreMsg gui=NONE
    hi ModeMsg gui=NONE
    hi Question gui=NONE
    hi Title gui=NONE
    hi VisualNOS gui=NONE
    hi DiffText gui=NONE
    hi DiffDelete gui=NONE
    hi Statement gui=NONE
    hi Type gui=NONE
endif

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

let colors_name = "default"
hi Search         term=reverse  ctermfg=white ctermbg=red   guifg=white  guibg=black
hi Comment        term=bold  cterm=bold ctermfg=darkcyan  guifg=#80a0ff
hi Folded         term=bold ctermbg=black ctermfg=yellow

