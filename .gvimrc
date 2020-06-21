" 半角250文字で改行
set textwidth=500

" ツールバーを削除
set guioptions-=T

"メニュー（アイコン群）を削除
"set guioptions-=m

" フォント
set guifont=DejaVu\ Sans\ Mono\ 10
set guifontwide=M+\ 1p\ Medium\ 10

" 印刷用のエンコード
set printencoding=utf-8
set printmbcharset=JIS_X_1990
set printmbfont=r:&guifontwide

"""IMEモードでカーソルの色を替える
"""variate color of cursor {{{
if has('multi_byte_ime')
"  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif
""" }}}

""" colorcheme-solarized
syntax enable
let g:solarized_italic=0
set background=dark
colorscheme solarized

let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif
