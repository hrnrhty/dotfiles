"                                 _
"                          _   __(_)___ ___  __________
"                         | | / / / __ `__ \/ ___/ ___/
"                        _| |/ / / / / / / / /  / /__
"                       (_)___/_/_/ /_/ /_/_/   \___/
"
"                                                   - .vimrc
"
"=============================================================================
"==== Be iMproved ====                                                     {{{

set nocompatible

" }}}
"=============================================================================
"==== Encoding ====                                                        {{{

" Vim internal encoding
set encoding=utf-8

" Default file encoding and file format
if has('win32') || has('win64')
    set fileencoding=cp932
    set fileformat=dos
elseif has('unix') || has('mac')
    set fileencoding=utf-8
    set fileformat=unix
else
    set fileencoding=utf-8
    set fileformat=unix
endif

" File encoding Detection
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,eucjp-ms,cp932

" }}}
"=============================================================================
"==== NeoBundle ====                                                       {{{

filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim',          { 'type__protocol' : 'https' }

" Use NeoBundle standard recipes
NeoBundle 'Shougo/neobundle-vim-recipes',  { 'type__protocol' : 'https' }

" Original repos on github
NeoBundle 'Kocha/vim-systemc',             { 'type__protocol' : 'https' }
NeoBundle 'Lokaltog/vim-easymotion',       { 'type__protocol' : 'https' }
NeoBundle 'Lokaltog/vim-powerline',        { 'type__protocol' : 'https' }
NeoBundle 'Shougo/neocomplcache',          { 'type__protocol' : 'https' }
NeoBundle 'Shougo/neosnippet',             { 'type__protocol' : 'https' }
NeoBundle 'Shougo/neosnippet-snippets',    { 'type__protocol' : 'https' }
NeoBundle 'Shougo/unite.vim',              { 'type__protocol' : 'https' }
NeoBundle 'Shougo/unite-help',             { 'type__protocol' : 'https' }
NeoBundle 'Shougo/vimfiler',               { 'type__protocol' : 'https' }
NeoBundle 'Shougo/vimproc',                { 'type__protocol' : 'https',
                                         \   'build' : {
                                         \       'cygwin'  : 'make -f make_cygwin.mak',
                                         \       'mac'     : 'make -f make_mac.mak',
                                         \       'unix'    : 'make -f make_unix.mak'
                                         \   }
                                         \ }
NeoBundle 'Shougo/vimshell',               { 'type__protocol' : 'https' }
NeoBundle 'amal-khailtash/vim-xdc-syntax', { 'type__protocol' : 'https' }
NeoBundle 'davidoc/taskpaper.vim',         { 'type__protocol' : 'https' }
NeoBundle 'godlygeek/csapprox',            { 'type__protocol' : 'https' }
NeoBundle 'jezcope/vim-align',             { 'type__protocol' : 'https' }
NeoBundle 'jpo/vim-railscasts-theme',      { 'type__protocol' : 'https' }
NeoBundle 'nanotech/jellybeans.vim',       { 'type__protocol' : 'https' }
NeoBundle 't9md/vim-textmanip',            { 'type__protocol' : 'https' }
NeoBundle 'thinca/vim-fontzoom',           { 'type__protocol' : 'https', 'gui' : 1 }
NeoBundle 'thinca/vim-visualstar',         { 'type__protocol' : 'https' }
NeoBundle 'tomasr/molokai',                { 'type__protocol' : 'https' }
NeoBundle 'tpope/vim-fugitive',            { 'type__protocol' : 'https' }
NeoBundle 'tpope/vim-repeat',              { 'type__protocol' : 'https' }
NeoBundle 'tpope/vim-surround',            { 'type__protocol' : 'https' }
NeoBundle 'vim-jp/vimdoc-ja',              { 'type__protocol' : 'https' }
NeoBundle 'w0ng/vim-hybrid',               { 'type__protocol' : 'https' }

" vim-scripts repos
NeoBundle 'CmdlineComplete',               { 'type__protocol' : 'https' }
NeoBundle 'YankRing.vim',                  { 'type__protocol' : 'https' }
NeoBundle 'verilog_systemverilog.vim',     { 'type__protocol' : 'https' }

" non github repos

" Installation check
NeoBundleCheck

" Automatically detect file type by file name and content,
" then enable filter type plugin
filetype plugin indent on

" }}}
"=============================================================================
"==== easymotion ====                                                      {{{

let g:EasyMotion_leader_key = ',,'

" }}}
"=============================================================================
"==== vim-powerline ====                                                   {{{

if has('gui_running')
    " Use custom icons and arrows. Requires a patched font.
    let g:Powerline_symbols = 'fancy'
elseif has('unix') && &term=='xterm-256color'
    " Use custom icons and arrows. Requires a patched font.
    let g:Powerline_symbols = 'fancy'
else
    " Don't use any special characters.
    let g:Powerline_symbols = 'compatible'
endif

" }}}
"=============================================================================
"==== neocomplcache ====                                                   {{{

" Use neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Use smartcase
let g:neocomplcache_enable_smart_case = 1

" }}}
"=============================================================================
"==== neosnippet ====                                                      {{{

" Path to user-defined snippet files
let g:neosnippet#snippets_directory = '~/.snippets'

" Plugin key-mappings
imap <expr><C-k> neosnippet#expandable() ?
 \   "\<Plug>(neosnippet_expand)"            :
 \    pumvisible() ? "\<C-n>" : "\<C-k>"

smap <expr><C-k> neosnippet#expandable() ?
\    "\<Plug>(neosnippet_expand)"            :
\    "\<C-k>"

imap <expr><TAB> neosnippet#jumpable() ?
\    "\<Plug>(neosnippet_jump)"        :
\    "\<TAB>"

smap <expr><TAB> neosnippet#jumpable() ?
\    "\<Plug>(neosnippet_jump)"        :
\    "\<TAB>"

" For snippet_complete marker
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" }}}
"=============================================================================
"==== unite ====                                                           {{{

" Start in insert mode
let g:unite_enable_start_insert=1

" unite prefix key
nnoremap [unite] <Nop>
nmap ; [unite]

" Show all
nnoremap <silent> [unite]a :<C-u>Unite buffer file_mru bookmark file<CR>

" Buffer List
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>

" Bookmark
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>

" File List
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new directory/new<CR>

" unite-grep
nnoremap <silent> [unite]g :<C-u>Unite -no-quit -no-start-insert grep<CR>

" unite-help
nnoremap <silent> [unite]h :<C-u>Unite help<CR>

" unite-line
nnoremap <silent> [unite]l :<C-u>Unite line<CR>

" Recent Files List
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>

" Register List
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" unite-source list
nnoremap <silent> [unite]s :<C-u>Unite source<CR>

" Tab List
nnoremap <silent> [unite]t :<C-u>Unite -no-start-insert tab<CR>

augroup unite_settings
    autocmd!
    autocmd FileType unite call s:unite_settings()
augroup END

function! s:unite_settings()
    " Quit unite by ESC
    nmap <buffer> <ESC> <Plug>(unite_exit)

    " Move to Normal mode by 'jj' or 'kk' on Insert mode
    imap <buffer> jj <Plug>(unite_insert_leave)
    imap <buffer> kk <Plug>(unite_insert_leave)

    " Delete backslash by C-w
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

    " split by 's'
    nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
    inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))

    " vsplit by 'v'
    nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
    inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))

    " open by 'o'
    nnoremap <silent><buffer><expr> o unite#smart_map('o', unite#do_action('open'))
    inoremap <silent><buffer><expr> o unite#smart_map('o', unite#do_action('open'))

    " Open with vimfiler by 'f'
    nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
    inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
endfunction

" }}}
"=============================================================================
"==== vimfiler ====                                                        {{{

" Use vimfiler as a default filer
let g:vimfiler_as_default_explorer = 1

" Safe Mode enable by default
let g:vimfiler_safe_mode_by_default = 1
 
" Key mappings for vimfiler
augroup vimfiler
    autocmd!
    autocmd FileType vimfiler call s:vimfiler_settings()
augroup END

function! s:vimfiler_settings()
    nmap <buffer> q <Plug>(vimfiler_exit)
    nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction

" Open vimfiler
nnoremap <silent> ,v :<C-u>VimFiler<CR>

" Open current buffer dir using vimfiler
nnoremap <silent> ,b :<C-u>VimFilerBufferDir<CR>

" Open vimfiler with file explorer like behavior
nnoremap <silent> ,t :<C-u>VimFilerExplorer<CR>

" }}}
"=============================================================================
"==== vimshell ====                                                        {{{

" Set encoding UTF-8 when a cygwin command is executed
if has('win32') || has('win64')
    let g:vimshell_interactive_encodings = {'/bin': 'utf-8', '/usr/bin/': 'utf-8'}
endif

" Use $HOSTNAME + current directory as vimshell prompt
let g:vimshell_prompt_expr = '"[".expand("$HOSTNAME")." ".fnamemodify(getcwd(), ":t")."]$ "'
let g:vimshell_prompt_pattern = '^\[\S\+ \f\+\]$ '

let g:vimshell_popup_height = 80

" Key mapping for vimshell
nnoremap <silent> ,s :<C-u>VimShellBufferDir -popup -toggle<CR>

augroup vimshell_settings
    autocmd!
    autocmd FileType vimshell call s:vimshell_settings()
augroup END

function! s:vimshell_settings()
    " Hide vimshell buffer by ESC
    nmap <buffer> <ESC><ESC><ESC> <Plug>(vimshell_hide)
endfunction

" }}}
"=============================================================================
"==== textmanip ====                                                       {{{

" Key mappings
xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)

" }}}
"=============================================================================
"==== fugitive ====                                                        {{{

" Show branch name on Status Line
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Key mappings
nnoremap ,gs :<C-u>Gstatus<CR>
nnoremap ,gd :<C-u>Gdiff<CR>
nnoremap ,gD :<C-u>Gdiff<Space>
nnoremap ,gb :<C-u>Gblame<CR>
nnoremap ,gl :<C-u>Glog<CR>
nnoremap ,gw :<C-u>Gwrite<CR>
nnoremap ,gr :<C-u>Gread<CR>
nnoremap ,ge :<C-u>Gedit<CR>

" }}}
"=============================================================================
"==== visualstar ====                                                      {{{

" Search the text, but cursor don't move to next match
map * <Plug>(visualstar-*)Nzz
map # <Plug>(visualstar-#)Nzz

" }}}
"=============================================================================
"==== YankRing ====                                                        {{{

let g:yankring_history_dir   = expand('$HOME')
let g:yankring_history_file  = '.yankring_history'
let g:yankring_max_history   = 10
let g:yankring_window_height = 13
let g:yankring_enabled       = 0

nnoremap <silent> ,ys :<C-u>YRShow<CR>
nnoremap <silent> ,yt :<C-u>YRToggle<CR>

" }}}
"=============================================================================
"==== Comment Out ====                                                     {{{

" lhs comments
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
vmap ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
vmap ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
vmap ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

" block comments
vmap ,b v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap ,h v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>

" }}}
"=============================================================================
"==== Key Mappings ====                                                    {{{

" Leader key
let mapleader="]"

" Open next buffer
nnoremap <C-n> :<C-u>bnext<CR>

" Open previous buffer
nnoremap <C-p> :<C-u>bprevious<CR>

" Unhighlight searched phrases
nnoremap <silent> ,/ :<C-u>nohlsearch<CR>:<C-u>redraw!<CR>

" auto-complete
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>

" Keep selection after <, > command
vnoremap < <gv
vnoremap > >gv

" Open help at belowright with vsplit
map <Space>vh :<C-u>vertical belowright help<Space>

" Open help with new tab
map <Space>th :<C-u>tab help<Space>

" Toggele list <-> nolist
map ,l :<C-u>set list!<CR>

" Switches <TAB> settings
map ,e :<C-u>set expandtab!<CR>

" Set fileencoding to UTF-8 and fileformat to LF
nnoremap ,u :<C-u>set fileencoding=utf-8 fileformat=unix<CR>

" Set fileencoding to Shift-JIS and fileformat to CR+LF
nnoremap ,w :<C-u>set fileencoding=cp932 fileformat=dos<CR>

" Select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Replace a word under the cursor by the yanked string
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" Replace a word after the cursor by the yanked string
nnoremap <silent> cy  ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy  c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" Easy window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Toggle number options
nnoremap <silent> ,n :<C-u>call <SID>NumberToggle()<CR>

function! s:NumberToggle()
    if (&number)
        set nonumber
        set relativenumber
    elseif (&relativenumber)
        set norelativenumber
        set number
    else
        set number
    endif
endfunction

" }}}
"=============================================================================
"==== Options ====                                                         {{{

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
    autocmd!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" Enable syntax highlighting
syntax on

" Ignore case when searching
set ignorecase

" If a search pattern contains an uppercase letter, it is case sensitive,
" otherwise, it is not
set smartcase

" When execute commands listed in help,
" the cursor does not move to the beginning of the line
set nostartofline

" Allow backspacing over...
"    autoindent('indent'),
"    line breaks('eol'),
"    the start of insert('start')
set backspace=indent,eol,start

" Number of spaces that a <Tab> in the file counts for
set tabstop=4

" Number of spaces to use for each step of (auto)indent
set shiftwidth=4

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>
" It 'feels' like <Tab>s are being inserted,
" while in fact a mix of spaces and <Tab>s is used
set softtabstop=4

" In Insert mode: Use the appropriate number of spaces
" to insert a <Tab>
set expandtab

" Maximum width of text that is being inserted
" A longer line will be broken after white space to get this width
" A zero value disables this
set textwidth=0

" Copy indent from current line when starting a new line
" (typing <CR> in Insert mode or when using the "o" or "O" command).
set autoindent

" Lines longer than the width of the window will wrap and
" displaying continues on the next line.
set wrap

" Searches wrap around the end of the file
set wrapscan

" Command-line completion operates in an enhanced mode
set wildmenu

" Completion mode
set wildmode=list:longest

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Print the line number in front of each line
set number

" Show the line and column number of the cursor position
set ruler

" Show tabs, end of line and so on...
set list

" Strings to use in 'list' mode and for the |:list| command
set listchars=tab:>-,trail:-,eol:<,nbsp:%,precedes:<,extends:>

" Status line
"    0: Do not show
"    1: Show when windows are more than 2
"    2: Always show
set laststatus=2

" Show (partial) command in the last line of the screen
set showcmd

" Do not make backup file
set nobackup

" Make a backup before overwriting a file
" The backup is removed after the file was successfully written,
" unless the 'backup' option is also on
set writebackup

" Highlight searched phrases
set hlsearch

" Show search matches as you type
set incsearch

" Height of command line
set cmdheight=2

" Indicates largest size of changes reported on status line
set report=2

" Show current mode
set showmode

" Ask what to do about unsaved/read-only files
set confirm

" Enable visual bell
set novisualbell

" If enabled,
" working directory is always the same as the file which are editing
set noautochdir

" Enable modeline
set modeline

" Option settings for diff mode
set diffopt=vertical,icase

" Disable the auto comment insertion
augroup fopt
    autocmd!
    autocmd FileType * setlocal formatoptions-=ro
augroup END

" grep command
set grepprg=grep\ -nH

" Yanks go on clipboard
set clipboard+=unnamed

" Allow virtual editing in Visual block mode
set virtualedit+=block

" The number will be recognized as decimal
" when using the CTRL-A and CTRL-X commands
set nrformats=

" Hide the launch screen
set shortmess+=I

" When in insert mode, press <F2> to go to
" paste mode, whre you can paster mass data
" that won't be autoindented
set pastetoggle=<F2>

" Keep 4 lines off the edges of the screen when scrolling
set scrolloff=4

" Folding
set foldenable
set foldcolumn=0
set foldmethod=marker
set foldlevelstart=0
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" .m files are Objective-C, not Matlab
let g:filetype_m = 'objc'

" }}}
"=============================================================================
"==== Color ====                                                           {{{

if !has('gui_running') && &term != 'linux'

    " Enable 256-color
    set t_Co=256

    let g:default_cs = 'molokai'
    let g:cs_0       = 'railscasts'
    let g:cs_1       = 'jellybeans'
    let g:cs_2       = 'hybrid-light'

    function! s:DisableHlAttr()
        highlight Conditional cterm=NONE
        highlight Constant cterm=NONE
        highlight Debug cterm=NONE
        highlight Comment cterm=NONE
        highlight DiffText cterm=NONE
        highlight Directory cterm=NONE
        highlight ErrorMsg cterm=NONE
        highlight Exception cterm=NONE
        highlight Keyword cterm=NONE
        highlight Macro cterm=NONE
        highlight MatchParen cterm=NONE
        highlight PreCondit cterm=NONE
        highlight Repeat cterm=NONE
        highlight SpecialChar cterm=NONE
        highlight SpecialComment cterm=NONE
        highlight Special cterm=NONE
        highlight Statement cterm=NONE
        highlight SpecialKey cterm=NONE
        highlight Statusline cterm=NONE
        highlight StorageClass cterm=NONE
        highlight String cterm=NONE
        highlight Tag cterm=NONE
        highlight Todo cterm=NONE
        highlight VertSplit cterm=NONE
        highlight WarningMsg cterm=NONE
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

endif

" }}}
"=============================================================================
"==== for terminal ====                                                    {{{

if has('unix') && &term=='xterm-256color'
    " Cursor behavior
"    let &t_ti.="\e[1 q"
"    let &t_SI.="\e[5 q"
"    let &t_EI.="\e[1 q"
"    let &t_te.="\e[0 q"

    " Arrow key
    inoremap OA <Up>
    inoremap OB <Down>
    inoremap OC <Right>
    inoremap OD <Left>
endif

" }}}
"=============================================================================
