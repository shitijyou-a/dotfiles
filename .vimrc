""" Defines {{{
cd $HOME

"let $MyDoc  ='~/Documents'
"let $PRJ    =$MyDoc.'/Projects'
"let $CC     =$MyDoc.'/Creation-Contents'
"let $Writing=$CC.'/Writing'
let $DOWN='/media/kiimasanobu/volume1TB/Downloaded'

"""let $BJAM   =$BOOST_ROOT.'/bjam.exe'
""""let $CMAKE  ="cmake -G \"MinGW Makefiles\" -DCMAKE_C_COMPILER=mingw32-gcc.exe -DCMAKE_CXX_COMPILER=mingw32-g++.exe -DCMAKE_MAKE_PROGRAM=mingw32-make.exe"
"""let $cmake  ="cmake -G \"MinGW Makefiles\" -DCMAKE_C_COMPILER=gcc.exe -DCMAKE_CXX_COMPILER=g++.exe -DCMAKE_MAKE_PROGRAM=mingw32-make.exe"
""" }}}

"""読み込み可能エンコーディング
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

set expandtab
set tabstop=4           """ハードタブ1つ==4つのスペース
set softtabstop=4       """ソフトタブ1つ==4つのスペース
set shiftwidth=4        """インデント幅
set clipboard=unnamedplus   """ヤンク先はクリップボードにする

if &t_Co > 1
    syntax enable
endif

"""gvimで起動するときはウィンドウを最大化して起動
""" linux mint ver.では使用できないのでコメントアウト
"au GUIEnter * simalt ~x

"""コンパイラはgcc
set makeprg=make
autocmd filetype cpp set makeprg=make

"" F1キーをEscにマップ
map <F1> <Esc>
imap <F1> <Esc>

"" F12キーをBackspaceにマップ
map <F12> <BS>
imap <F12> <BS>

"" マウス中ボタンを無視
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

""" ~(バックアップ)ファイルを別の場所に作る
set backup
set backupdir=~/.vim/backup

""" <>を対応するカッコとして登録
set matchpairs=(:),{:},[:],<:>

""" Vundle {{{
"required!
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugin list
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'Shougo/echodoc.vim'
"Plugin 'bronson/vim-trailing-whitespace' """ FixWhitespaceで行末空白を消す
"Plugin 'kannokanno/previm'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'osyo-manga/vim-marching'
"Plugin 'osyo-manga/vim-reunions'
"Plugin 'thinca/vim-ref'
"Plugin 'project.tar.gz'
"Plugin 'renamer.vim'    """ 一括rename
Plugin 'LeafCage/foldCC'    """ foldingの改善
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'christoomey/vim-titlecase'
Plugin 'hdima/python-syntax' """ Enhanced version of the python syntax highlighting script
Plugin 'hrp/EnhancedCommentify'
Plugin 'leafgarland/typescript-vim'
Plugin 'lervag/vimtex'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree' """ NERDTreeToggleでフォルダをツリー表示
Plugin 'thinca/vim-quickrun'
Plugin 'tpope/vim-surround'

"color-schemes
Plugin 'altercation/vim-colors-solarized'
"Plugin 'jpo/vim-railscasts-theme'
"Plugin 'nanotech/jellybeans.vim'
"Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/Wombat'
"Plugin 'vim-scripts/rdark'
"Plugin 'w0ng/vim-hybrid'

"required!
call vundle#end()            " required
filetype plugin indent on    " required
"}}}

""" カッコやクオートなどを入力した際に左に自動で移動します {{{
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
inoremap $$ $$<Left>
inoremap \[\] \[\]<Left><Left>
inoremap \{\} \{\}<Left><Left>
"}}}

""" CdCurrent {{{
command! -narg=0 CdCur cd %:p:h
""" }}}

""" vimshell用マッピング {{{
function! VSP()
    CdCur
    VimShellPop
endfunction

""" VimShell
"nnoremap <silent> vs :call VS()<CR> 
""" VimShellCreate
"nnoremap <silent> vsc :call VSC()<CR> 
""" VimShellPop
nnoremap <silent> vp :call VSP()<CR>
"""}}}

""" unite {{{
""" key mapping is not needed now...
if 0

" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>u [unite]

" unite.vim keymap
let g:unite_source_history_yank_enable =1
nnoremap <silent> [unite]u :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
" vinarise
let g:vinarise_enable_auto_detect = 1
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_max_candidates = 200
let g:unite_source_grep_recursive_opt = ''
" unite-grepの便利キーマップ
vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
endif
""" }}}

""" neocomplete {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif

"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

"""}}}

""" for neosnippet {{{ 
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
""" }}}

""" about folding {{{
set foldtext=FoldCCtext()
set foldmethod=marker
let g:foldCCtext_enable_autofdc_adjuster = 2
noremap zO zR
noremap zC zM
""" }}}

""" 全角スペースの表示 {{{
""""""""""""""""""""""""""""""
let g:zenkaku_space_visualizing_is_enable=1

function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax') && g:zenkaku_space_visualizing_is_enable
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
"""""""""""""""""""""""""""""" }}}

""" EnhancedCommentify {{{ 
    """ disable key binds of EnhancedCommentify in insert mode.
    let g:EnhCommentifyBindInInsert = 'No'
""" }}}

""" vim-indent-guides {{{
    let g:indent_guides_auto_colors = 1
""" }}}

""" vimfiler {{{
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default=0
""""}}}

""" vimfilerをファイルエクスプローラとして {{{
command! Project VimFiler $PRJ -split -simple -winwidth=35 -no-quit
""" }}}

""" for Python3 Quickrun {{{
au BufRead,BufNewFile,BufReadPre *.py   set filetype=python3
""" }}}

""" for C++ Quickrun {{{
let g:quickrun_config = {
\"cpp/g++" : {
\       "cmdopt" : "-std=c++11"
\},
\}
""" }}}

""" for latex {{{
let g:vimtex_enabled = 1
let g:vimtex_latexmk_enabled = 1
let g:vimtex_compiler_latexmk = {
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'continuous' : 1,
            \ 'options' : [
            \   '-pdfdvi',
            \   '-bibtex',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'xreader'

" fold
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_automatic = 1
let g:vimtex_fold_envs = 0

" 自動コンパイル
let g:vimtex_vimtexmk_background = 1
" コンパイル終了後のエラー通知オフ
let g:vimtex_vimtexmk_callback = 1

let g:vimtex_toc_split_pos = "topleft"
let g:vimtex_toc_width = 10

""" folding
let  g:vimtex_fold_types = {
       \ 'preamble' : {'enabled' : 1},
       \ 'envs' : {
       \   'blacklist' : ['Def', 'Thm', 'Prop', 'Lemma', 'Claim'],
       \ },
       \}

"""
let g:tex_flavor = "latex"
let g:tex_conceal = ''

"autocmd FileType tex,latex,plaintex NeoCompleteLock
autocmd FileType tex,latex,plaintex let g:neocomplete#sources.tex=['neosnippet','dictionary', 'tag']
autocmd FileType tex,latex,plaintex let g:neocomplete#sources.latex=['neosnippet','dictionary', 'tag']

""" }}}

""" for window splitting{{{
nnoremap w<Up>      <C-w>j
nnoremap w<Down>    <C-w>k
nnoremap w<Right>   <C-w>l
nnoremap w<Left>    <C-w>h

nnoremap W<Up>      <C-w>J
nnoremap W<Down>    <C-w>K
nnoremap W<Right>   <C-w>L
nnoremap W<Left>    <C-w>H

nnoremap ws :split<CR>
nnoremap wv :vsplit<CR>
""" }}}

""" map W write -> update {{{
command! W update
""" }}}

""" ChangeKutouten {{{
function! SubstMaruTenToCommaPeriod()
  execute ":%s/。/．/g"
  execute ":%s/、/，/g"
endfunction

function! SubstCommaPeriodToMaruTen()
  execute ":%s/．/。/g"
  execute ":%s/，/、/g"
endfunction

command! SwitchMaruTenToCommaPeriod call SubstMaruTenToCommaPeriod()
command! SwitchCommaPeriodToMaruTen call SubstCommaPeriodToMaruTen()
""" }}}
