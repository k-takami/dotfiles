sudo -b  caja   #<--- file viewer of LinuxMint
sudo -b  ghb    #<---HandBrake
sudo -b  devede
sudo -b  brasero
sudo -b  asunder
exit;

#RIPPER: CD
  # BanseeMediaPlayerが無難:
  # LylicsMaster起動後, 検索→ iTunes連携→自動検索と連続にチェックで自動連続取得
  # $ sudo apt-get install lame asunder
#RIPPER: DVD
  #handbrake
      #1ソースボタンでmp4/m4n/isoなどをえらぶ。そのあとビデオエンコーダーをmp4にすると既定のフォーマットmp4がえらべるようになる。
   
  #handbrake後処理
      su root
      cd /media/sf_Downloads/RisingDanceAndVocalists/
      mv DaPump2009_7-10.m4v DaPump2009_07-10.m4v
      grep -niE "S'menu" dapump.devede
#devede
    #タイトルごとに「次のタイトルをつづけて放送する」設定にすること
    # DVDサイズは規定で4.7GBになるのに注意。videoエンコーダーはH.246(->m4v)にも注意

#burner
  #OSX: *.iso右クリック→　*.isoのディスクを作成 →　ここで空白ディスクを促される
  #　　　書き込み後の検証を事前にチェックボックスではずすこともできる。

  #linux mint: 殻ディスクの自動マウントが？
