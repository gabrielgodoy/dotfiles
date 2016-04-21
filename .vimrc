"Mac OSx: use smooth, antialiased fonts
set antialias

"Indent at the same level of the previous line
set autoindent

"Uses space when <TAB> is inserted
set expandtab

"Search | Highlight matches
set hlsearch

"MouseWheel enabled
set mouse=a

"Not compatible with older editor like Vi
set nocompatible

"Line numbers in sidebar
set number

"Identation to 4 espaces
set shiftwidth=4

"disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set noeb vb t_vb=

"Enable Indentation
filetype plugin indent on

"Syntax Coloring
syntax on

"Don't enter in "Ex Mode" when 'Q' is pressed
nnoremap Q <nop>

"ctrl+z+, to fire Emmet
let g:user_emmet_leader_key='<C-Z>'

"NERDTreeTabs Activate Auto Open NERDTree Buffer on new tabs
au VimEnter * NERDTreeTabsOpen

let g:nerdtree_tabs_open_on_console_startup = 1
autocmd BufWinEnter * :NERDTreeTabsOpen
autocmd BufWinEnter * :NERDTreeMirrorOpen

"Auto execute NERDTree when open vim
au VimEnter * NERDTree

"Change focus to the file when entering Vim
autocmd VimEnter * wincmd l

noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp

"enter - Insert line after cursor
nmap <CR> o<Esc>

"ctrl+c copy text to clipboard, e ctrl+v to paste clipboard text inside Vim
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

"Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Enable omni completion. (ctrl-x ctrl-o)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

"Change colors in Auto-complete(ctrl+x ctrl+o) Popup
if version >= 700
    let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
    highlight   clear
    highlight   Pmenu         ctermfg=231 ctermbg=238
    highlight   PmenuSel      ctermfg=231 ctermbg=242
    highlight   PmenuSbar     ctermfg=231 ctermbg=0
    highlight   PmenuThumb    ctermfg=231 ctermbg=238
endif

"NeoBundle Setup
if has('vim_starting')
    set nocompatible
    "Required
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

"Required
call neobundle#begin(expand('~/.vim/bundle/'))

"Let NeoBundle manage NeoBundle
"Required
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles here:
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ervandew/supertab'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'jistr/vim-nerdtree-tabs'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
