#==以下はruby版のTeraTerm Macro的シナリオ ==============
if __FILE__ == $PROGRAM_NAME # <-- $PROGRAM_NAMEはRailsにくみこむと"bin/rails"になる
  if ARGV[0] =~ /(help|\-h)/
    puts "---HELP----
    #        usage: ruby /opt/enju-flower/release/sftp_and_other_commands.rb
    "
    exit!
  end
  @db = ARGV[1]
end

# *.tgz最新にして SFTP #################################
# 単純にこのスクリプトを ruby release/sftp_and_other_commands.rb みたく実行すると
# ローカルの/home/tv-jo15rtをワークディレクトリーとして
# 検証用サーバーまで最新のgit developブランチの内容を取得してtgz二個(git.tgz, newmgt.tgz)に圧縮し
# その後検証用サーバーにsftp転送する
# 完了後、検証用サーバーでの後続操作をもとめるﾒｯｾｰｼﾞを出す。

system 'sudo sh /opt/enju-flower/release/prep_tzg_files.sh'
shellcommands = <<-"SCENARIO"
ssh password@host_or_ip_address
some_password_here
sftp>
put /remote/path/to/put/the/file.tgz
  # ref: mput new*.tgz
ls *tgz
bye;
SCENARIO
GeneralTools.expect_and_send_by_script(shellcommands)
puts "\n\n 検証サーバーへの移送がおわりました。検証サーバーでの \n 後続処理コマンド \n 実行を検討してください\n\n"
exit

# 工事中：BACKUP ##################
shellcommands = <<-"SCENARIO"
ssh password@host_or_ip_address
some_password_here
$
cd /opt
ls -alt
echo -e '\n社内gitのパスワードを次に適宜入力してください\n'
sudo -b tar zcvf app_name.`date '+%Y%m%d'`.tgz  app_name
exit;
SCENARIO

# POSTGRESQL操作  ##########################################
shellcommands = <<-"SCENARIO"
psql -U db_instance_name -h #{@db};

#
select count(*) from some_table;
\q
SCENARIO
# GeneralTools.expect_and_send_by_script(shellcommands)

# BASIC SUDO pattern #################################
shellcommands = <<-"SCENARIO"
sudo sh /some/path/to/the/script.sh
some_password_here
#
SCENARIO


