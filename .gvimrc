"                                    _
"                       ____ __   __(_)___ ___  __________
"                      / __ `/ | / / / __ `__ \/ ___/ ___/
"                    _/ /_/ /| |/ / / / / / / / /  / /__
"                   (_)__, / |___/_/_/ /_/ /_/_/   \___/
"                    /____/
"                                                   - .gvimrc
"
"=============================================================================
"==== Color ====                                                           {{{

let g:default_cs = 'molokai'
let g:cs_0       = 'railscasts'
let g:cs_1       = 'jellybeans'
let g:cs_2       = 'hybrid-light'

function! s:DisableHlAttr()
	highlight Conditional gui=NONE
	highlight Constant gui=NONE
	highlight Debug gui=NONE
	highlight Comment gui=NONE
	highlight DiffText gui=NONE
	highlight Directory gui=NONE
	highlight ErrorMsg gui=NONE
	highlight Exception gui=NONE
	highlight Keyword gui=NONE
	highlight Macro gui=NONE
	highlight MatchParen gui=NONE
	highlight PreCondit gui=NONE
	highlight Repeat gui=NONE
	highlight SpecialChar gui=NONE
	highlight SpecialComment gui=NONE
	highlight Special gui=NONE
	highlight Statement gui=NONE
	highlight SpecialKey gui=NONE
	highlight Statusline gui=NONE
	highlight StorageClass gui=NONE
	highlight String gui=NONE
	highlight Tag gui=NONE
	highlight Todo gui=NONE
	highlight VertSplit gui=NONE
	highlight WarningMsg gui=NONE
endfunction

function! s:ColorSchemeToggle()
	if g:colors_name == g:default_cs
		let next = g:cs_0
	elseif g:colors_name == g:cs_0
		let next = g:cs_1
	elseif g:colors_name == g:cs_1
		let next = g:cs_2
	elseif g:colors_name == g:cs_2
		let next = g:default_cs
	else
		let next = g:default_cs
	endif
	execute 'colorscheme '.next
	call s:DisableHlAttr()
	redraw
	echo 'colorscheme changed "'.next.'"'
endfunction

execute 'colorscheme '.g:default_cs
call s:DisableHlAttr()

" Key mapping for ColorSchemeToggle
nnoremap ,c :<C-u>call <SID>ColorSchemeToggle()<CR>

" }}}
"=============================================================================
"==== Font and Window ====                                                 {{{

" Default column width of the window
set columns=84

" Default number of lines of the window
set lines=53

" Default font name
let fontname = 'Ricty\ for\ Powerline'

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
