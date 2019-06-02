"                                    _
"                       ____ __   __(_)___ ___  __________
"                      / __ `/ | / / / __ `__ \/ ___/ ___/
"                    _/ /_/ /| |/ / / / / / / / /  / /__
"                   (_)__, / |___/_/_/ /_/ /_/_/   \___/
"                    /____/
"                                                   - .gvimrc
"
"-----------------------------------------------------------------------------
"---- font ----
let fontname = 'Ricty\ for\ Powerline'

if has('win32') || has('win64') || has('mac')
    execute 'set guifont='.fontname.':h12'
elseif has('unix')
    execute 'set guifont='.fontname.'\ 12'
else
    execute 'set guifont='
endif

"---- key mappings ----
nnoremap <F2> :<C-u>call <SID>MenuToggle()<CR>

"---- options ----
set columns=84
set lines=53
set showtabline=1
set guioptions-=T
set guioptions-=m

source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

"---- functions ----
function! s:MenuToggle()
    if &guioptions =~# 'T'
        set guioptions-=T
        set guioptions-=m
    else
        set guioptions+=T
        set guioptions+=m
    endif
endfunction

"---- color ----
colorscheme molokai
