#  RAILS.vim #############################################

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

" no mapping by default
:Renvironment					|rails-:Renvironment|
:Rfixtures					|rails-:Rfixtures|
:Rhelper					|rails-:Rhelper|
:Rinitializer					|rails-:Rinitializer|
:Rintegrationtest				|rails-:Rintegrationtest|
:Rjavascript					|rails-:Rjavascript|
:Rlayout					|rails-:Rlayout|
:Rlib						|rails-:Rlib|
:Rlocale					|rails-:Rlocale|
:Rmailer					|rails-:Rmailer|
:Rmetal						|rails-:Rmetal|
:Rmigration					|rails-:Rmigration|
:Robserver					|rails-:Robserver|
:Rplugin					|rails-:Rplugin|
:Rstylesheet					|rails-:Rstylesheet|
:Rtask						|rails-:Rtask|
:Runittest					|rails-:Runittest|


########## SNIPMATE MORE SNIPPETS ###################################################
https://github.com/honza/vim-snippets/tree/master/snippets


########## TABULARIZE ################
  :Tabularize /そろえ文字正規表現/(右r|中央c|左l)そろえ文字後の半角スペース数
  :Tabularize /,/r1c1l0
              Some short phrase , some other phrase
      A much longer phrase here , and another long phrase


########## SURROUND ################
  Old text                  Command     New text ~
  "Hello *world!"           ds"         Hello world!
  [123+4*56]/2              cs])        (123+456)/2
  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
  if *x>3 {                 ysW(        if ( x>3 ) {
  my $str = *whee!;         vlllls'     my $str = 'whee!';

########## PLUGIN RAGTAG ###################################################
インサートモードで動作する
Mapping       Changed to   (cursor = ^) ~
#ERB-EURROUNDING
<C-X>_        <% foo^ %>                                *ragtag-CTRL-X__*
<C-X>+        <%= foo^ %>                               *ragtag-CTRL-X_+*
<C-X>"        <%# foo^ %>                               *ragtag-CTRL-X_quote*
#ERB-appending
<C-X>=        foo<%= ^ %>                               *ragtag-CTRL-X_=*
<C-X>-        foo<% ^ %>                                *ragtag-CTRL-X_-*
<C-X>'        foo<%# ^ %>                               *ragtag-CTRL-X_'*

#HTML
<C-X><Space>  <foo>^</foo>                              *ragtag-CTRL-X_<Space>*
<C-X><CR>     <foo>\n^\n</foo>                          *ragtag-CTRL-X_<CR>*
<C-X>/        Last HTML tag closed                      *ragtag-CTRL-X_/*
              (mnemonic: ' is a comment in ASP VBS)
<C-X>!        <!DOCTYPE...>/<?xml ...?> (menu)          *ragtag-CTRL-X_!*
<C-X>@        <link rel="stylesheet" ...>               *ragtag-CTRL-X_@*
              (mnemonic: @ is used for importing in a CSS file)
<C-X>#        <meta http-equiv="Content-Type" ... />    *ragtag-CTRL-X_#*
<C-X>$        <script src="/javascripts/^.js"></script> *ragtag-CTRL-X_$*
              (mnemonic: $ is valid in javascript identifiers)

For the bindings that generate HTML tag pairs, in a few cases, attributes will
be automatically added.  For example, script becomes >
        <script type="text/javascript">

ENCODING                                        *ragtag-encoding*

This plugin used to provide a set of general purpose XML/URL encoding/decoding
mappings.  These mappings have been extracted to a (highly recommended) plugin
named unimpaired.vim.  Left behind were the following four insert mode
mappings (mostly useful as stupid party tricks).

<Plug>ragtagUrlV        URL encode the next character.
<C-V>%
<Plug>ragtagXmlV        XML encode the next character.
<C-V>&
<Plug>ragtagUrlEncode   Toggle a mode that automatically URL encodes unsafe
<C-X>%                  characters.
<Plug>ragtagXmlEncode   Toggle a mode that automatically XML encodes unsafe
<C-X>&                  characters.


# FUF ##################################################
"fuf-vimrc-example*
  let g:fuf_modesDisable = []
  let g:fuf_abbrevMap = {
        \   '^vr:' : map(filter(split(&runtimepath, ','), 'v:val !~ "after$"'), 'v:val . ''/**/'''),
        \   '^m0:' : [ '/mnt/d/0/', '/mnt/j/0/' ],
        \ }
  let g:fuf_mrufile_maxItem = 300
  let g:fuf_mrucmd_maxItem = 400
  nnoremap <silent> <C-n>      :FufBuffer<CR>
  "nnoremap <silent> <C-p>      :FufFileWithCurrentBufferDir<CR>
  "nnoremap <silent> <C-f><C-p> :FufFileWithFullCwd<CR>
  "nnoremap <silent> <C-f>p     :FufFile<CR>
  nnoremap <silent> <C-o>      :FufFileWithCurrentBufferDir<CR>
  nnoremap <silent> <C-f><C-o> :FufFileWithFullCwd<CR>
  nnoremap <silent> <C-f>o     :FufFile<CR>
  nnoremap <silent> <C-f><C-d> :FufDirWithCurrentBufferDir<CR>
  nnoremap <silent> <C-f>d     :FufDirWithFullCwd<CR>
  nnoremap <silent> <C-f>D     :FufDir<CR>
  "nnoremap <silent> <C-j>      :FufMruFile<CR>
  nnoremap <silent> <C-f><C-m> :FufMruFile<CR>
  nnoremap <silent> <C-k>      :FufMruCmd<CR>
  nnoremap <silent> <C-b>      :FufBookmark<CR>
  nnoremap <silent> <C-f><C-t> :FufTag<CR>
  nnoremap <silent> <C-f>t     :FufTag!<CR>
  noremap  <silent> g]         :FufTagWithCursorWord!<CR>
  nnoremap <silent> <C-f><C-f> :FufTaggedFile<CR>
  nnoremap <silent> <C-f><C-j> :FufJumpList<CR>
  nnoremap <silent> <C-f><C-g> :FufChangeList<CR>
  nnoremap <silent> <C-f><C-q> :FufQuickfix<CR>
  nnoremap <silent> <C-f><C-l> :FufLine<CR>
  nnoremap <silent> <C-f><C-h> :FufHelp<CR>
  nnoremap <silent> <C-f><C-b> :FufAddBookmark<CR>
  vnoremap <silent> <C-f><C-b> :FufAddBookmarkAsSelectedText<CR>
  nnoremap <silent> <C-f><C-e> :FufEditInfo<CR>

  nnoremap <silent> <C-f><C-r> :FufRenewCache<CR>


########## FUGITIVE
  ~/.dotfiles/vim/doc/fugitive.txt
  pushとかpullは手でやることが多いので頻繁に使うのは以下.
  :Gstatus  git status  git status をサブウィンドウで開いていろいろできる
  :Gdiff  git diff  今開いてるファイルを前のコミットとvimdiff
  :Gread 現在開いているソースの直前のコミット時のソースを表示
  :Gblame git blame 今開いてるファイルを git blame
  /*:BUGGY? Ggrep i: git log -S*/
  :Gbrowse
  :Gcommit  git commit  今開いてるファイルをコミット

  :Gwrite git add 今開いてるファイルを git add
  :Gmove destination/path 現在開いているソースをgit mvする
  :Gremove destination/path 現在開いているソースをgit rmする

  :Gmerge git merge git merge [args] を呼ぶ．コンフリクト時に:Gmergeするとconflictをquickfixに流す


  ~/.dotfiles/vim/doc/fugitive.txt

  MAPPINGS                                        *fugitive-mappings*

  These maps are available in Git objects.

                                                  *fugitive-<CR>*
  <CR>                    Jump to the revision under the cursor.
  o                       Jump to the revision under the cursor in a new split.
  O                       Jump to the revision under the cursor in a new tab.
  ~                       Go to the current file in the [count]th first ancestor.
  P                       Go to the current file in the [count]th parent.
  C                       Go to the commit containing the current file.
  a                       Show the current tag, commit, or tree in an alternate format.


  SPECIFYING REVISIONS                            *fugitive-revision*

  Fugitive revisions are similar to Git revisions as defined in the "SPECIFYING
  REVISIONS" section in the git-rev-parse man page.  For commands that accept an
  optional revision, the default is the file in the index for work tree files
  and the work tree file for everything else.  Example revisions follow.

  Revision        Meaning ~
  HEAD            .git/HEAD
  master          .git/refs/heads/master
  HEAD^{}         The commit referenced by HEAD
  HEAD^           The parent of the commit referenced by HEAD
  HEAD:           The tree referenced by HEAD
  /HEAD           The file named HEAD in the work tree
  Makefile        The file named Makefile in the work tree
  HEAD^:Makefile  The file named Makefile in the parent of HEAD
  :Makefile       The file named Makefile in the index (writable)
  -               The current file in HEAD
  ^               The current file in the previous commit
  ~3              The current file 3 commits ago
  :               .git/index (Same as |:Gstatus|)
  :0              The current file in the index
  :1              The current file's common ancestor during a conflict
  :2              The current file in the target branch during a conflict
  :3              The current file in the merged branch during a conflict
  :/foo           The most recent commit with "foo" in the message


  # https://github.com/MattesGroeger/vim-bookmarks
Action  Shortcut  Command
Add/remove bookmark at current line   mm  :BookmarkToggle
Add/edit/remove annotation at current line  mi  :BookmarkAnnotate <TEXT>

Show all bookmarks (toggle)   ma  :BookmarkShowAll
Clear bookmarks in current buffer only  mc  :BookmarkClear
Clear bookmarks in all buffers  mx  :BookmarkClearAll
Jump to next bookmark in buffer   mn  :BookmarkNext
Jump to previous bookmark in buffer   mp  :BookmarkPrev
Move up bookmark at current line  [count]mkk  :BookmarkMoveUp [<COUNT>]
Move down bookmark at current line  [count]mjj  :BookmarkMoveDown [<COUNT>]
Move bookmark at current line to another line   [count]mg   :BookmarkMoveToLine <LINE>
Save all bookmarks to a file    :BookmarkSave <FILE_PATH>
Load bookmarks from a file    :BookmarkLoad <FILE_PATH>


