color desert "佈景

set nocompatible "跟原始vi的相容

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" File Explorer
    Plugin 'scrooloose/nerdtree'
    Plugin 'ctrlpvim/ctrlp.vim'

" Coding Help

    Plugin 'c9s/gsession.vim'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'L9'

    "Plugin 'othree/vim-autocomplpop'
    Plugin 'msanders/snipmate.vim'

    " Coding Check
    Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

let g:snips_author="e136 yuchen.tseng<yuchen.tseng@eris.com.tw>"

"PHP Auto Completion"
"au FileType php setlocal dict+=~/.vim/bundle/vim-autocomplpop/php-ide-funclist.txt

"PHP Syntastic 語法檢查
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter" "phpcs, tab = 4空格, 編碼參考使用CodeIgniter風格
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1 "打文件時檢查
let g:syntastic_check_on_wq = 0

""
let mapleader=',' " 使用gsession, easymotion等 需要leader的plugin

set nohlsearch "no highlight search 不比對關鍵字

set nowrap "螢幕折行

set ai "自動縮排

set autoindent shiftwidth=4 "自動縮排間距

set shiftwidth=4 "縮排間距

set expandtab "tabs to space

set softtabstop=4

set tabstop=4 "TAB鍵寬度

syn on "顏色標記

set enc=utf8 "UTF-8文件

" language message zh_TW.UTF-8 "UTF-8訊息

set nu "設定行號

set showmode "顯示狀態

set cmdheight=1 "命令列行數

set fileencoding=utf-8 "寫入檔案的編碼

set fileformats=unix,dos "寫入檔案EOL的形式

set cindent "跟C語言有關

set nobackup "自動備份

set smarttab

set smartindent

set noswf "沒有swap file

set columns=220 "預設視窗寬

set lines=100 "預設視窗行高

" set foldmethod=marker "折疊 1:syntax 2:marker 3:indent
set foldmethod=indent "折疊 1:syntax 2:marker 3:indent
set foldcolumn=3 "顯示折疊狀態(左)
set foldlevel=1

set wildmenu " 開檔時, 上面會列出所有檔案

set autochdir " 開檔時, 按TAB會將目錄指到目前所在檔案的目錄

set guioptions+=b "bottom 加 scroll bar

set guifont=DejaVu\ Sans\ Mono\ 10

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

highlight WhitespaceEOL ctermbg=red guibg=red

"match WhitespaceEOL /\s\+$/
"autocmd BufWritePre *.php,*.js,*.css,*.html,*.htm :%s/\s\+$//e

" Remove trailing whitespace when writing a buffer, but not for diff files.
function RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

" 自訂快速鍵

"map <C-Q> :q<CR>   ==> Ctrl+q
"map <S-V> :vsp<CR> ==> Shift+v
"map <S-S> :sp<CR>  ==> Shift+s

"set shell=/bin/bash
