"shell
:set shell=/bin/sh

:set nocp "タブ補完用 see http://kaworu.jpn.org/kaworu/2008-05-22-1.php"
:set undofile "see http://www.soum.co.jp/misc/v/vim-no-susume/5.html
:set formatoptions-=ro "see http://blog.trippyboy.com/2013/%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89/vim-%E6%8C%BF%E5%85%A5%E3%83%A2%E3%83%BC%E3%83%89%E3%81%A7%E6%96%B0%E3%81%97%E3%81%84%E8%A1%8C%E3%81%AB%E5%8B%9D%E6%89%8B%E3%81%AB%E3%82%B3%E3%83%A1%E3%83%B3%E3%83%88%E3%82%A2%E3%82%A6%E3%83%88/"

:set undodir=~/undo

" Ruby
nnoremap <C-e> :!ruby %

" set pasteで自動インデントを解除してペーストできる。解除はset nopaste

" 自動的にコメントが挿入されるのを解除
" see http://d.hatena.ne.jp/hyuki/20140122/vim
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

"クリップボードの共有
set clipboard+=autoselect
set clipboard+=unnamed

" 補完の色設定 
" see http://altarf.net/computer/mac%E3%81%A7%E3%81%AE%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%83%AA%E3%83%B3%E3%82%B0%E7%9A%84%E3%81%AA%E4%BD%95%E3%81%8B/1890
hi Pmenu ctermbg=4
hi PmenuSel ctermbg=1
hi PMenuSbar ctermbg=4

"~/.vimrcに記述 範囲タブ
vmap <Tab> :s/^/\t/<CR>gv
vmap <S-Tab> :s/^\t//<CR>gv

"NeoBundle"
"NeoBundle 'Shougo/unite.vim'"

"前回終了したカーソル行に移動"
:autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"ソフトタブ有効 無効化はnoexpandtab"
:set expandtab

:syntax on "カラー表示"

"colorscheme my"

:set nu	"行番号の表示"
:set noautoindent"	"新しい行のインデントを現在行と同じにする"
:set tabstop=2 "tabが対応する空白の数"
:set shiftwidth=2 "改行時の自動インデント"

":set clipboard=unnamed" "クリップボードをWindowsと連携"
":set backup"
":set backupdir=/home/game/vimbackup"

:set ignorecase "検索時に大文字と小文字を区別しない"

":set incsearch" "インクリメンタルな検索が可能"
:set hlsearch "検索結果のハイライト表示"

:set wildmenu " コマンドライン補完を便利に"
:set showcmd " タイプ途中のコマンドを画面最下行に表示"

:set showmatch "対応する括弧の上にカーソルを表示"
:set matchtime=3 "対応する括弧を表示する時間（1/10s）"

:set encoding=utf-8 "デフォルトの文字コード"
":set encoding=euc-jp" "デフォルトの文字コード"
:set fileencoding=japan
":set fileencodings=cp932,eucjp-ms,utf8" ""
":set fileencodings=euc-jp,sjis,cp932,iso-2022-jp,utf-8" "文字コード自動判別"
:set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp "文字コード自動判別"
":set encoding=japan"
":set fileencodings=iso-2022-jp,utf-8,ucs-2,cp932,euc-jp"

:set laststatus=2 "ステータスラインを常に表示"

"全角スペースを視覚化"
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

if has('multi_byte_ime') || has('xim')
	"日本語入力ON時のカーソルの色を設定
	highlight CursorIM guibg=Red guifg=NONE
endif

"ステータスラインに文字コードと改行コードを表示"
:set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" C-jでコマンドモード "
imap <C-j> <esc>
" C-uで保存 "
imap <C-u> <esc>:w<CR>

" ファイルタイプごとに辞書ファイルを指定
"autocmd FileType vim :set dictionary+=~/.vim/dict/vim_functions.dict"
"辞書ファイルを使用する設定に変更
"set complete+=k"

map <silent> sy :call YanktmpYank()<CR> 
map <silent> sp :call YanktmpPaste_p()<CR> 
map <silent> sP :call YanktmpPaste_P()<CR> 

"↑でtabstop=2にしているので"
"set ts=4"
"同様に shiftwidth= インデント時に使用されるスペースの数"
"set sw=2
"softtabstop= 0でないなら、タブを入力時、その数値分だけ半角スペースを挿入する"
"↑でsettabstop=2にしているので"
"set sts=0"

"---------------------------
" Start Neobundle Settings.
"---------------------------
"see http://qiita.com/puriketu99/items/1c32d3f24cc2919203eb

" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundle 'Shougo/neobundle.vim'
" neocomplcache
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-rsense'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-rails'

" ほんにゃくこんにゃく
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/excitetranslate-vim'
" normal mode 'tr' transtlate
nnoremap <silent> rr :<C-u>ExciteTranslate<CR>

call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

"-------------------------
" NeoSnippet Config
"-------------------------
" see http://adragoona.hatenablog.com/entry/20130929/1380437722

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif "

" ------------------------
" Start Neocomplcache Settings
" ------------------------
" see http://adragoona.hatenablog.com/entry/20130929/1380437722

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
  \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-f>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"jjにESCをバインド"
inoremap <silent> jj <ESC>

" ------------------------
" End Neocomplcache Settings
" ------------------------

"------------------------------------
" vim-rails
"------------------------------------
" see https://gist.github.com/alpaca-tc/4521441
" see http://qiita.com/y_uuki/items/57e726312ffe47592867

""{{{
"有効化
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction
 
aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END
 
aug RailsDictSetting
  au!
aug END
"}}}
" End ------------------------------------------------"

" neo snippet rails config "
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/bundle/neosnippet-snippets/neosnippets/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/bundle/neosnippet-snippets/neosnippets/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/bundle/neosnippet-snippets/neosnippets/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/bundle/neosnippet-snippets/neosnippets/ruby.rails.route.snip
autocmd User Rails.spec*                 NeoSnippetSource ~/.vim/bundle/neosnippet-snippets/neosnippets/ruby.rspec.snip

" インサートモード時にバックスペースを使う
set backspace=indent,eol,start

nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
