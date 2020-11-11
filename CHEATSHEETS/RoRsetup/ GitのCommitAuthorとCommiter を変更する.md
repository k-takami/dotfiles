---
title: Git の Commit Author と Commiter を変更する
tags: Git GitHub
author: sea_mountain
slide: false
---
Git のコミットには、Author と Commiter の2つが存在します。
例えば、いつもと違う PC を使ったときに、.gitconfig の設定が違うと、コミットに意図しないメールアドレス・ユーザー名が入ったりします。

Git で見るとこんな感じ

```shell-session
$ git log -1 --pretty=full
commit befdbcd2389373088fe3e83d9c0d401a9de7717d
Author: hogehoge <dummy@example.com>
Commit: fugafuga <test@example.com>

    add test.txt
```

GitHub 上では、コミットに表示される、いつもの自分のアイコンが表示されなくなるので、ちょっと気になります。

そこですでにコミットしてしまった、コミットの Author と Commiter を変更する方法についてまとめます。

# Commiter 変更方法
リポジトリ直下の.gitconfigの設定を追加します。

```shell-session
git config --local user.name sea_mountain
git config --local user.email valid_email@example.com
```

更新したい情報を .gitconfig に設定した後に、--amend で情報を変更します。

```shell-session
git commit --amend
```

# Author 変更方法
上記の Commiter 変更方法では、Author は変更されないので、下記のように、--author オプションを追加してコミットし直します。
 
```shell-session
$ git commit --amend --author="sea_mountain <dummy_email_address@example.com>"
$ git rebase --continue
# 変更されたか確認
$ git log --pretty=full
# すでにプッシュしてしまっているなら、-f が必要になる
$ git push origin hoge
```

# 過去のコミットをすべて変更したいとき
過去のコミットにおける Commiter と Author をすべて変更する方法も有ります。
ただし、push しているコミットの場合は force push が必要になるので注意です。

以下例です。Author と Commiter の指定を書き換えて使って下さい。

```shell-session
$ git filter-branch -f --env-filter "GIT_AUTHOR_NAME='sea_mountain'; GIT_AUTHOR_EMAIL='valid_email@example.com'; GIT_COMMITTER_NAME='sea_mountain'; GIT_COMMITTER_EMAIL='valid_email@example.com';" HEAD 
```

