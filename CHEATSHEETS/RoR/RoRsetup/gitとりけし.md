---
title: git 上のいろんなことをなかったことにする
tags: Git
author: mdstoy
slide: false
---
# 前置き

自分用覚書なので適当です。

## 注意

この記事は、git でやらかしたあれこれを『人知れず「なかったことにする」』ための方法が主になっているので、リモートに `push` したあとには絶対しないように。`push` したあとに `reset` して、あらたに別の `commit` をしてからの `push -f` などは、間違ってもしてはいけません。

# なかったことにする

## add をなかったことにする

### すでに git の管理下にあるファイルの場合

```shell-session
$ git reset HEAD <file>
```

### git の管理下にまだなかったファイルを add した場合

```shell-session
$ git rm --cached <file>
```

管理下になかったファイルの場合、よくよく考えてみれば当然だが、戻るべきコミットが存在しないから reset では戻れない。しかたがないので rm で直接管理外とする。

## commit をなかったことにする

### commit したことをなかったことにする（編集内容はそのまま）

```shell-session
$ git reset --soft HEAD^
```

`--soft` は HEAD の位置だけが移動する

### commit をまるごとなかったことにする（編集内容もなかったことにする）

```shell-session
$ git reset --hard HEAD^
```

### commit をやり直す

#### 足りないファイルを追加するとか

不足していたファイルを add した後

```shell-session
$ git commit --amend
```

#### コメントを書きなおす

```shell-session
$ git commit --amend 
```

すかさず --amend 付けてコミットすればよい。

### 付けてはいけないのにうっかり --amend をつけてコミットしてしまった

```shell-session
$ git reset HEAD@{1}
```

コマンド実行履歴などを使っていると、うっかり amend を付けてはいけない時に付けてしまうことがたまにある。そのような場合、単に `git reset --hard HEAD^` では前のコミットは戻ってこない。すでに amend でコミットそのものが編集されてしまっているので。
そこで reflog を使用して元に戻す。

## merge をなかったことにする

```shell-session
$ git reset --hard ORIG_HEAD
```

## ファイルの削除をなかったことにする

```shell-session
$ git checkout HEAD -- <file>
```

削除したファイルを、元あった場所から取ってくるイメージ。
また、いろいろ面倒になったので一旦全てをうっちゃって HEAD に戻すという用途もある。

## git の管理下にあることをなかったことにする

```shell-session
$ git update-index --assume-unchanged <file>
```

例えば配布はするけど管理は各リポジトリごとに別々で行いたい（一例として、環境に依存する設定ファイルとか）場合に重宝する。

（http://qiita.com/usamik26/items/56d0d3ba7a1300625f92 を参考にさせていただきました。）

# 後書き

なかったことにするのに `revert` については触れないのか？と思った方もいるでしょう。しかし、`revert` はある意味では `commit` をなかったことにしていますが、`commit` をなかったことにしたことをなかったことにはしません。`commit` を取り消したことがちゃんとログに残ります。ですので、この記事の趣旨とは外れるため、あえて触れませんでした。

