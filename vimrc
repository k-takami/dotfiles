" "============================================================================
" NOTE: FIRST INSTALL NEOBUNDLE
" mkdir -p ~/.vim/bundle
" git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" "============================================================================

" based on http://github.com/jferris/config_files/blob/master/vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set nowritebackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Switch wrap off for everything
set nowrap

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePre * :%s/\s\+$//gec
  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" if has("folding")
  " set foldenable
  " set foldmethod=syntax
  " set foldlevel=1
  " set foldnestmax=2
  " set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
" endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" \ is the leader character
let mapleader = ","

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel
map <Leader>c :Rcontroller
map <Leader>v :Rview
map <Leader>u :Runittest
map <Leader>f :Rfunctionaltest
map <Leader>tm :RTmodel
map <Leader>tc :RTcontroller
map <Leader>tv :RTview
map <Leader>tu :RTunittest
map <Leader>tf :RTfunctionaltest
map <Leader>sm :RSmodel
map <Leader>sc :RScontroller
map <Leader>sv :RSview
map <Leader>su :RSunittest
map <Leader>sf :RSfunctionaltest

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

" Maps autocomplete to tab
imap <Tab> <C-N>

imap <C-L> <Space>=><Space>

" Display extra whitespace
" set list listchars=tab:≫・,trail:・

" Edit routes
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

" Color scheme
" colorscheme vividchalk
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
" set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
set tags=./tags;

let g:fuf_splitPathMatching=1

" Open URL
"NG: command -bar -nargs=1 OpenURL :!open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
map <Leader>w :call OpenURL()<CR>


" CUSTOMIZING AND OVERRIDING FROM HERE ONWARD ==================
if !has('win32') || !has('win64')
 " LINUX
 " colorscheme evening
 " OSX
 colorscheme default
endif

"検索系設定
set incsearch    " do incremental searching
set wrapscan " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set ignorecase " 検索時に大文字小文字を無視 (noignorecase:無視しない)
set smartcase " 大文字小文字の両方が含まれている場合は大文字小文字を区別
set hlsearch "検索マッチをhighlight

"edit系設定
set tabstop=2 shiftwidth=2 softtabstop=2 "インデント幅を2文字に
set backspace=2 " バックスペースでインデントや改行を削除できるようにする
set expandtab " タブをスペースに展開 (expandtab:展開する)

"
"set wildmenu " コマンドライン補完するときに強化されたものを使う(参照 :help
"wildmenu)
"set formatoptions+=mM " テキスト挿入中の自動折り返しを日本語に対応させる
"let format_allow_over_tw = 1  " ぶら下り可能幅  日本語整形スクリプト(by.
"西岡拓洋さん)用の設定
"set autoread "" 外部のエディタで編集中のファイルが変更されたら自動で読み直す
""" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
"set scrolljump=5 "" Jump 5 lines when running out of the screen
""set scrolloff=3 "" Indicate jump out of the screen when 3 lines before end of the screen

"NG: conficted with git commit vim invoking
" set autochdir "pwd自動変更

""vimgrepやmake後にQuickFixウィンドウを自動的に開く[vim]
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

" E303: "***"のスワップファイルを開けないのでリカバリは不可能です 対策；
set noswapfile
" set directory=~ "スワップファイルの出力先


"表示系設定
"set guifont=ＭＳ_ゴシック:h9:cSHIFTJIS
""set list " タブや改行を表示 (list:表示) "set nolist
set ruler    " show the cursor position all the time
set showmatch " 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set title " タイトルを表示
set wrap " 長い行を折り返して表示 (nowrap:折り返さない)
"set listchars=tab:>-,extends:<,trail:-,eol:< "
"どの文字でタブや改行を表示するかを設定
""
set history=99    " keep 50 lines of command line history
set cmdheight=1 " コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set showcmd    " display incomplete commands
"
"set laststatus=2 " 常にステータス行を表示 (詳細は:he laststatus)
""ステータスラインにフルパス､文字コードと改行文字を表示する
set statusline=%F%m%=%l,%c\ %{'['.(&fenc!=''?&fenc:&enc).']\ ['.&fileformat.']'}


"centOS-vim 対策
"map <s> <Nop>

"PC標準のキー操作:-----------------------------------------------
map <C-w><C-k> :vnew<CR>
map <C-t> :tabnew<CR>
map <F4> :windo q!<CR>
map <F9> :source $MYVIMRC<CR>
imap <F9> <ESC>:source $MYVIMRC<CR>
map <F7> :e ++enc=utf-8 ++ff=unix<CR>
imap <F7> :e ++enc=utf-8 ++ff=unix<CR>
""NG:　:nmap <C-Tab> <ESC>>gt

" diff mode toggle
function! ToggleDiff()
  if &diff
    windo diffoff
    windo set noscrollbind
  else
    windo diffthis
    windo set scrollbind
  endif
:endfunction
nnoremap <silent> <F2> :call ToggleDiff()<CR>
" number toggle
function! ToggleLineNumber()
  if &number
    setlocal nonumber
  else
    setlocal number
  endif
:endfunction
nnoremap <silent> <F6> :call ToggleLineNumber()<CR>
"NG: conficted with git commit vim invoking
" たて新ペインに最近のファイル列挙読み込み(require 'FuzzyFinder.vim')
" function! VnewAndMruFile()
"   vnew
"   FufMruFile
" :endfunction
" nnoremap <silent> <C-f>kr :call VnewAndMruFile()<CR>

" :a! で一時的set noautoindentモードになる。はりつけてくずれない
" 選択範囲をOS-FSでcat
" map <F5> : " :w >> ~/gomi.txt |cat ~/gomi.txt <CR>

"fuf-vimrc-example*
  let g:fuf_modesDisable = []
  let g:fuf_abbrevMap = {
        \   '^vr:' : map(filter(split(&runtimepath, ','), 'v:val !~ "after$"'), 'v:val . ''/**/'''),
        \   '^m0:' : [ '/mnt/d/0/', '/mnt/j/0/' ],
        \ }
  nnoremap <silent> <C-n>      :FufBuffer<CR>
  "nnoremap <silent> <C-p>      :FufFileWithCurrentBufferDir<CR>
  "nnoremap <silent> <C-f><C-p> :FufFileWithFullCwd<CR>
  "nnoremap <silent> <C-f>p     :FufFile<CR>

  "UNUSED SO FAR: nnoremap <silent> <C-o>      :FufFileWithCurrentBufferDir<CR>
  nnoremap <silent> <C-f><C-o> :FufFileWithFullCwd<CR>
  nnoremap <silent> <C-f>o     :FufFile<CR>
  nnoremap <silent> <C-f><C-d> :FufDirWithCurrentBufferDir<CR>
  nnoremap <silent> <C-f>d     :FufDirWithFullCwd<CR>
  nnoremap <silent> <C-f>D     :FufDir<CR>
  " NG: precision buggy
  " nnoremap <silent> <C-f>ffb :FufBookmark<CR>
  " nnoremap <silent> <C-f><C-S-b> :FufAddBookmark<CR>
  " vnoremap <silent> <C-f><A-S-b> :FufAddBookmarkAsSelectedText<CR>

  nnoremap <silent> <C-f><C-j>   :FufJumpList<CR>
  nnoremap <silent> <C-f><C-g>   :FufChangeList<CR>
  nnoremap <silent> <C-f><C-q>   :FufQuickfix<CR>
  nnoremap <silent> <C-f><C-l>   :FufLine<CR>
  nnoremap <silent> <C-f><C-h>   :FufHelp<CR>
  nnoremap <silent> <C-f><C-e>   :FufEditInfo<CR>
  nnoremap <silent> <C-f><C-F9>  :FufRenewCache<CR>
  nnoremap <silent> <C-f><C-t>   :FufTag<CR>
  nnoremap <silent> <C-f>t       :FufTag!<CR>
  noremap  <silent> g]           :FufTagWithCursorWord!<CR>
  nnoremap <silent> <C-f><C-S-t> :FufTaggedFile<CR>
  let g:fuf_mrufile_maxItem = 300
  let g:fuf_mrucmd_maxItem = 400
  let g:fuf_maxMenuWidth = 300
  nnoremap <silent> <C-f><C-r>   :FufMruFile<CR>
  nnoremap <silent> <C-f><C-k>   :FufMruCmd<CR>


"fugitive
  " ref: http://wakame.hatenablog.jp/entry/2017/05/03/222511
  " nnoremap [fugitive]  <Nop>
  " nmap <space>g [fugitive]
  " nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
  " nnoremap <silent> [fugitive]a :Gwrite<CR>
  " nnoremap <silent> [fugitive]c :Gcommit-v<CR>
  " nnoremap <silent> [fugitive]b :Gblame<CR>
  " nnoremap <silent> [fugitive]d :Gdiff<CR>
  " nnoremap <silent> [fugitive]m :Gmerge<CR>


let NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden=1



"Vundle ----------------------------------------------------------------

""manual: http://kaworu.jpn.org/vim/NeoBundle
"WINDOWS: (with normal user)
"$ mkdir %userprofile%\.vim\bundle
"$ cd %userprofile%\.vim\bundle
"$ git clone git://github.com/Shougo/neobundle.vim
" DEBUG COMMEND: scriptnames | set runtimepath

set nocompatible
filetype off

"if has('win32') || has('win64')
"  set rtp+=~/.vim/bundle/neobundle.vim
"  call neobundle#rc(expand('~/.vim/bundle/'))
"  " call vundle#rc()
"endif

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
set runtimepath+=~\.vim\bundle\neobundle.vim\

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"======================================================================
" My Bundles here:
" Refer to |:NeoBundle-examples  " Note: You don't set neobundle setting in .gvimrc!

  " EDITOR ENHANCEMENT --------------------------------------------------------------------
  "OLD NeoBundle 'hrp/EnhancedCommentify'
  NeoBundle 'scrooloose/nerdcommenter'
    let NERDSpaceDelims=1
    " <Leader>c<space> "<==== toggle comment on/off 原因不明だがC-// でも同じ動作をする。
    " <Leader>cn "<---nesting
    " <Leader>cs || cm "<--- multi-line block comment
    " <Leader>ci "<--- multi-line individual comments
    " <Leader>cy "<--- comment out + yanking
    " <leader>c$ "<--- comment to the end of line$ , same as tcomments' \__r
    " <leader>cA "<--- 行末にコメント付加
    "   <leader>ca |NERDComAltDelim|
    "   <leader>cl
    "   <leader>cb |NERDComAlignedComment|
    "   Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).

  NeoBundle 'https://github.com/Talksum/TaskList.vim.git'
  NeoBundle 'grep.vim'
    let Grep_Skip_Dirs = '.svn .git'  "無視するディレクトリ
    let Grep_Default_Options = '-I'   "バイナルファイルがgrepしない
    let Grep_Skip_Files = '*.bak *~'  "バックアップファイルを無視する
    "config: http://myenigma.hatenablog.com/entry/2016/01/17/184925
    "command! -nargs=* -complete=file Greper call Regrep(<f-args>)

    "re-habili "  :Rgrep " ファイル名検索 は　パターン指定 * で
    " ちなみに<C-w>Enterを押す---> tabnew & open file
    " :Regrep        - Run recursive egrep (enhanced grep)
    " :Bgrep         - Search for a pattern on all open buffers
    " :GrepArgs      - Search for a pattern on all the Vim argument filenames(:args)
    " :Ragrep        - Run recursive agrep (ambiguous grep--- NOT BUNDLED IN centOS6.9,
    " :上述コマンドに*Addをつけると - adds the results to the current results

  NeoBundle 'Drawit'
  "罫線描画モード\di でペイン幅やタブのマウス調整できる
  " \ds = stop
    " http://shocrunch.hatenablog.com/entry/2014/12/10/232121
    " "★★★★★　注意★★★★★"
      " visual modeが永続する。タブやマウスドラッグが有効になったまま
      " また、mksessionでつくったsessionファイルよみこむと機能が動作しないみたい。
        "詳しくは、vimで:help drawitして見てくださしあ
        "1.ノーマルモードでおもむろに\diを押下
        "2.線を書くのを辞めたいときは、\ds
        "3.十字キーで線がかける 1.空白で上書きたいときはスペースを押下
        "2.線が書きたくなれば、もう一度スペースを押下すればOk
        "3.Home, End, PgUp, UgDn キーで斜め線
        "4.^, v, <, >で、上下左右の矢印がかける

      "ditaaでアスキーアートを画像に
      "prep:  supkgadd ditaa
        "テキストデータ、出力ファイル名の順に与えて上げればOK
        "$ ditaa inputfile outputimage.png
        "
  NeoBundle 'VimExplorer'
  NeoBundle 'TVO--The-Vim-Outliner'
    NeoBundle 'tlib'

  " GENERIC FOR PROGRAMMING --------------------------------------------------------------------
  " NeoBundle 'dbext4rdb'
  NeoBundle 'https://github.com/vim-scripts/dbext.vim.git'
  "re-habiliリハビリ:<Leader>  dbp slt sT se sh, desc=sdt, range-execution=sea,
                 ":h dbext-mappings
    "http://kaworu.jpn.org/vim/vim%E3%81%AEdbext.vim%E3%81%A7SQL%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%82%92%E6%93%8D%E4%BD%9C%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95
    "config: https://vim.sourceforge.io/scripts/script.php?script_id=356
    let g:dbext_default_buffer_lines = 60
    "If you want each buffer to have its OWN Result buffer, you can define: >
    let g:dbext_default_use_sep_result_buffer = 1
    " MySQL
    "let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=whatever:dbname=mysql:extra=-t'
    " Postgres
    let g:dbext_default_profile_PG = 'type=PGSQL:srvname=localhost:user=postgres:passwd=postgres:dbname=catalog'
    let g:dbext_default_profile_PG_test = 'type=PGSQL:srvname=localhost:user=postgres:passwd=postgres:dbname=catalog_test'
    let g:dbext_default_profile_usual = 'type=PGSQL:srvname=localhost:user=postgres:passwd=postgres:dbname=catalog'
    "NG let dbext_default_profile = 1
    let g:dbext_default_profile_sampleSQLite = 'type=SQLITE:dbname=./db/development.sqlite3'

  NeoBundle 'scrooloose/syntastic'
    let g:syntastic_ruby_checkers = ['mri'] "['mri', 'rubocop']
    "let g:syntastic_javascript_checker = "jshint" "JavaScriptのSyntaxチェックはjshintで
    let g:syntastic_check_on_open = 0 "ファイルオープン時にはチェックをしない
    let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施
  NeoBundle 'szw/vim-tags'
    " メソッド定義元へのジャンプ : prep supkgadd ctags -y ; :TagsGenerate!
    " re-habilli C-]: jump,
    let g:vim_tags_auto_generate = 1

  "vim73later
  NeoBundle 'Tagbar'
   nmap <F8> :TagbarToggle<CR>
  "  let g:tagbar_ctags_bin = '$VIM/ctags58j2bin/ctags.exe'
   let g:tagbar_left = 1
   let g:tagbar_autofocus = 1
   let g:tagbar_autoshowtag = 1
   let g:tagbar_width = 30
   let g:tagbar_expand = 1
   let g:tagbar_updateonsave_maxlines = 10000
   " let g:tagbar_systemenc = 'cp936'

  NeoBundle 'switch.vim'
    " defaultでカーソル下単語をESC-gsで反義語変換。設定は~/.dotfiles/vim/vimrc2で

  " NeoBundle 'mattn/emmet-vim' " high-speed view code expantion like Zen-coding
    "config: http://re-dzine.net/2014/02/emmet-beta-v1-1/   " applicable to SLIM too.
    "NG: NEED RESOLVE SONFLICT OF MAPPING
    " let g:user_emmet_leader_key='<c-@>'

  " NeoBundle 'Chiel92/vim-autoformat'

  " WINDOWNS: RYAN DOTFIKES SCRIPTS --------------------------------------------------------------------
  if has('win32') || has('win64')
    NeoBundle 'surround.vim'
    NeoBundle 'https://github.com/godlygeek/tabular.git'

    NeoBundle "honza/vim-snippets"

    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'fugitive.vim'
    NeoBundle 'rails.vim'
    NeoBundle 'Rename.vim'
    NeoBundle 'ragtag.vim'
    " diff mode ON/OFF below
    NeoBundle 'unimpaired.vim'
    NeoBundle 'l9'
      NeoBundle 'FuzzyFinder'
    "NG NeoBundle 'tpope/vim-unimpaired.git'
    "NG on wim80-kaoriya-win
    " set runtimepath+=~/.vim/script/snipMate.vim/
    " set runtimepath+=~\.vim\script\snipMate.vim\
  endif

  " NEoSnippet -------------------------------------------------------------------------------
  " ref: http://qiita.com/alpaca_taichou/items/ab2ad83ddbaf2f6ce7fb
  NeoBundle 'Shougo/neocomplcache'
    let g:neocomplcache_force_overwrite_completefunc=1
    let g:neocomplcache_auto_completion_start_length = 3
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 1
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
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " NeoBundle 'cohama/vim--endwise'

  " FUTURE: irequires native lib 'lua' : $ vim --version | grep lua
    " NeoBundle 'Shougo/neocomplete'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  " ---------- neocomplecache + ragtag とあわせると insertモードで
  "  tabで候補上下移動、C-kでsnippetからの選択確定, C-nでバッファ中からの選択肢の確定、タグ＜＞は入力不要、トジタグはC-x/で自動入力
  "
    " Plugin key-mappings.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    "imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For conceal markers.
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif
    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1
    " Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

    " vim-rails (tpopo) and NeoSnippets compo
    autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippets/ruby.rails.controller.snip
    autocmd User Rails.model*                NeoSnippetSource ~/.vim/snippets/ruby.rails.model.snip
    autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippets/ruby.rails.view.snip
    "TODO: bootstrap.snip
    autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippets/ruby.rails.migrate.snip
    autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippets/ruby.rails.route.snip
    " config:
      " 独自スニペットを適用したい拡張子のファイルをvimで開き、以下を実行する。
      " :NeoSnippetEdit


  " GENERIC FOR RRRoR PROGRAMMING  ----------------------------------------------------------------
    " 標準添付matchit.vimのruby設定と活性化
    source $VIMRUNTIME/macros/matchit.vim
    augroup matchit
      au!
      au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
    augroup END
    NeoBundle 'slim-template/vim-slim'
      autocmd FileType slim setlocal foldmethod=indent
      autocmd BufNewFile,BufRead *.slim set filetype=slim
    "RoR Refactoring
    NeoBundle 'https://github.com/ecomba/vim-ruby-refactoring.git'
      " 選択部分をメソッドに切り出す
      :vnoremap <leader>rem  :RExtractMethod<cr>
      " 選択部分を RSpec の "let(:hoge) { fuga }" の形式に切り出す
      :nnoremap <leader>rel  :RExtractLet<cr>
      " 選択部分を定数として切り出す
      :vnoremap <leader>rec  :RExtractConstant<cr>
      " 選択部分を変数として切り出す
      :vnoremap <leader>relv :RExtractLocalVariable<cr>

      " メソッドに引数を追加する
      :nnoremap <leader>rap  :RAddParameter<cr>
      " 一行で書かれた条件文(e.g. "hoge if fuga?" のようなもの)を伝統的な複数行の形式に変換する
      :nnoremap <leader>rcpc :RConvertPostConditional<cr>
      " 一時変数を取り除く
      :nnoremap <leader>rit  :RInlineTemp<cr>
      " ローカル変数をリネームする
      :vnoremap <leader>rrlv :RRenameLocalVariable<cr>
      " インスタンス変数をリネームする
      :vnoremap <leader>rriv :RRenameInstanceVariable<cr>

    " ドキュメント参照
    " prep: supkgadd refe2 bitclust-dev ; bitclust setup; echo 'default_version: 2.1.0' >> ~/.bitclust/config
    NeoBundle 'thinca/vim-ref'
    NeoBundle 'yuku-t/vim-ref-ri'
      " re-habilli :Ref refe [some-word otherwise no word]
      let g:ref_no_default_key_mappings = 0

    NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make',
    \     'linux' : 'make',
    \     'unix' : 'gmake',
    \    },
    \ }
    NeoBundle 'idanarye/vim-vebugger'
    NeoBundle 'Shougo/vimshell.vim'
      " vimshell setting
      let g:vimshell_interactive_update_time = 10
      let g:vimshell_prompt = $USERNAME."% "
      " vimshell map
      nnoremap <silent> vs :VimShell<CR>
      nnoremap <silent> vsc :VimShellCreate<CR>
      nnoremap <silent> vp :VimShellPop<CR>
      nnoremap <Space>d :VimShellInteractive<CR>
      nnoremap <Space>i :VimShellInteractive irb<CR>
      nnoremap <Space>s :VimShellSendString<CR>
      vmap <Space>s :VimShellSendString<CR>

    " markdown/texctile viewer
    NeoBundle 'kannokanno/previm'
      au BufRead,BufNewFile *.md set filetype=markdown
      let g:previm_open_cmd = 'open -a Firefox'
    " NeoBundle 'QuickRun'

    "node.js-relevants
    NeoBundle 'leafgarland/typescript-vim'
    let g:syntastic_typescript_tsc_args = "--experimentalDecorators --target ES5"



  "Unite.vim-----------------------------------------------------------------------
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'https://github.com/basyura/unite-rails.git'
  NeoBundle 'https://github.com/ujihisa/unite-rake.git'
  NeoBundle 'Shougo/neoyank.vim'
    noremap uy :Unite history/yank<CR>

  " バッファ一覧 , ファイル一覧 ,outline
  noremap <silent> ub :Unite buffer<CR>
  noremap uf :Unite -buffer-name=file file<CR>
  noremap uo :Unite outline<CR>
  noremap ut :Unite tab<CR>

  " ESCキーを2回押すと終了する
  au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
  " 様々なショートカット :windowsで関数みつからないエラー
  " call unite#set_substitute_pattern('file', '\\\\$\\\\w\\\\+', '\\\\=eval(submatch(0))', 200)
  " call unite#set_substitute_pattern('file', '^@@', '\\\\=fnamemodify(expand("#"), ":p:h")."/"', 2)
  " call unite#set_substitute_pattern('file', '^@', '\\\\=getcwd()."/*"', 1)
  " call unite#set_substitute_pattern('file', '^;r', '\\\\=$VIMRUNTIME."/"')
  " call unite#set_substitute_pattern('file', '^\\\\~', escape($HOME, '\\\\'), -2)
  " call unite#set_substitute_pattern('file', '\\\\\\\\\\\\@<! ', '\\\\\\\\ ', -20)
  " call unite#set_substitute_pattern('file', '\\\\\\\\ \\\\@!', '/', -30)

  " 初期設定関数を起動する
  au FileType unite call s:unite_my_settings()

  " 最近使ったファイルの一覧(full-pathで記録と表示)
    "NG: therefor use 'fuf': noremap uh :Unite file_mru<CR>

  NeoBundle 'MattesGroeger/vim-bookmarks'
    " https://github.com/MattesGroeger/vim-bookmarks
    " CONFLICT WITH: source command '-S'
    " cf: vim-markology
    " let g:bookmark_manage_per_buffer = 1
    let g:bookmark_auto_close = 1
    let g:bookmark_center = 1
    " rehabili リハビリ mi mm ma BookmarkSave BookmarkLoad
      " Add/remove bookmark at current line   mm  :BookmarkToggle
      " Show all bookmarks (toggle)   ma  :BookmarkShowAll
      " Add/edit/remove annotation at current line  mi  :BookmarkAnnotate <TEXT>
      " Save all bookmarks to a file    :BookmarkSave <FILE_PATH>
      " Load bookmarks from a file    :BookmarkLoad <FILE_PATH>
      "
      " Jump to next bookmark in buffer   mn  :BookmarkNext
      " Jump to previous bookmark in buffer   mp  :BookmarkPrev
      " Clear bookmarks in current buffer only  mc  :BookmarkClear
      " Clear bookmarks in all buffers  mx  :BookmarkClearAll
      " Move up bookmark at current line  [count]mkk  :BookmarkMoveUp [<COUNT>]
      " Move down bookmark at current line  [count]mjj  :BookmarkMoveDown [<COUNT>]
      " Move bookmark at current line to another line   [count]mg   :BookmarkMoveToLine <LINE>


  "LIMITED -----------------------------------------------------------------------
  "fontsize変更だけはgvim/macvimで動作する。
  NeoBundle 'fontzoom.vim'


  " 未評価　 -----------------------------------------------------------------------
  "NeoBundle 'vcscommand.vim'
  " NeoBundle 'thinca/vim-quickrun'
  "  config: http://shirusu-ni-tarazu.hatenablog.jp/entry/2012/04/17/090805 "別ペインで非同期実行：
  "NeoBundle 'https://github.com/taichouchou2/unite-reek.git'
  " vim-ref vim-ref-ri
  "

  "ブロック単位の自動選択編集:vim-textobj-user,vim-textobj-ruby NeoBundle 'textobj-rubyblock'
  "debugger代替:Not4rails3 :NeoBundle 'vim-addon-ruby-debug-ide'
  "NeoBundle 'https://github.com/taichouchou2/unite-rails_best_practices.git'

"======================================================================
call neobundle#end()
filetype plugin indent on
" If there are uninstalled bundles found on startup, this will conveniently prompt you to install them.
NeoBundleCheck


"======================================================================
"#以下の関数でuniteのincremental-search enabling
"======================================================================
"Unite
  " The prefix key.
  nnoremap  [unite]   <Nop>
  "leader-u はundoと衝突
  nmap    f [unite]
  nnoremap  [unite]f  :<C-u>Unite source<CR>
  " 入力モードで開始する
  let g:unite_enable_start_insert=1
  " Start insert.
  let g:unite_enable_short_source_names = 1


  "NG: nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file -default-action=tabopen<CR>
  nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir  -buffer-name=files -prompt=% buffer file_mru bookmark file -default-action=tabopen<CR>
  nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=resume resume<CR>
"  nnoremap <silent> [unite]d  :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
  nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>
  nnoremap <silent> [unite]me :<C-u>Unite output:message<CR>

  nnoremap <silent> [unite]s  :<C-u>Unite -buffer-name=files -no-split jump_point file_point buffer_tab file_rec:! file file/new file_mru<CR>

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
    " imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    " imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    " nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
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

filetype plugin indent on
" source ~/.dotfiles/vim/vimrc2


" RYAN DOTFIKES COMMANDS  ----------------------------------
" #  RAILS.vim #############################################

" " Leader shortcuts for Rails commands
" map <Leader>m :Rmodel
" map <Leader>c :Rcontroller
" map <Leader>v :Rview
" map <Leader>u :Runittest
" map <Leader>f :Rfunctionaltest
" map <Leader>tm :RTmodel
" map <Leader>tc :RTcontroller
" map <Leader>tv :RTview
" map <Leader>tu :RTunittest
" map <Leader>tf :RTfunctionaltest
" map <Leader>sm :RSmodel
" map <Leader>sc :RScontroller
" map <Leader>sv :RSview
" map <Leader>su :RSunittest
" map <Leader>sf :RSfunctionaltest

" " no mapping by default
" :Renvironment					|rails-:Renvironment|
" :Rfixtures					|rails-:Rfixtures|
" :Rhelper					|rails-:Rhelper|
" :Rinitializer					|rails-:Rinitializer|
" :Rintegrationtest				|rails-:Rintegrationtest|
" :Rjavascript					|rails-:Rjavascript|
" :Rlayout					|rails-:Rlayout|
" :Rlib						|rails-:Rlib|
" :Rlocale					|rails-:Rlocale|
" :Rmailer					|rails-:Rmailer|
" :Rmetal						|rails-:Rmetal|
" :Rmigration					|rails-:Rmigration|
" :Robserver					|rails-:Robserver|
" :Rplugin					|rails-:Rplugin|
" :Rstylesheet					|rails-:Rstylesheet|
" :Rtask						|rails-:Rtask|
" :Runittest					|rails-:Runittest|


" ########## SNIPMATE MORE SNIPPETS ###################################################
" https://github.com/honza/vim-snippets/tree/master/snippets


" ########## TABULARIZE ################
  " :Tabularize /そろえ文字正規表現/(右r|中央c|左l)そろえ文字後の半角スペース数
  " :Tabularize /,/r1c1l0
              " Some short phrase , some other phrase
      " A much longer phrase here , and another long phrase


" ########## SURROUND ################
  " Old text                  Command     New text ~
  " "Hello *world!"           ds"         Hello world!
  " [123+4*56]/2              cs])        (123+456)/2
  " "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
  " if *x>3 {                 ysW(        if ( x>3 ) {
  " my $str = *whee!;         vlllls'     my $str = 'whee!';

" ########## PLUGIN RAGTAG ###################################################
" インサートモードで動作する
" Mapping       Changed to   (cursor = ^) ~
" #ERB-EURROUNDING
" <C-X>_        <% foo^ %>                                *ragtag-CTRL-X__*
" <C-X>+        <%= foo^ %>                               *ragtag-CTRL-X_+*
" <C-X>"        <%# foo^ %>                               *ragtag-CTRL-X_quote*
" #ERB-appending
" <C-X>=        foo<%= ^ %>                               *ragtag-CTRL-X_=*
" <C-X>-        foo<% ^ %>                                *ragtag-CTRL-X_-*
" <C-X>'        foo<%# ^ %>                               *ragtag-CTRL-X_'*

" #HTML
" <C-X><Space>  <foo>^</foo>                              *ragtag-CTRL-X_<Space>*
" <C-X><CR>     <foo>\n^\n</foo>                          *ragtag-CTRL-X_<CR>*
" <C-X>/        Last HTML tag closed                      *ragtag-CTRL-X_/*
              " (mnemonic: ' is a comment in ASP VBS)
" <C-X>!        <!DOCTYPE...>/<?xml ...?> (menu)          *ragtag-CTRL-X_!*
" <C-X>@        <link rel="stylesheet" ...>               *ragtag-CTRL-X_@*
              " (mnemonic: @ is used for importing in a CSS file)
" <C-X>#        <meta http-equiv="Content-Type" ... />    *ragtag-CTRL-X_#*
" <C-X>$        <script src="/javascripts/^.js"></script> *ragtag-CTRL-X_$*
              " (mnemonic: $ is valid in javascript identifiers)

" For the bindings that generate HTML tag pairs, in a few cases, attributes will
" be automatically added.  For example, script becomes >
        " <script type="text/javascript">

" ENCODING                                        *ragtag-encoding*

" This plugin used to provide a set of general purpose XML/URL encoding/decoding
" mappings.  These mappings have been extracted to a (highly recommended) plugin
" named unimpaired.vim.  Left behind were the following four insert mode
" mappings (mostly useful as stupid party tricks).

" <Plug>ragtagUrlV        URL encode the next character.
" <C-V>%
" <Plug>ragtagXmlV        XML encode the next character.
" <C-V>&
" <Plug>ragtagUrlEncode   Toggle a mode that automatically URL encodes unsafe
" <C-X>%                  characters.
" <Plug>ragtagXmlEncode   Toggle a mode that automatically XML encodes unsafe
" <C-X>&                  characters.


" # FUF ##################################################
" "fuf-vimrc-example*
  " let g:fuf_modesDisable = []
  " let g:fuf_abbrevMap = {
        " \   '^vr:' : map(filter(split(&runtimepath, ','), 'v:val !~ "after$"'), 'v:val . ''/**/'''),
        " \   '^m0:' : [ '/mnt/d/0/', '/mnt/j/0/' ],
        " \ }
  " let g:fuf_mrufile_maxItem = 300
  " let g:fuf_mrucmd_maxItem = 400
  " nnoremap <silent> <C-n>      :FufBuffer<CR>
  " "nnoremap <silent> <C-p>      :FufFileWithCurrentBufferDir<CR>
  " "nnoremap <silent> <C-f><C-p> :FufFileWithFullCwd<CR>
  " "nnoremap <silent> <C-f>p     :FufFile<CR>
  " nnoremap <silent> <C-o>      :FufFileWithCurrentBufferDir<CR>
  " nnoremap <silent> <C-f><C-o> :FufFileWithFullCwd<CR>
  " nnoremap <silent> <C-f>o     :FufFile<CR>
  " nnoremap <silent> <C-f><C-d> :FufDirWithCurrentBufferDir<CR>
  " nnoremap <silent> <C-f>d     :FufDirWithFullCwd<CR>
  " nnoremap <silent> <C-f>D     :FufDir<CR>
  " "nnoremap <silent> <C-j>      :FufMruFile<CR>
  " nnoremap <silent> <C-f><C-m> :FufMruFile<CR>
  " nnoremap <silent> <C-k>      :FufMruCmd<CR>
  " nnoremap <silent> <C-b>      :FufBookmark<CR>
  " nnoremap <silent> <C-f><C-t> :FufTag<CR>
  " nnoremap <silent> <C-f>t     :FufTag!<CR>
  " noremap  <silent> g]         :FufTagWithCursorWord!<CR>
  " nnoremap <silent> <C-f><C-f> :FufTaggedFile<CR>
  " nnoremap <silent> <C-f><C-j> :FufJumpList<CR>
  " nnoremap <silent> <C-f><C-g> :FufChangeList<CR>
  " nnoremap <silent> <C-f><C-q> :FufQuickfix<CR>
  " nnoremap <silent> <C-f><C-l> :FufLine<CR>
  " nnoremap <silent> <C-f><C-h> :FufHelp<CR>
  " nnoremap <silent> <C-f><C-b> :FufAddBookmark<CR>
  " vnoremap <silent> <C-f><C-b> :FufAddBookmarkAsSelectedText<CR>
  " nnoremap <silent> <C-f><C-e> :FufEditInfo<CR>

  " nnoremap <silent> <C-f><C-r> :FufRenewCache<CR>


" ########## FUGITIVE
  " ~/.dotfiles/vim/doc/fugitive.txt
  " pushとかpullは手でやることが多いので頻繁に使うのは以下.
  " :Gstatus  git status  git status をサブウィンドウで開いていろいろできる
  " :Gdiff  git diff  今開いてるファイルを前のコミットとvimdiff
  " :Gread 現在開いているソースの直前のコミット時のソースを表示
  " :Gblame git blame 今開いてるファイルを git blame
  " /*:BUGGY? Ggrep i: git log -S*/
  " :Gbrowse
  " :Gcommit  git commit  今開いてるファイルをコミット

  " :Gwrite git add 今開いてるファイルを git add
  " :Gmove destination/path 現在開いているソースをgit mvする
  " :Gremove destination/path 現在開いているソースをgit rmする

  " :Gmerge git merge git merge [args] を呼ぶ．コンフリクト時に:Gmergeするとconflictをquickfixに流す


  " ~/.dotfiles/vim/doc/fugitive.txt

  " MAPPINGS                                        *fugitive-mappings*

  " These maps are available in Git objects.

                                                  " *fugitive-<CR>*
  " <CR>                    Jump to the revision under the cursor.
  " o                       Jump to the revision under the cursor in a new split.
  " O                       Jump to the revision under the cursor in a new tab.
  " ~                       Go to the current file in the [count]th first ancestor.
  " P                       Go to the current file in the [count]th parent.
  " C                       Go to the commit containing the current file.
  " a                       Show the current tag, commit, or tree in an alternate format.


  " SPECIFYING REVISIONS                            *fugitive-revision*

  " Fugitive revisions are similar to Git revisions as defined in the "SPECIFYING
  " REVISIONS" section in the git-rev-parse man page.  For commands that accept an
  " optional revision, the default is the file in the index for work tree files
  " and the work tree file for everything else.  Example revisions follow.

  " Revision        Meaning ~
  " HEAD            .git/HEAD
  " master          .git/refs/heads/master
  " HEAD^{}         The commit referenced by HEAD
  " HEAD^           The parent of the commit referenced by HEAD
  " HEAD:           The tree referenced by HEAD
  " /HEAD           The file named HEAD in the work tree
  " Makefile        The file named Makefile in the work tree
  " HEAD^:Makefile  The file named Makefile in the parent of HEAD
  " :Makefile       The file named Makefile in the index (writable)
  " -               The current file in HEAD
  " ^               The current file in the previous commit
  " ~3              The current file 3 commits ago
  " :               .git/index (Same as |:Gstatus|)
  " :0              The current file in the index
  " :1              The current file's common ancestor during a conflict
  " :2              The current file in the target branch during a conflict
  " :3              The current file in the merged branch during a conflict
  " :/foo           The most recent commit with "foo" in the message


  " # https://github.com/MattesGroeger/vim-bookmarks
" Action  Shortcut  Command
" Add/remove bookmark at current line   mm  :BookmarkToggle
" Add/edit/remove annotation at current line  mi  :BookmarkAnnotate <TEXT>

" Show all bookmarks (toggle)   ma  :BookmarkShowAll
" Clear bookmarks in current buffer only  mc  :BookmarkClear
" Clear bookmarks in all buffers  mx  :BookmarkClearAll
" Jump to next bookmark in buffer   mn  :BookmarkNext
" Jump to previous bookmark in buffer   mp  :BookmarkPrev
" Move up bookmark at current line  [count]mkk  :BookmarkMoveUp [<COUNT>]
" Move down bookmark at current line  [count]mjj  :BookmarkMoveDown [<COUNT>]
" Move bookmark at current line to another line   [count]mg   :BookmarkMoveToLine <LINE>
" Save all bookmarks to a file    :BookmarkSave <FILE_PATH>
" Load bookmarks from a file    :BookmarkLoad <FILE_PATH>


