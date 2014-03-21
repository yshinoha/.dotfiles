" general settings
se nu
se sw=4
se ts=4
se sc
se si
se hls
se is
se title
se et
se nf-=octal
se ruler
se sm
se bs=2
se cul
se sta
se fdm=marker

" my autocmds
if has("autocmd")
    " save cursor position
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal g`\"" |
        \ endif
endif


" keymap
if &diff
    map <Leader>1 :diffget LOCAL<CR>
    map <Leader>2 :diffget BASE<CR>
    map <Leader>3 :diffget REMOTE<CR>
endif


" NeoBundle
" $ mkdir -p ~/.vim/bundle
" $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" run :NeobundleInstall on vim
se nocp                       " Be iMproved
filetype off                  " Required!

if has('vim_starting')
    se runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim' " Let NeoBundle manage NeoBundle

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'


" encoding
"source $VIM/encode.vim


" syntax
syntax on
NeoBundle 'derekwyatt/vim-scala'
au BufNewFile,BufReadPost *.scala setl filetype=scala
NeoBundle 'derekwyatt/vim-sbt'
au BufNewFile,BufReadPost *.sbt setl filetype=sbt

" colorscheme
NeoBundle 'desert256.vim'
NeoBundle 'molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'akiomik/itermcolors-vim'
set t_Co=256
colorscheme molokai
"set background=dark
"colorscheme solarized

" powerline
NeoBundle 'Lokaltog/vim-powerline'
set guifont=Inconsolata\ for\ Powerline
let g:Powerline_symbols = 'fancy'
se ls=2
se nosmd

" SQLUtilities
" run :SQLUFormatter on vim??
NeoBundle 'Align'
NeoBundle 'SQLUtilities'

" Vimshell
NeoBundle 'Shougo/vimshell'
command! Scala :VimShellInteractive scala
command! Sbt :VimShellInteractive sbt

" git-gutter
NeoBundle 'akiomik/git-gutter-vim'

" fugitive
NeoBundle 'tpope/vim-fugitive'

" minibufexplorer
NeoBundle 'minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
nmap <C-n> :MBEbn<CR>
nmap <C-p> :MBEbp<CR>
"nmap <C-d> :bd<CR>

" nerdtree
NeoBundle 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=0
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" vimfiler
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1

" coffee
NeoBundle 'kchmck/vim-coffee-script'
au BufNewFile,BufReadPost *.coffee setl filetype=coffee
au BufNewFile,BufReadPost *.coffee setl sw=2 et

" puppet
NeoBundle 'rodjek/vim-puppet'
au BufNewFile,BufReadPost *.pp setl filetype=puppet

" syntastic
NeoBundle 'scrooloose/syntastic'
let g:syntastic_java_javac_options="-J-Dfile.encoding=UTF-8 -Xlint"

" comment
NeoBundle 'tomtom/tcomment_vim'

" ctrlp
NeoBundle 'kien/ctrlp.vim'

" indent
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=0
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" tagbar
NeoBundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
if executable('coffeetags')
    let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
    \ }
endif

" scss
NeoBundle 'cakebaker/scss-syntax.vim'
au BufNewFile,BufReadPost *.scss setl filetype=scss

" surround
NeoBundle 'tpope/vim-surround'

" easymotion
NeoBundle 'Lokaltog/vim-easymotion'

" multiple cursor
NeoBundle 'terryma/vim-multiple-cursors'

" Javascript
" NeoBundle 'pangloss/vim-javascript'

" encoding
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

filetype plugin indent on
NeoBundleCheck

"===============================
"add origin
set paste

"scala 
NeoBundle 'derekwyatt/vim-scala'

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif



"タブ文字を^_で表示
set list
set lcs=tab:^_
"ステータスラインを常に表示
set laststatus=2
"ステータスラインに表示する項目の設定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P


set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
