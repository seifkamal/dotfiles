" Base settings {{{
set termguicolors
set number
set mouse=a
set undofile
set omnifunc=syntaxcomplete#Complete

" netrw
let g:netrw_banner = 0 " Turn off banner
" }}}

" Mappings {{{
inoremap jk <esc>
nnoremap <leader>w :w<cr>
nnoremap <leader>/ :nohlsearch<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader>e :Ex<cr>
nnoremap <leader>k ddkP
nnoremap <leader>j ddp
" }}}

" Editor commands {{{
command! FilePath echo expand('%:p')
command! FormatJSON execute ":%!jq ."
" }}}

" Editor auto commands {{{
augroup filetype_vim
    autocmd!
    " .vimrc folding
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup completion
    autocmd!
    " Close preview after autocomplete selection
    autocmd CompleteDone * pclose
augroup END

" Quickfix item highlighting
sign define notice text=>>

function! s:MarkQFItems()
    sign unplace *
    for item in getqflist()
        execute printf("sign place %d line=%d name=notice", item.lnum, item.lnum)
    endfor
endfunction

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost * call s:MarkQFItems()
augroup end
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itspriddle/vim-shellcheck'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Theme plugin {{{
let g:material_theme_style = 'ocean'
silent! colorscheme material
highlight! Normal ctermfg=white
" }}}

" vim-go {{{
let g:go_fmt_command = 'goimports' " Run goimports along gofmt on each save
let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor
let g:go_auto_sameids = 1
let g:go_updatetime = 400
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

augroup filetype_go
    autocmd!
    autocmd BufWritePost *.go :GoBuild
augroup end
" }}}
" }}}
