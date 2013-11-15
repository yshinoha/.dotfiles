set nocompatible               " be iMproved
filetype off                   " required!

" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

" let Vundle manage Vundle
" required!
" Bundle 'gmarik/vundle'

"" My Bundles here:
""
"" original repos on github
" Bundle 'fholgado/minibufexpl.vim'
" Bundle 'pangloss/vim-javascript'
"Bundle 'scrooloose/syntastic'

" syntastic
let g:syntastic_mode_map = { 'mode': 'active',
 \ 'active_filetypes': [],
 \ 'passive_filetypes': ['html', 'javascript'] }
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checker = 'gjslint'

" BASIC
set autoindent
set nobackup
set cmdheight=1
set noerrorbells
set shiftwidth=2
set tabstop=2
set expandtab
set paste
" LIST
set list
set listchars=tab:>-,extends:<,trail:-,eol:<

" STATUS LINE
set statusline=
set statusline+=[*%n]\
set statusline+=%f
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'}
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%w
set statusline+=%=
set statusline+=\ %{strftime('%c')}
set statusline+=%4l,%2c
set statusline+=%3p%%
set statusline+=%<

set laststatus=2
" CHAR ENCODING
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
"set fileencodings=utf-8,iso-2022-jp,eucjp,ucs2le,ucs-2

set backspace=indent,eol,start
autocmd BufWritePre * :%s/\s\+$//ge
syntax on

set title
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags =0
autocmd FileType php :map <C-e> <ESC>:!php -l %<CR>
autocmd FileType php :map <C-r> <ESC>:!php %<CR>
set dictionary=dictionary/php.dict
au BufRead,BufNewFile *.html,*.tpl set filetype=php
au FileType php :set dictionary+=~/.vim/dictionary/PHP.dict
set complete+=k

"color Scheme
"set bg=dark
let g:zenburn_high_Contrast = 1
let g:liquidcarbon_high_contrast = 1
let g:molokai_original = 1
"let g:Powerline_cache_file = expand('$TMP/Powerline.cache')
set t_Co=256
"colorscheme molokai
colorscheme hybrid

"autocmd BufWriteCmd *.js :call CompileJS()
autocmd BufWritePre * :%s/\s\+$//ge
function CompileJS()
  if &modified
    write
    let fn = expand('%:p')
    let pn = expand('%:p:h')
    let fnm = expand('%:r.js')
    let cpa = '/usr/bin/compiler.jar'
    execute "! java -jar " . cpa . " --js=" . fn . " --js_output_file=" . pn . "/" . fnm . ".min.js"
  endif
endfunction
nmap <C-C><C-C> :call CompileJS()<CR>

if exists("current_compiler")
  finish
endif

let current_compiler = "closure"

if exists(":CompilerSet") != 2
  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=java\ -jar\ /usr/bin/compiler.jar\ --js_output_file=%<.min.js\ --js\ %
CompilerSet errorformat=%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#

set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'pangloss/vim-javascript'

"NeoBundle 'scrooloose/syntastic'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
"""vi上から、:NeoBundleInstallで.vimrcのNeoBundleで指定されているリポジトリのプラグインをインストールできる。
"""プラグインを削除したい場合は、vimrc上からNeoBundleの記述を消して:NeoBundleCleanでできる。

NeoBundle 'git://github.com/Lokaltog/powerline.git'
"NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'leafgarland/typescript-vim' " Typescript
NeoBundle 'taichouchou2/alpaca_powertabline'

""" jshint
"Bundle 'tpope/vim-pathogen'
"Bundle 'scrooloose/syntastic'
"call pathogen#infect()

" ステータスbar
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'



" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'landscape',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ },
 \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '[]' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '[]'._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction
