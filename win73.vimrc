" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" An example for a Japanese version vimrc file.
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 28-May-2017.
" Maintainer:  MURAOKA Taro <koron.kaoriya@gmail.com>
"
" 解説:
" このファイルにはVimの起動時に必ず設定される、編集時の挙動に関する設定が書
" かれています。GUIに関する設定はgvimrcに書かかれています。
"
" 個人用設定は_vimrcというファイルを作成しそこで行ないます。_vimrcはこのファ
" イルの後に読込まれるため、ここに書かれた内容を上書きして設定することが出来
" ます。_vimrcは$HOMEまたは$VIMに置いておく必要があります。$HOMEは$VIMよりも
" 優先され、$HOMEでみつかった場合$VIMは読込まれません。
"
" 管理者向けに本設定ファイルを直接書き換えずに済ませることを目的として、サイ
" トローカルな設定を別ファイルで行なえるように配慮してあります。Vim起動時に
" サイトローカルな設定ファイル($VIM/vimrc_local.vim)が存在するならば、本設定
" ファイルの主要部分が読み込まれる前に自動的に読み込みます。
"
" 読み込み後、変数g:vimrc_local_finishが非0の値に設定されていた場合には本設
" 定ファイルに書かれた内容は一切実行されません。デフォルト動作を全て差し替え
" たい場合に利用して下さい。
"
" 参考:
"   :help vimrc
"   :echo $HOME
"   :echo $VIM
"   :version

"---------------------------------------------------------------------------
" サイトローカルな設定($VIM/vimrc_local.vim)があれば読み込む。読み込んだ後に
" 変数g:vimrc_local_finishに非0な値が設定されていた場合には、それ以上の設定
" ファイルの読込を中止する。
if 1 && filereadable($VIM . '/vimrc_local.vim')
  unlet! g:vimrc_local_finish
  source $VIM/vimrc_local.vim
  if exists('g:vimrc_local_finish') && g:vimrc_local_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" ユーザ優先設定($HOME/.vimrc_first.vim)があれば読み込む。読み込んだ後に変数
" g:vimrc_first_finishに非0な値が設定されていた場合には、それ以上の設定ファ
" イルの読込を中止する。
if 1 && exists('$HOME') && filereadable($HOME . '/.vimrc_first.vim')
  unlet! g:vimrc_first_finish
  source $HOME/.vimrc_first.vim
  if exists('g:vimrc_first_finish') && g:vimrc_first_finish != 0
    finish
  endif
endif

" plugins下のディレクトリをruntimepathへ追加する。
for s:path in split(glob($VIM.'/plugins/*'), '\n')
  if s:path !~# '\~$' && isdirectory(s:path)
    let &runtimepath = &runtimepath.','.s:path
  end
endfor
if has('win32')
  unlet s:path
endif
"---------------------------------------------------------------------------
" 日本語対応のための設定:
"
" ファイルを読込む時にトライする文字エンコードの順序を確定する。漢字コード自
" 動判別機能を利用する場合には別途iconv.dllが必要。iconv.dllについては
" README_w32j.txtを参照。ユーティリティスクリプトを読み込むことで設定される。

if has('win32') || has('win64')
  source $VIMRUNTIME/../plugins/kaoriya/encode_japan.vim
else
"  source $HOME/plugins/kaoriya/encode_japan.vim
endif 
" メッセージを日本語にする (Windowsでは自動的に判断・設定されている)
if !(has('win32') || has('win64') || has('mac')) && has('multi_lang')
  if !exists('$LANG') || $LANG.'X' ==# 'X'
    if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
      language ctype ja_JP.eucJP
    endif
    if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
      language messages ja_JP.eucJP
    endif
  endif
endif
" MacOS Xメニューの日本語化 (メニュー表示前に行なう必要がある)
if has('mac')
  set langmenu=japanese
endif
" 日本語入力用のkeymapの設定例 (コメントアウト)
if has('keymap')
  " ローマ字仮名のkeymap
  "silent! set keymap=japanese
  "set iminsert=0 imsearch=0
endif

"---------------------------------------------------------------------------
" メニューファイルが存在しない場合は予め'guioptions'を調整しておく
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

"---------------------------------------------------------------------------
" Bram氏の提供する設定例をインクルード (別ファイル:vimrc_example.vim)。これ
" 以前にg:no_vimrc_exampleに非0な値を設定しておけばインクルードはしない。
if 1 && (!exists('g:no_vimrc_example') || g:no_vimrc_example == 0)
  if &guioptions !~# "M"
    " vimrc_example.vimを読み込む時はguioptionsにMフラグをつけて、syntax on
    " やfiletype plugin onが引き起こすmenu.vimの読み込みを避ける。こうしない
    " とencに対応するメニューファイルが読み込まれてしまい、これの後で読み込
    " まれる.vimrcでencが設定された場合にその設定が反映されずメニューが文字
    " 化けてしまう。
    set guioptions+=M
    source $VIMRUNTIME/vimrc_example.vim
    set guioptions-=M
  else
    source $VIMRUNTIME/vimrc_example.vim
  endif
endif

"---------------------------------------------------------------------------
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
"set nobackup
"---------------------------------------------------------------------------
" ファイル名に大文字小文字の区別がないシステム用の設定:
"   (例: DOS/Windows/MacOS)
"

"---------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
let term=""
if has('unix') && !has('gui_running')
  let s:uname = system('uname')
  if s:uname =~? "linux"
    set term=builtin_linux
  elseif s:uname =~? "freebsd"
    set term=builtin_cons25
  elseif s:uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet s:uname
endif

"---------------------------------------------------------------------------
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

" 非GUI日本語コンソールを使っている場合の設定
if !has('gui_running') && &encoding != 'cp932' && (term == 'win32' || term == 'win64')
  set termencoding=cp932
endif

"---------------------------------------------------------------------------
" プラットホーム依存の特別な設定

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif

"---------------------------------------------------------------------------
" KaoriYaでバンドルしているプラグインのための設定

" autofmt: 日本語文章のフォーマット(折り返し)プラグイン.
set formatexpr=autofmt#japanese#formatexpr()

" vimdoc-ja: 日本語ヘルプを無効化する.
if has('win32') && kaoriya#switch#enabled('disable-vimdoc-ja')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "vimdoc-ja"'), ',')
endif

" Copyright (C) 2009-2012 KaoriYa/MURAOKA Taro

"---------------------------------------------------------------------------
"takami


filetype on
filetype plugin indent on

"検索系設定
set incsearch		" do incremental searching
set wrapscan " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set ignorecase " 検索時に大文字小文字を無視 (noignorecase:無視しない)
set smartcase " 大文字小文字の両方が含まれている場合は大文字小文字を区別

"edit系設定
set tabstop=2 shiftwidth=2 softtabstop=2 "インデント幅を2文字に
set backspace=2 " バックスペースでインデントや改行を削除できるようにする
set expandtab " タブをスペースに展開しない (expandtab:展開する)

set wildmenu " コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set formatoptions+=mM " テキスト挿入中の自動折り返しを日本語に対応させる
let format_allow_over_tw = 1	" ぶら下り可能幅  日本語整形スクリプト(by. 西岡拓洋さん)用の設定
set autoread "" 外部のエディタで編集中のファイルが変更されたら自動で読み直す
"" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
"set scrolljump=5 "" Jump 5 lines when running out of the screen
"set scrolloff=3 "" Indicate jump out of the screen when 3 lines before end of the screen
set autochdir "pwd自動変更
au QuickfixCmdPost make,grep,grepadd,vimgrep copen	"vimgrepやmake後にQuickFixウィンドウを自動的に開く[vim]

"表示系設定
set number
set ruler		" show the cursor position all the time
set showmatch " 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set title " タイトルを表示
"set list " タブや改行を表示 (list:表示) "set nolist
set wrap " 長い行を折り返して表示 (nowrap:折り返さない)
"set listchars=tab:>-,extends:<,trail:-,eol:< " どの文字でタブや改行を表示するかを設定
"
set history=99		" keep 50 lines of command line history
set cmdheight=1 " コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set showcmd		" display incomplete commands
"
set laststatus=2 " 常にステータス行を表示 (詳細は:he laststatus)
"ステータスラインにフルパス､文字コードと改行文字を表示する
set statusline=%F%m%=%l,%c\ %{'['.(&fenc!=''?&fenc:&enc).']\ ['.&fileformat.']'}

"Omni補完のキー割り当て変更
inoremap <C-F> <C-X><C-O>

"PC標準のキー操作:-----------------------------------------------------------
map <C-k> :vnew<CR>
map <C-t> :tabnew<CR>
"NG:　:nmap <C-Tab> <ESC>>gt
map <F9> :source $MYVIMRC<CR>
imap <F9> <ESC>:source $MYVIMRC<CR>
" map <F9> :source $VIM/.vimrc<CR>
" imap <F9> <ESC>:source $VIM/.vimrc<CR>


"Vundle ----------------------------------------------------------------
filetype off
set nocompatible
if has('win32') || has('win64')
"  set rtp+=$VIMRUNTIME/bundle/vundle/
  set rtp+=$VIMRUNTIME/bundle/neobundle.vim
  call neobundle#rc($VIMRUNTIME . '\bundle')
else
"  set rtp+=~/.vim/bundle/vundle/
  set rtp+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
"  call vundle#rc()
endif
"2 transmission errors below;
"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc'

NeoBundle 'vundle'
NeoBundle 'unite.vim'
  NeoBundle 'h1mesuke/unite-outline'
  NeoBundle 'Shougo/neocomplcache.git' 
  NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'VimExplorer'
NeoBundle 'TVO--The-Vim-Outliner'
  NeoBundle 'tlib'
    NeoBundle 'VikiDeplate'
      runtime plugin/viki.vim
      let g:vikiNameSuffix=".viki"
      autocmd! BufRead,BufNewFile $VIM/MyWiki/* set filetype=viki
      let g:vikiHomePage =$VIM . "/MyWiki/index"
NeoBundle 'buftabs'

if has('win32') || has('win64')
  set tags=tags,./tags,$VIM/ctags58j2bin/gems.tags
else
  set tags=tags,./tags,/ctags58j2bin/DEBIAN/tags
  "/ctags58j2bin/gems.tags 
endif
"if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
   "tagsファイルの重複防止
"  set tags=tags,./tags,$VIM/ctags58j2bin/gems.tags
"endif

"###### Ctags ######
"#portable tag生成
  "C:\Users\you>d:
  "d:\>cd D:\me\vim73-kaoriya-win32\ctags58j2bin\
  "ctags -f "D:\me\vim73-kaoriya-win32\ctags58j2bin\gems.tags" --totals -R C:\ruby\*
"#vimrcでよまれたタグ確認
  ":set tags
"#ctags設定名	意味
  "Ctrl-w, }	カーソル位置の単語のタグジャンプ先の定義を、プレビューウィンドウで表示する。
  "Ctrl-t	タグジャンプする前の位置に戻る。
  "g, Ctrl-]	カーソルの位置にある単語のタグが複数存在する場合に、候補の一覧を表示する。
  "Ctrl-]	カーソルの位置にある単語のタグにジャンプする。
  ":pc	プレビューウィンドウを閉じる。
  ":ts /regexp shows the list.
  ":tn /regexp goes to the next tag in that list.
  ":tp - goes to the previous tag in that list.
  ":tf /regexp goes to the function which is in the first of the list.
  ":tl /regexp goes to the function which is in the last of the list.
NeoBundle 'vcscommand.vim'
NeoBundle 'taglist'
  nnoremap <silent> <F8> :TlistToggle<CR>
  if has('win32') || has('win64')
    let Tlist_Ctags_Cmd= '$VIM/ctags58j2bin/ctags.exe'
  endif
  let Tlist_Exit_OnlyWindow = 1
  let Tlist_File_Fold_Auto_Close = 1
  let Tlist_GainFocus_On_ToggleOpen = 1
  let Tlist_Show_One_File = 1
  let Tlist_Sort_Type = "name"
  "関数が使われている位置にカーソルを移動して、コマンドモードで以下。関数の宣言にジャンプ(ctag必要)出来る。
  "[ C-D
  "関数が使われている位置にカーソルを移動して、コマンドモードで以下。関数の宣言にジャンプ(ctag不要)出来る。
  "[ C-I
  "マクロが使われている位置にカーソルを移動して、コマンドモードで以下。マクロの宣言にジャンプ(ctag不要)出来る。
  "C-]
  "元の場所に戻るには
  "C-t
  "変数の使われている位置にカーソルを移動して、コマンドモードで以下。変数の宣言に(Go decration)ジャンプできる。
  "gd
  "変数の使われている位置にカーソルを移動して、コマンドモードで以下。変数の宣言に(Go decration)ジャンプできる。ただしグローバル変数。
  "gD
  "ファイルが参照されている位置(#include とか)にカーソルを移動して、コマンドモードで以下。ファイルを開く。戻るにはC-o
  "gf
  "このようなタグ付けを遣ってくれるプログラム。ctags, egtags, gtags等。
  "元の場所に戻るには
  "C-O

"vim73later NeoBundle 'Tagbar'
"  nmap <F8> :TagbarToggle<CR>
"  let g:tagbar_ctags_bin = '$VIM/ctags58j2bin/ctags.exe'
"  let g:tagbar_left = 1
"  let g:tagbar_autofocus = 1
"  let g:tagbar_autoshowtag = 1
"  let g:tagbar_width = 30
"    let g:tagbar_expand = 1
  "let g:tagbar_updateonsave_maxlines = 10000
  "let g:tagbar_systemenc = 'cp936'

"schelton tempate generation
NeoBundle 'qtmplsel.vim'
"Align.vim
NeoBundle 'https://github.com/vim-scripts/Align.git'

"abstruction layer 
NeoBundle 'https://github.com/hrp/EnhancedCommentify.git' 
NeoBundle 'hrp/EnhancedCommentify'
  "NERDcommenter

"to put under 'ftplugin/ruby' instead uf under 'bundle'
 " XMLとかHTMLとかの編集機能を強化する. 
NeoBundle 'ruby-matchit'
NeoBundle 'tpope/vim-rails'
  "gt
  ":R
  ":E
  ":Ctags
  "<>Rextract  [partial-name]
  ":Rabbrev rp( render :partial
  "  You can also define abbreviations as a hash in |g:rails_abbreviations| or by
  "  using |rails-projection-abbreviations|:
  "  >
  "    let g:rails_abbreviations = {
  "      \ "AE::": "ActiveResource",
  "      \ "p[": "params",
  "      \ "rj(": ["render", "json: "]}

  "Unite neosnippet
  "Aiuto-Ctag@ruby-root@anyOS
  "login-script

"

NeoBundleLazy 'tpope/vim-surround'
"ブロック単位の自動選択編集:vim-textobj-user,vim-textobj-ruby NeoBundle 'textobj-rubyblock'
"debugger代替:Not4rails3 :NeoBundle 'vim-addon-ruby-debug-ide'
"NeoBundle 'peaksea'
"  hi DiffAdd    ctermfg=black ctermbg=2
"  hi DiffChange ctermfg=black ctermbg=3
"  hi DiffDelete ctermfg=black ctermbg=6
"  hi DiffText   ctermfg=black ctermbg=7


NeoBundle 'dbext4rdb'

"RoR editing
NeoBundle 'https://github.com/basyura/unite-rails.git'
NeoBundle 'https://github.com/ujihisa/unite-rake.git'
"RoR Refactoring
NeoBundle 'https://github.com/ecomba/vim-ruby-refactoring.git'
NeoBundle 'https://github.com/taichouchou2/unite-reek.git'
NeoBundle 'https://github.com/taichouchou2/unite-rails_best_practices.git'

"testing
NeoBundle 'Vim-Rspec'
NeoBundle 'https://github.com/tpope/vim-cucumber.git'

"reference
NeoBundle 'https://github.com/rhysd/unite-ruby-require.vim.git'
NeoBundle 'https://github.com/rhysd/neco-ruby-keyword-args.git'
  "vim-plugin below needs installationof text-based webbrowser like w3m,Lynx
    "vim-ref, vim-ref-ri

NeoBundle 'Shougo/vimproc'
NeoBundle 'fontzoom.vim'


"VIM outliner:extra mappings  "this mapping is fold-level and fold-state dependent 
runtime! ftdetect/*.vim

"h EnhancedCommentify
"let g:EnhCommentifyUseAltKeys = 'Yes'
"exregexp(per-compatible) の設定----------------------------------------
nnoremap / :M/
nnoremap ,/ /
"http://christianrobinson.name/vim/HTML/
  "h HTML.txt
	let g:html_tag_case = 'lowercase'
	let g:html_tag_case_autodetect = 'yes'
"http://www.vim.org/scripts/script.php?script_id=13
  let g:closetag_html_style=1
  autocmd Filetype html,xml,eruby source ~/.vim/bundle/closetag.vim 
"Unite.vim-----------------------------------------------------------------------
  " The prefix key.
  nnoremap    [unite]   <Nop>
  "leader-u はundoと衝突
  nmap    f [unite]
  nnoremap  [unite]f  :<C-u>Unite source<CR>
  
  nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file -default-action=tabopen<CR>
  nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir  -buffer-name=files -prompt=% buffer file_mru bookmark file -default-action=tabopen<CR>
  nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=resume resume<CR>
"  nnoremap <silent> [unite]d  :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
  nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>
  nnoremap <silent> [unite]me :<C-u>Unite output:message<CR>
  
  nnoremap <silent> [unite]s  :<C-u>Unite -buffer-name=files -no-split jump_point file_point buffer_tab file_rec:! file file/new file_mru<CR>
  " 入力モードで開始する
  let g:unite_enable_start_insert=1
  " Start insert.
  let g:unite_enable_short_source_names = 1
  " バッファ一覧 , ファイル一覧 ,outline
  noremap <silent> ub :Unite buffer<CR>
  noremap uf :Unite -buffer-name=file file<CR>
  noremap uo :Unite outline<CR>
  noremap ut :Unite tab<CR>
  " 最近使ったファイルの一覧(full-pathで記録と表示)
  noremap <C-H> :Unite file_mru<CR>
    let g:unite_source_file_mru_filename_format = ':p'
  "history/yankの有効化
  let g:unite_source_history_yank_enable =1  
    nnoremap <silent> uy :Unite history/yank<CR>
  " ウィンドウを分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
  au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
  " ウィンドウを縦に分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
  au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
  " ESCキーを2回押すと終了する
  au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
  " 様々なショートカット :windowsで関数みつからないエラー
"  call unite#set_substitute_pattern('file', '\$\w\+', '\=eval(submatch(0))', 200)
"  call unite#set_substitute_pattern('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
"  call unite#set_substitute_pattern('file', '^@', '\=getcwd()."/*"', 1)
"  call unite#set_substitute_pattern('file', '^;r', '\=$VIMRUNTIME."/"')
  "call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
  "call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
  "call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)

  " 初期設定関数を起動する
  au FileType unite call s:unite_my_settings()

  if executable('jvgrep')
    " For jvgrep.
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
  endif
  " For ack.
  if executable('ack-grep')
    " let g:unite_source_grep_command = 'ack-grep'
    " let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    " let g:unite_source_grep_recursive_opt = ''
  endif

  if has('win32') || has('win64')
"      call unite#set_substitute_pattern('file', '^;p', 'C:/Program Files/')
"      call unite#set_substitute_pattern('file', '^;v', '~/vimfiles/')
  else
"      call unite#set_substitute_pattern('file', '^;v', '~/.vim/')
  endif

  function! s:unite_my_settings()"{{{
    " Overwrite settings.
    nmap <buffer> <ESC>      <Plug>(unite_exit)
    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    imap <buffer><expr> j unite#smart_map('j', '')
"    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l unite#smart_map('l', unite#do_action('default'))

    let unite = unite#get_current_unite()
    if unite.buffer_name =~# '^search'
      nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
      nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
    \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])

  endfunction"}}}
"--neocomplecache---------------------------------------------------------------------
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
"https://github.com/scrooloose/snipmate-snippets.git
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" スニペットファイルの配置場所
let g:NeoComplCache_SnippetsDir = '~/.vim/snippets'
" TABでスニペットを展開
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
noremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"-----------------------------------------------------------------------



filetype plugin indent on
autocmd FileType ruby :map ,w <ESC>:!ruby -cW %<CR>
autocmd FileType yaml nmap ,e :execute '!ruby -ryaml -e "begin;YAML::load(open('."'"."%"."'".","."'"."r"."'".').read);rescue ArgumentError=>e;puts e;end"'
