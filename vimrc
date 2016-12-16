set nocompatible
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'wincent/command-t'
" call vundle#end()

let mapleader = ","

set number
hi CursorLine cterm=NONE ctermbg=0
set cul
set colorcolumn=+1

" Terminal has 256 colors
set t_Co=256
set background=light

hi ColorColumn cterm=NONE ctermbg=darkgray
hi Comment cterm=NONE ctermfg=darkgray
hi Error cterm=NONE ctermbg=darkgray
hi DiffChange cterm=NONE ctermbg=lightblue
hi SpellBad cterm=NONE ctermbg=red
hi Visual cterm=NONE ctermbg=darkgray

" Always show status bar
set laststatus=2

" Map F2 to search keyword under cursor
nnoremap <F2> *

" Map F12 to save in command and insert modes
nnoremap <F12> :update<CR>

" Map F7, F8 to switch buffers
nnoremap <F7> :bn<CR>
inoremap <F7> <Esc>:bn<CR>a
nnoremap <F8> :bp<CR>
inoremap <F8> <Esc>:bp<CR>a

" Map F9 to list buffers
nnoremap <F9> :ls<CR>
inoremap <F7> <Esc>:ls

nmap <C-]> :exe 'Gtlist ' . expand('<cword>')<CR>

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Jump to last position in a file
:au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

syntax on

" Switch between cc, h, test/unittest files.
function! GetFileBase()
  return substitute(expand("%"),
        \ '\(.\{-}\)\(_test\|_unittest\)\?\.\(h\|cc\)$', '\1', "")
endfunction

function! EditCc()
  exec "edit " . fnameescape(GetFileBase() . ".cc")
endfunction
map <leader>cc :silent :call EditCc()<CR>

function! EditH()
  exec "edit " . fnameescape(GetFileBase() . ".h")
endfunction
map <leader>h :silent :call EditH()<CR>
