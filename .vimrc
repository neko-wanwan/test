

" --------*--------*--------*--------*--------*--------*--------*--------
" ファイルの文字コードを自動認識
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-bom,default,latin

set nocompatible
filetype off

set modeline

"set noignorecase
"set smartcase

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

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" 追加のプラグイン！
" NERDTree
NeoBundle 'scrooloose/nerdtree'
" autoclose
NeoBundle 'Townk/vim-autoclose'
" quickrun
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'karakaram/vim-quickrun-phpunit'

" python 関連
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'andviro/flake8-vim'
NeoBundle 'hynek/vim-python-pep8-indent'

NeoBundle 'tpope/vim-surround'


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
" NeoBundle 'taglist.vim'
NeoBundle 'wesleyche/Trinity'

" 変数一覧は表示させない Tlist の設定
let tlist_php_settings = 'php;c:class;d:constant;f:function'

"""NeoBundle 'scrooloose/syntastic'
"""let g:syntastic_check_on_open = 0 "ファイルオープン時にはチェックをしない
"""let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施

" Scala のSyntax
NeoBundle 'derekwyatt/vim-scala'

" NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'

" Git 用プラグイン
NeoBundle 'tpope/vim-fugitive'

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'GutenYe/json5.vim'

" カラーテーマ
NeoBundle 'altercation/vim-colors-solarized'

" erbインデント用
NeoBundle 'othree/html5.vim'
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

" rspec
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-dispatch'
let g:rspec_command = "Dispatch rspec {spec}"

call neobundle#end()

" Required:
filetype plugin indent on

"
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねる
NeoBundleCheck

" ----------------------------------------------
"  End Neobundle Settings.
"  ---------------------------------------------

set timeout timeoutlen=1000 ttimeoutlen=75

"エラー時、Quickfixが起動する
"""let g:syntastic_mode_map = {
"""  \ 'mode': 'active',
"""  \ 'active_filetypes': ['javascript', 'json'],
"""  \ 'passive_filetypes': ['html']
"""  \}
"""let g:syntastic_auto_loc_list = 1
"""let g:syntastic_javascript_checker = 'jshint'

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
autocmd FileType erb set ts=2 sw=2 st=0 expandtab
autocmd FileType scss set ts=2 sw=2 st=0 expandtab
autocmd FileType ruby set ts=2 sw=2 st=0 expandtab
autocmd FileType sh set ts=2 sw=2 st=0 expandtab
autocmd FileType xml set ts=2 sw=2 st=0 expandtab
autocmd FileType php set ts=2 sw=2 st=0 expandtab dictionary=~/.vim/dict/php.dict
autocmd FileType jade set ts=2 sw=2 st=0 expandtab
autocmd FileType json set ts=2 sw=2 st=0 expandtab
autocmd FileType yaml set ts=2 sw=2 st=0 expandtab
autocmd FileType slim set ts=2 sw=2 st=0 expandtab
autocmd FileType scala set ts=2 sw=2 st=0 expandtab dictionary=~/.vim/dict/scala.dict
autocmd QuickFixCmdPost make if len(getqflist()) !~= | copen | endif

syntax on

"-------------------------------------------------
"scala
augroup filetypedetect
" autocmd! BufNewFile,BufRead *.scala setfiletype scala
" autocmd! BufNewFile,BufRead *.sbt setfiletype scala
augroup END
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

"-------------------------------------------------
"" neocomplcache設定
"-------------------------------------------------
""辞書ファイル
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php
autocmd BufRead *.scala\|*.sbt :set dictionary=~/.vim/dict/scala.dict filetype=scala
au BufRead,BufNewFile *.scala set tags+=~/work/scalatest/scala/tags
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

colorscheme molokai

" indent
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
" ガイドの幅
let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

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
set listchars=tab:>-,trail:_,extends:>,precedes:<,nbsp:%
"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"""set listchars=tab:≫\ ,trail:-,extends:≫,precedes:≪,nbsp:%

" タブ切り替え
nnoremap <C-n> gt
nnoremap <C-p> gT

" NERDTree
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
	autocmd VimEnter * NERDTree ./
endif

" S + ? でset ?, no? を行う
nnoremap [set] <Nop>
nmap ,s [set]
" set paste  貼り付け
nnoremap <silent> [set]p :set paste<CR>
" set nopast
nnoremap <silent> [set]P :set nopaste<CR>
"" set number  行数表示
nnoremap <silent> [set]n :set number<CR>
" set nonumber
nnoremap <silent> [set]N :set nonumber<CR>

" NERDTree をCtrl-e で切り替えられるように
nmap <silent> <C-t> :NERDTreeToggle<CR>
vmap <silent> <C-t> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-t> :NERDTreeToggle<CR>
imap <silent> <C-t> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-t> <C-u>:NERDTreeToggle<CR>
" Tlist をCtrl-k で切り替えられるように
"nmap <silent> <C-k> :Tlist<CR>
"vmap <silent> <C-k> <Esc>:Tlist<CR>
"omap <silent> <C-k> :Tlist<CR>
"imap <silent> <C-k> <Esc>:Tlist<CR>
"cmap <silent> <C-k> <C-u>:Tlist<CR>
" Trinity をCtrl-fで切り替えられるように
"nmap <silent> <C-f> :TrinityToggleAll<CR>
"vmap <silent> <C-f> <Esc>:TrinityToggleAll<CR>
"omap <silent> <C-f> :TrinityToggleAll<CR>
"imap <silent> <C-f> <Esc>:TrinityToggleAll<CR>
"cmap <silent> <C-f> <C-u>:TrinityToggleAll<CR>

let g:neosnippet#snippets_directory='~/.vim/snippets'

inoremap <expr><C-e> neocomplcache#cancel_popup()
"""inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"

"set background=dark
try
"  colorscheme solarized
catch
endtry

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,ug  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,ucg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,ur  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"let g:unite_source_history_yank_enable = 1
"try
"  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
"  call unite#filters#matcher_default#use(['matcher_fuzzy'])
"catch
"endtry
"" search a file in the filetree
"nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
"" reset not it is <C-l> normally
":nnoremap <space>r <Plug>(unite_restart)
"

nmap <silent> ,rf :call RunCurrentSpecFile()<CR>
nmap <silent> ,rn :call RunNearestSpec()<CR>
nmap <silent> ,rl :call RunLastSpec()<CR>
nmap <silent> ,ra :call RunAllSpecs()<CR>

let mapleader = "\<Space>"
let g:jedi#auto_initialization = 1
let g:jedi#rename_command = "<leader>R"
let g:jedi#popup_on_dot = 1
autocmd FileType python let b:did_ftplugin = 1

