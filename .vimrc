"                                 _
"                          _   __(_)___ ___  __________
"                         | | / / / __ `__ \/ ___/ ___/
"                        _| |/ / / / / / / / /  / /__
"                       (_)___/_/_/ /_/ /_/_/   \___/
"
"                                                   - .vimrc
"
"-----------------------------------------------------------------------------
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformat=unix
set fileformats=unix,dos,mac

"-----------------------------------------------------------------------------
"---- vim-plug ----
call plug#begin('~/.vim/plugged')
Plug 'KannoKanno/previm', { 'for': 'markdown' }
Plug 'Kocha/vim-systemc', { 'for': 'cpp' }
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite-help'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/vimshell.vim'
Plug 'amal-khailtash/vim-xdc-syntax', { 'for': 'xdc' }
Plug 'jacoborus/tender.vim'
Plug 'jezcope/vim-align'
Plug 'mattn/vim-lsp-settings'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'scrooloose/nerdtree'
Plug 't9md/vim-textmanip'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-visualstar'
Plug 'thinca/vim-fontzoom'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim', { 'for': 'markdown' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/vcscommand.vim'
Plug 'vim-scripts/CmdlineComplete'
Plug 'vim-syntastic/syntastic'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"---- previm ----
let g:previm_show_header = 0

"---- vim-easymotion ----
map ,, <Plug>(easymotion-prefix)


"---- neosnippet.vim ----
let g:neosnippet#snippets_directory = '~/.snippets'

imap <expr><C-k> neosnippet#expandable() ?
\    "\<Plug>(neosnippet_expand)" :
\    pumvisible() ? "\<C-n>" : "\<C-k>"

smap <expr><C-k> neosnippet#expandable() ?
\    "\<Plug>(neosnippet_expand)" :
\    "\<C-k>"

imap <expr><TAB> neosnippet#jumpable() ?
\    "\<Plug>(neosnippet_jump)" :
\    "\<TAB>"

smap <expr><TAB> neosnippet#jumpable() ?
\    "\<Plug>(neosnippet_jump)" :
\    "\<TAB>"

if has('conceal')
    set conceallevel=2 concealcursor=i
endif

"---- unite.vim ----
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable = 1
nnoremap [unite] <Nop>
nmap ; [unite]
nnoremap <silent> [unite]a :<C-u>Unite buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new directory/new<CR>
nnoremap <silent> [unite]g :<C-u>Unite -no-quit -no-start-insert grep<CR>
nnoremap <silent> [unite]h :<C-u>Unite help<CR>
nnoremap <silent> [unite]l :<C-u>Unite -no-quit line<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=file_rec file_rec/async file/new directory/new<CR>
nnoremap <silent> [unite]s :<C-u>Unite source<CR>
nnoremap <silent> [unite]t :<C-u>Unite -no-start-insert tab<CR>
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>

augroup unite_settings
    autocmd!
    autocmd FileType unite call s:unite_settings()
augroup END

function! s:unite_settings()
    nmap <buffer> <ESC> <Plug>(unite_exit)
    imap <buffer> jj <Plug>(unite_insert_leave)
    imap <buffer> kk <Plug>(unite_insert_leave)
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
    inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
    nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
    inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
    nnoremap <silent><buffer><expr> o unite#smart_map('o', unite#do_action('open'))
    inoremap <silent><buffer><expr> o unite#smart_map('o', unite#do_action('open'))
    nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
    inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
    nnoremap <silent><buffer><expr> D unite#smart_map('D', unite#do_action('diff'))
    inoremap <silent><buffer><expr> D unite#smart_map('D', unite#do_action('diff'))
endfunction

"---- vimfiler.vim ----
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 1

augroup vimfiler
    autocmd!
    autocmd FileType vimfiler call s:vimfiler_settings()
augroup END

function! s:vimfiler_settings()
    nmap <buffer> q <Plug>(vimfiler_exit)
    nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction

nnoremap <silent> ,v :<C-u>VimFiler<CR>
nnoremap <silent> ,b :<C-u>VimFilerBufferDir<CR>

"---- vimshell.vim ----
if has('win32') || has('win64')
    let g:vimshell_interactive_encodings = {'/bin': 'utf-8', '/usr/bin/': 'utf-8'}
endif

let g:vimshell_prompt_expr = '"[".expand("$HOSTNAME")." ".fnamemodify(getcwd(), ":t")."]$ "'
let g:vimshell_prompt_pattern = '^\[\S\+ \f\+\]$ '
let g:vimshell_popup_height = 80

nnoremap <silent> ,s :<C-u>VimShellBufferDir -popup -toggle<CR>

augroup vimshell_settings
    autocmd!
    autocmd FileType vimshell call s:vimshell_settings()
augroup END

function! s:vimshell_settings()
    nmap <buffer> <ESC><ESC><ESC> <Plug>(vimshell_hide)
endfunction

"---- vim-markdown ----
let g:vim_markdown_folding_disabled = 1

"---- asyncomplete.vim ----
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

"---- nerdtree ----
nnoremap <silent> ,t :<C-u>NERDTreeToggle<CR>
let g:NERDTreeShowBookmarks = 1
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

"---- vim-textmanip ----
xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)

"---- vim-multiple-cursors ----
let g:multi_cursor_use_default_mapping = 1

"---- vim-visualstar ----
map * <Plug>(visualstar-*)Nzz
map # <Plug>(visualstar-#)Nzz

"---- vim-fontzoom ----
let g:fontzoom_no_default_key_mappings = 1
nmap + <Plug>(fontzoom-larger)
nmap - <Plug>(fontzoom-smaller)

"---- vim-fugitive ----
nnoremap ,gs :<C-u>Gstatus<CR>
nnoremap ,gd :<C-u>Gdiff<CR>
nnoremap ,gD :<C-u>Gdiff<Space>
nnoremap ,gb :<C-u>Gblame<CR>
nnoremap ,gl :<C-u>Glog<CR>
nnoremap ,gw :<C-u>Gwrite<CR>
nnoremap ,gr :<C-u>Gread<CR>
nnoremap ,ge :<C-u>Gedit<CR>

"---- vim-airline ----
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tender'
let g:airline#extensions#tabline#enabled = 1

"---- syntastic ----
let g:syntastic_mode_map = { 'mode': 'passive' }

"---- vim-devicons ----
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

"-----------------------------------------------------------------------------
"---- key mappins ----
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

" other useful mappings
nnoremap <silent> ,/ :<C-u>nohlsearch<CR>:<C-u>redraw!<CR>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
vnoremap < <gv
vnoremap > >gv
map <Space>vh :<C-u>vertical belowright help<Space>
map <Space>th :<C-u>tab help<Space>
map ,l :<C-u>set list!<CR>
map ,e :<C-u>set expandtab!<CR>
nnoremap ,u :<C-u>set fileencoding=utf-8 fileformat=unix<CR>
nnoremap ,w :<C-u>set fileencoding=cp932 fileformat=dos<CR>
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy  ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy  c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nnoremap <silent> ,n :<C-u>call <SID>NumberToggle()<CR>

"---- options ----
set ambiwidth=double
set cursorline
set ignorecase
set smartcase
set nostartofline
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=0
set autoindent
set wrap
set wrapscan
set wildmenu
set wildmode=list:longest
set showmatch
set number
set ruler
set list
set listchars=tab:>-,trail:-,eol:<,nbsp:%,precedes:<,extends:>
set laststatus=2
set showcmd
set nobackup
set noundofile
set writebackup
set hlsearch
set incsearch
set showmode
set confirm
set novisualbell
set noautochdir
set modeline
set diffopt=vertical,icase,filler
set grepprg=grep\ -rnH\ --exclude-dir=.svn\ --exclude-dir=.git
set clipboard+=unnamed
set virtualedit+=block
set nrformats=
set shortmess+=I
set pastetoggle=<F2>
set scrolloff=4
set foldenable
set foldcolumn=0
set foldmethod=marker
set foldlevelstart=0
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set timeout ttimeoutlen=100
set mouse=a
set ttymouse=xterm2
set noshowmode
let g:filetype_m = 'objc'

"---- autocmd groups ----
augroup fopt
    autocmd!
    autocmd FileType * setlocal formatoptions-=ro
augroup END

augroup detect_vh_file
    autocmd!
    autocmd bufNewFile,bufRead *.vh setfiletype verilog
augroup END

augroup vimrcEx
    autocmd!
    autocmd FileType text setlocal textwidth=78
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

"---- functions ----
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

"---- color ----
if (has('termguicolors') && $TERM_PROGRAM!='Apple_Terminal')
    set termguicolors
else
    set t_Co=256
endif

set background=dark

colorscheme tender

highlight! link NERDTreeFlags NERDTreeDir
