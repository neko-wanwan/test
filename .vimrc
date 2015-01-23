

" --------*--------*--------*--------*--------*--------*--------*--------
" ファイルの文字コードを自動認識
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-bom,default,latin

set nocompatible
filetype off

set modeline

set noignorecase
set smartcase

" ランキング2位の設定。一行の文字数があまりにも多いとvimで表示されなくなってしまうことへの対処。
set display=lastline

" ----------------------------------------------
"  Start Neobundle Settings.
"  ---------------------------------------------
" bundle で管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" neobundle 時代をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 追加のプラグイン！
" NERDTree
NeoBundle 'scrooloose/nerdtree'
" autoclose
NeoBundle 'Townk/vim-autoclose'
" quickrun
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'karakaram/vim-quickrun-phpunit'
augroup QuickRunPHPUnit
	autocmd!
	autocmd BufWinEnter,BufNewFile *Test.php set filetype=phpunit
augroup END

let g:quickrun_config = {
			\  "_" : {
			\  "outputter/buffer/split": ":botright",
			\  "outputter/buffer/close_on_empty": 1
			\  },
			\ "phpunit": {
			\    "outputter/buffer/split": ":botright",
			\    "command": "phpunit",
			\    "cmdopt": "",
			\    "exec": "%c %o %s",
			\    "outputter": "phpunit",
			\    "outputter/phpunit/running_mask": "running...",
			\    "outputter/phpunit/height": 3,
			\    "outputter/phpunit/auto_open": 0
			\  },
			\}

NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'taglist.vim'
NeoBundle 'wesleyche/Trinity'

" 変数一覧は表示させない Tlist の設定
let tlist_php_settings = 'php;c:class;d:constant;f:function'

NeoBundle 'scrooloose/syntastic'
" JavaScript のシンタックスチェックをjshintで
let g:syntastic_javascript_checker = "jshint" "JavaScriptのSyntaxチェックはjshintで
let g:syntastic_check_on_open = 0 "ファイルオープン時にはチェックをしない
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施

NeoBundle 'drillbits/nyan-modoki.vim'
set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 2
let g:nayn_modoki_animation_enabled= 1

" NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'

" Git 用プラグイン
NeoBundle 'tpope/vim-fugitive'

call neobundle#end()

" Required:
filetype plugin indent on

"
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねる
NeoBundleCheck

" ----------------------------------------------
"  End Neobundle Settings.
"  ---------------------------------------------

filetype plugin on
filetype indent on


"エラー時、Quickfixが起動する
let g:syntastic_auto_loc_list = 1	
let g:syntastic_javascript_checker = 'jshint'

autocmd FileType javascript set omnifunc=jscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType jade set omnifunc=jadecomplete#CompleteJade

" ファイルタイプごとの設定
" ts:tabstop, sw:shift width
autocmd FileType c set ts=2 sw=2 st=0 expandtab
autocmd FileType cpp set ts=2 sw=2 st=0 expandtab
autocmd FileType javascript set ts=2 sw=2 st=0 expandtab
autocmd FileType html set ts=2 sw=2 st=0 expandtab
autocmd FileType scss set ts=2 sw=2 st=0 expandtab
autocmd FileType ruby set ts=2 sw=2 st=0 expandtab
autocmd FileType sh set ts=2 sw=2 st=0 expandtab
autocmd FileType xml set ts=2 sw=2 st=0 expandtab
autocmd FileType php set ts=2 sw=2 st=0 expandtab dictionary=~/.vim/dict/php.dict
autocmd FileType jade set ts=2 sw=2 st=0 expandtab
autocmd FileType json set ts=2 sw=2 st=0 expandtab
autocmd FileType yaml set ts=2 sw=2 st=0 expandtab
autocmd FileType slim set ts=2 sw=2 st=0 expandtab

syntax on

"-------------------------------------------------
"" neocomplcache設定
"-------------------------------------------------
""辞書ファイル
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'


" コマンドライン補完
set wildmenu

" コマンドラインの行数
set cmdheight=2

set t_Co=256

" 検索時に大文字・小文字を区別しない
" ただし、検索後に大文字小文字が混在しているときは区別する
set ignorecase
set smartcase
" 画面最下行にルーラーを表示する
set ruler
" 検索後を強調表示
" <C-l> を押すと現在の強調表示を解除する
set hlsearch
nnoremap <silent> <C-l> :nohl<CR><C-l>
" 不可視文字表示
set list
set listchars=tab:≫\ ,trail:-,extends:≫,precedes:≪,nbsp:%

" タブ切り替え
nnoremap <C-n> gt
nnoremap <C-p> gT

" NERDTree
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
	autocmd VimEnter * NERDTree ./
endif

" NERDTree をCtrl-k で切り替えられるように
nmap <silent> <C-e> :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e> :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
" Tlist をCtrl-k で切り替えられるように
nmap <silent> <C-k> :Tlist<CR>
vmap <silent> <C-k> <Esc>:Tlist<CR>
omap <silent> <C-k> :Tlist<CR>
imap <silent> <C-k> <Esc>:Tlist<CR>
cmap <silent> <C-k> <C-u>:Tlist<CR>
" Trinity をCtrl-fで切り替えられるように
nmap <silent> <C-f> :TrinityToggleAll<CR>
vmap <silent> <C-f> <Esc>:TrinityToggleAll<CR>
omap <silent> <C-f> :TrinityToggleAll<CR>
imap <silent> <C-f> <Esc>:TrinityToggleAll<CR>
cmap <silent> <C-f> <C-u>:TrinityToggleAll<CR>
