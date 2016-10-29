set nocompatible
let $LANG='en'
set langmenu=en

" vim-plugの自動配置 {{{
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  " Run shell script if exist on custom select language

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))
"}}}

" 基本設定"{{{

" モード表示しない
set noshowmode

set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags
"set shell=zsh

" エンコード設定
set encoding=utf-8
scriptencoding utf-8

set ffs=unix,mac,dos

"}}}

" 基本的な設定"{{{
syntax enable
syntax on

nmap <C-s> :w<cr>
nnoremap <CR> A<CR><ESC>
nnoremap Y y$
nnoremap x "_x

set notitle
set hidden

set t_Co=256
set t_ut=
set t_u7=
set t_RV=

" ワイルドメニューを有効化
set wildmenu
set wildmode=list:longest,list:full
set wildchar=<tab>
set wildignore+=*.o,*.obj,*.rbc,*.dll,*.exe
set wildignore+=*.out,*.aux
set wildignore+=.git,.svn
set wildignore+=.DS_Store
set wildignore+=*.spl
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.sw?
set wildignore+=*.luac,*.jar,*.pyc,.class
set completeopt=menuone
set complete=.,w,b,u,t,i,k

" バックアップファイルを作らない
set nobackup
set nowb

" Undo
if has("persistent_undo")
  set undodir=$HOME/.vim/undodir
  set undofile
endif

" 候補高さ
set pumheight=10

" 最後の行を出来る限り表示
set display+=lastline

" 自動読込
set autoread

set showcmd

" スワップファイルを作らない
set noswapfile

" カレントディレクトリを自動的に変更しない
set noautochdir

" 10進
set nrformats-=octal

"矩形選択
set virtualedit=block

" <leader>キーをスペースに設定
let mapleader = "\<Space>"

filetype plugin indent on
set completeopt=menu,preview,longest

" 折り返さない
set nowrap

" 対応するカッコを表示
set showmatch
set matchpairs+=<:>,『:』,【:】,「:」,〈:〉,［:］,《:》,〔:〕,（:）,＜:>
set matchtime=1

" 他のアプリケーションの更新を自動的に読み込む
set autoread

" BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" OSのクリックボードを使用
set clipboard=unnamed

" ディレクトリの区切り文字にスラッシュを使用する
set shellslash

" 遅延描画を有効化
set lazyredraw
set ttyfast

" 変更履歴の保存数
set history=500

" ペースト時にレジスタを書き換えない
vnoremap <silent>p "0p

set list
set listchars+=tab:»-
set listchars+=nbsp:%
set listchars+=eol:¬
set listchars+=trail:-
set listchars+=extends:»
set listchars+=precedes:«
set showbreak=\ ↪

" }}}

" インクリメント、デクリメント"{{{
nnoremap + <C-a>
nnoremap - <C-x>
"}}}

" 検索設定"{{{

" 検索で大文字小文字を区別しない
" ただし､検索文字に双方が入力されている場合には区別する
set smartcase
set ignorecase

" 折り返し検索を行わない
set nowrapscan

" インクリメンタルサーチを有効化
set incsearch

" ハイライト検索を使用する
set hlsearch

" Escでハイライトクリア
nnoremap <silent><Esc> :noh<CR>

" ビジュアルモードでの検索
vnoremap * "zy:let @/ = @z<CR>n
"}}}

" カーソル移動設定"{{{

" カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

noremap  j  gj
noremap  k  gk
nnoremap gj j
nnoremap gk k

" インサートモード中のカーソル移動設定
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-D> <Del>

" 最後のカーソル位置を復元
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
"}}}

" バッファ関連の設定"{{{
map <silent><Left>  :bprevious<CR>
map <silent><Right> :bnext<CR>
map <silent><Up>    :ls<CR>
map <silent><Down>  :bd<CR>

" バッファを削除してStartifyを起動
command! BD call s:refreshBuf()
function! s:refreshBuf()
  " バッファ削除
  execute ":%bd"
  " Startify
  execute ":Startify"
endfunction
"}}}

" 画面分割関連の設定 "{{{

" Shift+Allowでウィンドウサイズ変更
nnoremap <S-Left>  5<C-w><
nnoremap <S-Right> 5<C-w>>
nnoremap <S-Up>    5<C-w>-
nnoremap <S-Down>  5<C-w>+

" ウィンドウ移動
nnoremap <silent><C-j> <C-W>j
nnoremap <silent><C-k> <C-W>k
nnoremap <silent><C-h> <C-W>h
nnoremap <silent><C-l> <C-W>l
"}}}

" スクロール関連設定 "{{{

" 縦スクロール
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" 余白
set scrolloff=3

" ページ移動時にカーソルを中央に表示
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" 横スクロール
nnoremap zl 30zl
nnoremap zh 30zh

"}}}

" コマンドラインモードのカーソル移動"{{{
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Delete>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>
"}}}

" タブ移動設定"{{{
nnoremap <Tab>      gt
nnoremap <S-Tab>    gT

" タブを開く/閉じる
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>

" タブ移動
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>] :tabn<cr>
let &guitabtooltip = "line one\nline two"
"}}}

" quickfix関連の設定"{{{
nnoremap [q :cprevious<CR>zz   " 前へ
nnoremap ]q :cnext<CR>zz       " 次へ
nnoremap [Q :<C-u>cfirst<CR>zz " 最初へ
nnoremap ]Q :<C-u>clast<CR>zz  " 最後へ
nnoremap qo :copen<cr>
nnoremap qc :cclose<cr>

" grep時にクイックフィックスウィンドウを自動的に開く
augroup grepopen
  autocmd!
  autocmd QuickfixCmdPost vimgrep cw
augroup END

"}}}

" 折りたたみ設定"{{{
if has('viminfo')
  set foldmethod=marker      " 折りたたみ処理
  set foldcolumn=3           " 折りたたみ表示用のスペース
  nnoremap <leader>zo zR<cr> " すべての折りたたみを開く
  nnoremap <leader>zc zM<cr> " すべての折りたたみを閉じる
end
" }}}

" GVim用設定"{{{
if has("gui_running")
  if has('win32')
    set guifont=Ricty_Diminished:h10:cSHIFTJIS
  elseif has('mac')
    " フォント設定
    set guifont=Roboto\ Mono\ for\ Powerline:h11
  else
    " TODO
  end

  " メニューを非表示
  set guioptions-=m

  " スクロールを非表示
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L

  " ツールバーを非表示
  set guioptions-=T
  set guioptions-=e
  set guioptions-=g
  set guioptions-=t
  set guitablabel=%M\ %t

  try
    set ambiwidth=auto
  catch
    set ambiwidth=single
  endtry
endif
"}}}

" 画面表示設定"{{{
" 行数表示
set number
" 相対行数表示
set relativenumber

" カーソルラインを表示する
set cursorline

" 常にステータスラインを表示する
set laststatus=2
set linespace=0

"}}}

" タブ幅、エンコードの設定"{{{
set expandtab
set smarttab

" タブ幅を設定する
set shiftwidth=2
set tabstop=2

set lbr
set tw=500

" オートインデントを設定する
set ai

" スマートインデントを設定する
set si
"}}}

" 使わないキーバインドの無効化"{{{
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q  <Nop>
nnoremap <C-z> <Nop>
nnoremap <C-q> <Nop>
"}}}

" vimrcの編集と保存後の自動読込"{{{
command! Evimrc e $MYVIMRC
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC
augroup END
"}}}

" 編集関連の設定
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" 空行を追加
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" フォントサイズ変更
command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')

" omnifunc <C-X><C-O> {{{
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType java          setlocal omnifunc=javacomplete#Complete
" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \ if &omnifunc == "" |
              \ setlocal omnifunc=syntaxcomplete#Complete |
              \ endif
endif
"}}}

" filetype {{{
autocmd FileType vim               setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
autocmd FileType php               setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
autocmd FileType ruby              setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
autocmd FileType php               setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
autocmd FileType python            setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
autocmd FileType html,haml         setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css     setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
"}}}

" *** Plugins Definition *** {{{
call plug#begin('~/.vim/plugged')
  " [file management with ext] "{{{
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
  Plug 'scrooloose/nerdcommenter'
  Plug 'ctrlpvim/ctrlp.vim',
  Plug 'kassio/ctrlp-bufline.vim', { 'on' : ['CtrlPBufLine'] }
  Plug 'tacahiroy/ctrlp-funky',    { 'on' : ['CtrlPFunky'] }
"}}}

  " [status line] "{{{
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bling/vim-bufferline'
  "}}}

  " [search] "{{{
  Plug 'haya14busa/incsearch.vim'
  Plug 'osyo-manga/vim-anzu'
  "}}}

  " [syntax/completion] "{{{
  Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/neosnippet'
  Plug 'kamiya555/neosnippet-snippets'
  "}}}

  " [disp util] "{{{
  Plug 'osyo-manga/vim-brightest'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'thinca/vim-zenspace'

  Plug 'adonis0147/prettyGuides', { 'on' : 'PrettyGuidesEnable' }
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'Yggdroot/indentLine'
  "}}}

  " [Editing] "{{{
  Plug 'tpope/vim-surround'              " 文字列を囲んだり
  Plug 'terryma/vim-expand-region'       " 選択範囲支援
  Plug 'terryma/vim-multiple-cursors'    " 複数のカーソル
  Plug 'bronson/vim-trailing-whitespace' " 行末の空白を削除
  Plug 'tpope/vim-endwise'               " 閉じタグを自動挿入
  Plug 'tpope/vim-sleuth'                " shiftwidthとexpandtabを自動調整
  Plug 'vim-scripts/DrawIt'              " 線ひく
  Plug 'tweekmonster/headlines.vim'      " ファイルの先頭を参照
  Plug 'thinca/vim-prettyprint'          " AsciiTable出力
  Plug 'Align'                           " 揃える
  Plug 'junegunn/vim-easy-align'         " 揃える
  Plug 'godlygeek/tabular'               " 揃える
  "}}}

  " [motion] "{{{
  Plug 'easymotion/vim-easymotion'
  Plug 'tmhedberg/matchit'
  "}}}

  " [splash] "{{{
  Plug 'mhinz/vim-startify'
  "}}}

  " [additional mode] "{{{
  Plug 'kana/vim-submode'
  "}}}

  " [ctags] "{{{
  "TODO
  "}}}

  " [VCS]"{{{
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  "}}}

  " [marks] "{{{
  Plug 'kshenoy/vim-signature'
  "}}}

  " [undo management] "{{{
  Plug 'mbbill/undotree'
  "}}}

  " [buffer management] "{{{
  Plug 'mhinz/vim-sayonara', { 'on' : 'Sayonara' }
  Plug 'MattesGroeger/vim-bookmarks'
  "}}}

  " [calendar] "{{{
  Plug 'itchyny/calendar.vim'
  "}}}

  " [colorscheme] "{{{
  Plug 'flazz/vim-colorschemes'
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'
  Plug 'ggalindezb/Vim-Colorscheme-Template'
  Plug 'vim-scripts/CycleColor'
  "}}}

  " grep
  Plug 'vim-scripts/grep.vim'

  " [language specific] "{{{

  " html, css
  Plug 'vim-scripts/HTML-AutoCloseTag'
  Plug 'othree/html5.vim'
  Plug 'mattn/emmet-vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'othree/csscomplete.vim'
  Plug 'gorodinskiy/vim-coloresque'

  " * javascript "{{{
  Plug '1995eaton/vim-better-javascript-completion'
  Plug 'othree/jspc.vim'
  Plug 'jelera/vim-javascript-syntax'
  "Plug 'othree/yajs.vim'
  Plug 'maksimr/vim-jsbeautify' " beatifier
  " Plug 'othree/yajs.vim', { 'for': 'javascript' }
  " Plug 'heavenshell/vim-jsdoc'
  " Plug 'itspriddle/vim-jquery'
  " Plug 'othree/javascript-libraries-syntax.vim'
  " Plug 'mxw/vim-jsx'
  "}}}

  " * haml
  Plug 'tpope/vim-haml'

  " * markdown
  Plug 'plasticboy/vim-markdown'
  let g:vim_markdown_folding_disabled = 1

  " * json
  Plug 'elzr/vim-json', {'for' : 'json'}

  "}}}

  " [uncategorized] "{{{
  Plug 'ervandew/supertab'
  Plug 'mopp/layoutplugin.vim', { 'on' : 'LayoutPlugin'}
  "}}}

call plug#end()

let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }
function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

"}}}

" *** Plugins Config ***"{{{

 let g:bufferline_echo = 0
 autocmd VimEnter *
   \ let &statusline='%{bufferline#refresh_status()}'
   \ .bufferline#get_status_string()

" colorscheme設定 {{{
set background=dark
try
  "colorscheme molokai
  "colorscheme base16-default-dark
  "colorscheme base16-tomorrow-night
  "colorscheme base16-monokai
  "colorscheme solarized
  colorscheme hybrid
  "colorscheme gruvbox
  "colorscheme base16-monokai
  "colorscheme base16-solarized-light
  "colorscheme janah
  "colorscheme jellybeans
  "colorscheme kalisi
  "colorscheme kellys
catch
  echo 'Does not exist specified colorscheme.'
endtry

" カーソルの色変更
if has('multi_byte_ime')
  highlight Cursor   guifg=NONE guibg=darkgray
  highlight CursorIM guifg=NONE guibg=red
endif

"}}}

" neocompleteの設定 "{{{
if s:plug.is_installed('neocomplete.vim')
  let g:acp_enableAtStartup = 1
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 1
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default'  : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme'   : $HOME.'/.gosh_completions'
      \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif

  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  " let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
end"}}}

" neosnippetの設定"{{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"}}}

" NERDTreeの設定 {{{
if s:plug.is_installed('nerdtree')
  map <leader>nn :NERDTreeToggle<cr>

  " 常にブックマークを表示
  let g:NERDTreeShowBookmarks=1

  " ディレクトリアイコン設定
  let g:NERDTreeDirArrows = 1
  let g:NERDTreeDirArrowExpandable = '▷'
  let g:NERDTreeDirArrowCollapsible = '▼'

  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  " ファイルタイプ毎の色設定
  call NERDTreeHighlightFile('py'     , 'yellow'  , 'NONE' , 'yellow'  , 'NONE')
  call NERDTreeHighlightFile('md'     , 'blue'    , 'NONE' , '#3366FF' , 'NONE')
  call NERDTreeHighlightFile('yml'    , 'yellow'  , 'NONE' , 'yellow'  , 'NONE')
  call NERDTreeHighlightFile('config' , 'yellow'  , 'NONE' , 'yellow'  , 'NONE')
  call NERDTreeHighlightFile('conf'   , 'yellow'  , 'NONE' , 'yellow'  , 'NONE')
  call NERDTreeHighlightFile('json'   , 'yellow'  , 'NONE' , 'yellow'  , 'NONE')
  call NERDTreeHighlightFile('html'   , 'yellow'  , 'NONE' , 'yellow'  , 'NONE')
  call NERDTreeHighlightFile('styl'   , 'cyan'    , 'NONE' , 'cyan'    , 'NONE')
  call NERDTreeHighlightFile('css'    , 'cyan'    , 'NONE' , 'cyan'    , 'NONE')
  call NERDTreeHighlightFile('rb'     , 'Red'     , 'NONE' , 'red'     , 'NONE')
  call NERDTreeHighlightFile('js'     , 'Red'     , 'NONE' , '#ffa500' , 'NONE')
  call NERDTreeHighlightFile('php'    , 'Magenta' , 'NONE' , '#ff00ff' , 'NONE')
  call NERDTreeHighlightFile('java'   , 'Red'     , 'NONE' , 'red'     , 'NONE')
end
"}}}

" vim-airline の設定 {{{
if s:plug.is_installed('vim-airline')
  " fancy表示を有効
  let g:Powerline_symbols = 'fancy'
  " パッチフォント有効
  let g:airline_powerline_fonts = 1
  " タブを表示
  let g:airline#extensions#tabline#enabled = 0
  " タブの表示タイプを設定
  let g:airline#extensions#tabline#tab_nr_type = 2

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep          = '▶'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◀'
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
  else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
  endif

endif
"}}}

" ctrlp の設定 {{{
if s:plug.is_installed('ctrlp.vim')
  " 動作パスモードを設定

  " キャッシュディレクトリ
  let g:ctrlp_use_caching = 1
  let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

  let g:ctrlp_working_path_mode = 'ra'
  if has('win32')
    " for Windows
    set wildignore+=*\\tmp\\*
  else
    " for MacOSX/Linux
    set wildignore+=*/tmp/*
  endif

  " キャッシュを終了時に削除しない
  let g:ctrlp_clear_cache_on_exit = 0

  " 遅延再描画
  let g:ctrlp_lazy_update = 2

  " ルートパスと認識させるためのファイル
  let g:ctrlp_root_markers = ['Gemfile', 'pom.xml', 'build.xml']

  " CtrlPのウィンドウ最大高さ
  let g:ctrlp_max_height = 20

  " 無視するディレクトリ、ファイル等
  let g:ctrlp_custom_ignore = {
    \ 'dir' : '\v\.?(git|svn|javadoc|tmp|node_modules)$',
    \ 'file': '\v(\.(exe|tmp|dat|class|prefs|jar|zip|war|pdf|xls[x]?|doc[x]?|ico|png|jpg|gif)|package-info.java|_jsp\.java)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

  nmap <leader>b :CtrlPBuffer<cr>
  nmap <leader>l :CtrlPBufLine<cr>
  nmap <leader>f :CtrlPFunky<cr>

end
"}}}

" EasyAlign設定"{{{
if s:plug.is_installed('vim-easy-align')
  vmap <Enter> <Plug>(EasyAlign)
end
"}}}

" EasyMotion設定 "{{{
if s:plug.is_installed('vim-easymotion')
  let g:EasyMotion_do_mapping = 0
  nmap s <Plug>(easymotion-s2)
end
"}}}

" incsearchの設定 "{{{
if s:plug.is_installed('incsearch.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  map n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
  map N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
end
"}}}

" vim-expand-regionの設定 "{{{
if s:plug.is_installed('vim-expand-region')
  vmap K <Plug>(expand_region_expand)
  vmap J <Plug>(expand_region_shrink)
end
"}}}

" emmetの設定"{{{
if s:plug.is_installed('emmet-vim')
  " leaderキーを変更(デフォルトの<C-Y>だとスクロール時に不審な挙動をする)
  let g:user_emmet_leader_key='<C-Z>'
end
"}}}

" rainbow parenthesesの設定 "{{{
if s:plug.is_installed('rainbow_parentheses.vim')
  au VimEnter * RainbowParenthesesToggle
  au Syntax   * RainbowParenthesesLoadRound
  au Syntax   * RainbowParenthesesLoadSquare
  au Syntax   * RainbowParenthesesLoadBraces

  let g:rbpt_colorpairs = [
    \   ['brown',       'RoyalBlue1' ],
    \   ['Darkblue',    'SeaGreen1'  ],
    \   ['darkgray',    'DarkOrchid1'],
    \   ['darkgreen',   'firebrick1' ],
    \   ['darkcyan',    'RoyalBlue1' ],
    \   ['darkred',     'SeaGreen1'  ],
    \   ['darkmagenta', 'DarkOrchid1'],
    \   ['brown',       'firebrick1' ],
    \   ['gray',        'RoyalBlue1' ],
    \   ['black',       'SeaGreen1'  ],
    \   ['darkmagenta', 'DarkOrchid1'],
    \   ['Darkblue',    'firebrick1' ],
    \   ['darkgreen',   'RoyalBlue1' ],
    \   ['darkcyan',    'SeaGreen1'  ],
    \   ['darkred',     'DarkOrchid1'],
    \   ['red',         'firebrick1' ],
    \ ]
end
"}}}

" zenspaceの設定"{{{
if s:plug.is_installed('vim-zenspace')
  let g:zenspace#default_mode = 'on'
end
"}}}

" vim-brightestの設定"{{{
if s:plug.is_installed('vim-brightest')
  let g:brightest#highlight = {
  \   "group" : "BrightestUnderline"
  \}
  "BrightestUnderline
  "BrightestUndercurl
  "BrightestReverse
  "BrightestCursorLineBg
end
"}}}

" supertabの設定"{{{
if s:plug.is_installed('supertab')
  let g:SuperTabDefaultCompletionType = "<c-n>"
end
"}}}

" undotreeの設定"{{{
if s:plug.is_installed('undotree')
  nmap u g-
  nmap <C-r> g+
  nnoremap <F5> :UndotreeToggle<cr>
  let g:undotree_WindowLayout=4
end
"}}}

" prettyGuidesの設定"{{{
if s:plug.is_installed('prettyGuides')
  let g:PrettyGuidesEnable   = 1
  let g:PrettyGuidesGuiColor = '#373b41'
end
"}}}

" vim-indent-guides の設定"{{{
if s:plug.is_installed('vim-indent-guides')
  let g:indent_guides_default_mapping = 0 " デフォルトのマッピングをOFF
  nmap <silent> <Leader>ig <Plug>IndentGuidesToggle

  let g:indent_guides_color_change_percent  = 1
  let g:indent_guides_enable_on_vim_startup = 0
  let g:indent_guides_exclude_filetypes = [
    \ 'help',
    \ 'nerdtree',
    \ 'startify'
    \ ]
end
"}}}

" indentLineの設定"{{{
if s:plug.is_installed('indentLine')
  let g:indentLine_enabled = 0
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '¦'
  let g:indentLine_faster = 1
end
"}}}

" startifyの設定"{{{
if s:plug.is_installed('vim-startify')
  " startifyの色設定
  highlight StartifyFile    guifg=white
  highlight StartifyPath    guifg=darkgray
  " highlight StartifySection guifg=white
  " highlight StartifyBracket guifg=gray
  " highlight StartifyFooter  guifg=orange
  " highlight StartifyHeader  guifg=orange
  " highlight StartifyNumber  guifg=gray
  " highlight StartifySlash   guifg=white
  " highlight StartifySpecial guifg=gray
end
"}}}

"vim-bookmarksの設定 "{{{
let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_sign = '♥'

" ブックマーク文字の色設定
highlight BookmarkSign           guifg=#FF7C6C
highlight BookmarkAnnotationSign guifg=#FF7C6C
highlight BookmarkLine           guifg=#FF7C6C
highlight BookmarkAnnotationLine guifg=#FF7C6C

function! BookmarkMapKeys()
  nmap mm  :BookmarkToggle<CR>
  nmap mi  :BookmarkAnnotate<CR>
  nmap mn  :BookmarkNext<CR>
  nmap mp  :BookmarkPrev<CR>
  nmap mo  :BookmarkShowAll<CR>
  nmap mc  :BookmarkClear<CR>
  nmap mx  :BookmarkClearAll<CR>
  nmap mkk :BookmarkMoveUp<CR>
  nmap mjj :BookmarkMoveDown<CR>
endfunction
function! BookmarkUnmapKeys()
  unmap mm
  unmap mi
  unmap mn
  unmap mp
  unmap mo
  unmap mc
  unmap mx
  unmap mkk
  unmap mjj
endfunction
autocmd BufEnter *           :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
autocmd BufEnter startify    :call BookmarkUnmapKeys()
"}}}

"}}}

"tabline "{{{

" 指定サイズに応じたUnicode文字列を返す
function! GetSplitChar(n)
  let unicodes = ['⁰', '¹', '²', '³', '⁴', '⁵', '⁶', '⁷', '⁸', '⁹']
  return a:n < len(unicodes) ? unicodes[a:n] : '⁺'
endfunction

function! Tabline()
  let s = ''
  let g:tabline_not_saving_c = get(g:, 'tabline_not_saving_c', '♡')
  let g:tabline_new_buf_c = get(g:, 'tabline_new_buf_c', 'No Name')

  for i in range(tabpagenr('$'))
    " Get tab infos
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let splits = tabpagewinnr(tab, '$')
    " Get buf infos
    let buflist = tabpagebuflist(tab)
    let bufspnr = buflist[winnr - 1]
    let bufname = bufname(bufspnr)

    " Set tab state
    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    " Set tab label
    let s .= ' ' . tab . (splits > 1 ? GetSplitChar(splits) : '') . ' '
    let s .= (bufname != '' ? fnamemodify(bufname, ':t') . ' ' : '[' . g:tabline_new_buf_c .'] ')

    " Set modified flag
    if getbufvar(bufspnr, '&mod') | let s .= g:tabline_not_saving_c | endif
  endfor

  " Finalize tabline
  let s .= '%#TabLineFill#' | return s
endfunction
set tabline=%!Tabline()

"let g:tabline_not_saving_c = '編集済み'
"let g:tabline_new_buf_c    = 'No Name'

hi TabLineSel  gui=bold,underline guifg=red guibg=yellow
hi TabLineFill guifg=white guibg=black
"}}}

