"                                    _
"                       ____ __   __(_)___ ___  __________
"                      / __ `/ | / / / __ `__ \/ ___/ ___/
"                    _/ /_/ /| |/ / / / / / / / /  / /__
"                   (_)__, / |___/_/_/ /_/ /_/_/   \___/
"                    /____/
"                                                   - .gvimrc
"
"=============================================================================
"==== Font and Window ====                                                 {{{

" Default column width of the window
set columns=84

" Default number of lines of the window
set lines=53

" Default font name
if has('win32') || has('win64')
    let fontname = 'Inconsolata'
else
    let fontname = 'Ricty\ for\ Powerline'
endif

" Default font setting
if has('win32') || has('win64') || has('mac')
    execute 'set guifont='.fontname.':h12'
elseif has('unix')
    execute 'set guifont='.fontname.'\ 12'
else
    execute 'set guifont='
endif

" }}}
"=============================================================================
"==== GUI Display ====                                                     {{{

"-----------------
"   Tab display
"-----------------

" Tab label
"    0: Always hide
"    1: Show if tabs are opened more than 2
"    2: Always show
set showtabline=1


"---------------------------
"   GUI Tool Bar and Menu
"---------------------------

"----- Default -----
" Hide GUI Tool Bar
set guioptions-=T

" Hide GUI Menu
set guioptions-=m

"----- Switches ToolBar/Menu display ON/OFF -----
nnoremap <F2> :<C-u>call <SID>MenuToggle()<CR>

function! s:MenuToggle()
    if &guioptions =~# 'T'
        set guioptions-=T
        set guioptions-=m
    else
        set guioptions+=T
        set guioptions+=m
    endif
endfunction

" }}}
"=============================================================================
"==== Options ====                                                         {{{

" Settings for Japanese Menu
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" }}}
"=============================================================================
