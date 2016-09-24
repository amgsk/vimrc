" システム設定"{{{
set nocompatible
set shell=zsh

" 言語設定
let $LANG='en'
set langmenu=en

" エンコード設定
setlocal encoding=utf-8
set encoding=utf-8
scriptencoding utf-8

set ffs=unix,mac,dos
"}}}

" 基本的な設定"{{{
syntax enable
syntax on

set hidden

set t_Co=256
set t_ut=
set t_u7=
set t_RV=

" ワイルドメニューを有効化
set wildmenu

" バックアップファイルを作らない
set nobackup
set nowb

" スワップファイルを作らない
set noswapfile

" カレントディレクトリを自動的に変更しない
set noautochdir

" <leader>キーをスペースに設定
let mapleader = "\<Space>"

" プラグイン有効化
filetype plugin on

" インデント有効化
filetype indent on

" 折り返さない
set nowrap

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

" 変更履歴の保存数
set history=500

" ペースト時にレジスタを書き換えない
vnoremap <silent>p "0p

" }}}

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

" ハイライトを消す
nnoremap <silent><ESC> :nohl<CR>

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

" ウィンドウ移動設定"{{{
nnoremap <Down>  <C-W>j
nnoremap <Up>    <C-W>k
nnoremap <Left>  <C-W>h
nnoremap <Right> <C-W>l

nnoremap <C-j>   <C-W>j
nnoremap <C-k>   <C-W>k
nnoremap <C-h>   <C-W>h
nnoremap <C-l>   <C-W>l
"}}}

" スクロール、ページ移動設定"{{{
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" スクロール次の画面上下の余白を設定
set scrolloff=3

" ページ移動時にカーソルを中央に表示
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
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
"}}}

" quickfix関連の設定"{{{
nnoremap [q :cprevious<CR>zz   " 前へ
nnoremap ]q :cnext<CR>zz       " 次へ
nnoremap [Q :<C-u>cfirst<CR>zz " 最初へ
nnoremap ]Q :<C-u>clast<CR>zz  " 最後へ

" grep時にクイックフィックスウィンドウを自動的に開く
augroup grepopen
  autocmd!
  autocmd QuickfixCmdPost vimgrep cw
augroup END

"}}}

" 折りたたみ設定"{{{
set foldmethod=marker      " 折りたたみ処理
set foldcolumn=3           " 折りたたみ表示用のスペース
nnoremap <leader>zo zR<cr> " すべての折りたたみを開く
nnoremap <leader>zc zM<cr> " すべての折りたたみを閉じる
" }}}

" GVim用設定"{{{
if has("gui_running")
  " フォント設定
  set guifont=Roboto\ Mono\ for\ Powerline:h11

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
  set guitablabel=%M\ %t

  set ambiwidth=single
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

" Plugins {{{
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
  Plug 'scrooloose/nerdcommenter'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'haya14busa/incsearch.vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'drmikehenry/vim-fontsize'
  Plug 'terryma/vim-expand-region'
  Plug 'adonis0147/prettyGuides'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'mhinz/vim-startify'
  Plug 'kana/vim-submode'
  Plug 'tpope/vim-surround'
  Plug 'easymotion/vim-easymotion'
  Plug 'junegunn/vim-easy-align'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'mhinz/vim-signify'
  Plug 'kshenoy/vim-signature'
  Plug 'thinca/vim-zenspace'
call plug#end()

let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }
function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

" colorscheme {{{
if s:plug.is_installed('vim-colorschemes')
  set background=dark
  try
    "colorscheme molokai
    "colorscheme base16-default-dark
    "colorscheme base16-tomorrow-night
    "colorscheme base16-monokai
    "colorscheme solarized
    colorscheme hybrid
  catch
    echo 'Does not exist specified colorscheme.'
  endtry
end
"}}}

" neocompleteの設定 "{{{
if s:plug.is_installed('neocomplete.vim')
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
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
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
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

  " オープン/クローズディレクトリのアイコンを設定
  let g:NERDTreeDirArrows = 1
  let g:NERDTreeDirArrowExpandable = '▷'
  let g:NERDTreeDirArrowCollapsible = '▼'

  " ファイルタイプによってNERDTreeの色を変更するヘルパーメソッド
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  " ファイルタイプ毎の色設定
  call NERDTreeHighlightFile('py'     , 'yellow'  , 'none' , 'yellow'  , '#151515')
  call NERDTreeHighlightFile('md'     , 'blue'    , 'none' , '#3366FF' , '#151515')
  call NERDTreeHighlightFile('yml'    , 'yellow'  , 'none' , 'yellow'  , '#151515')
  call NERDTreeHighlightFile('config' , 'yellow'  , 'none' , 'yellow'  , '#151515')
  call NERDTreeHighlightFile('conf'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
  call NERDTreeHighlightFile('json'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
  call NERDTreeHighlightFile('html'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
  call NERDTreeHighlightFile('styl'   , 'cyan'    , 'none' , 'cyan'    , '#151515')
  call NERDTreeHighlightFile('css'    , 'cyan'    , 'none' , 'cyan'    , '#151515')
  call NERDTreeHighlightFile('rb'     , 'Red'     , 'none' , 'red'     , '#151515')
  call NERDTreeHighlightFile('js'     , 'Red'     , 'none' , '#ffa500' , '#151515')
  call NERDTreeHighlightFile('php'    , 'Magenta' , 'none' , '#ff00ff' , '#151515')
end
"}}}

" vim-airline の設定 {{{
if s:plug.is_installed('vim-airline')
  " fancy表示を有効
  let g:Powerline_symbols = 'fancy'
  " パッチフォント有効
  let g:airline_powerline_fonts = 1
  " タブを表示
  let g:airline#extensions#tabline#enabled = 1
  " タブの表示タイプを設定
  let g:airline#extensions#tabline#tab_nr_type = 2
endif
"}}}

" ctrlp の設定 {{{
if s:plug.is_installed('ctrlp.vim')
  " 動作パスモードを設定
  let g:ctrlp_working_path_mode = 'ra'

  " for MacOSX/Linux
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*
  " for Windows
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\vendor\\*

  " キャッシュディレクトリ
  let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

  " キャッシュを終了時に削除しない
  let g:ctrlp_clear_cache_on_exit = 0

  " 遅延再描画
  let g:ctrlp_lazy_update = 2

  " ルートパスと認識させるためのファイル
  let g:ctrlp_root_markers = ['Gemfile', 'pom.xml', 'build.xml']

  " CtrlPのウィンドウ最大高さ
  let g:ctrlp_max_height = 20

  " 無視するディレクトリ
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
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
end
"}}}

" vim-expand-regionの設定 "{{{
if s:plug.is_installed('vim-expand_region')
  vmap K <Plug>(expand_region_expand)
  vmap J <Plug>(expand_region_shrink)
end
"}}}

" rainbow parenthesesの設定 "{{{
if s:plug.is_installed('rainbow_parentheses.vim')
  "au VimEnter * RainbowParenthesesToggle
  "au Syntax * RainbowParenthesesLoadRound
  "au Syntax * RainbowParenthesesLoadSquare
  "au Syntax * RainbowParenthesesLoadBraces
end
"}}}

" zenspaceの設定"{{{
if s:plug.is_installed('vim-zenspace')
  let g:zenspace#default_mode = 'on'
end
"}}}

"}}}

