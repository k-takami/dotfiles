# coding: utf-8
# XXX: `sudo gem install debugger byebug rdebug sqlite3 pry-debugger `
require_relative 'common'
@apps_root = @option[:from]
@mode      = @option[:mode]

  def puts_command_under_wildcard_dir(command)
    Dir.glob("#{@apps_root}").sort.each do |dir|
      result =  ` #{ command.sub("$dir",@apps_root) } `
      puts "■■■  コマンド #{command} の結果 =============================== \n #{result} \n" unless (result.nil? || result.empty?)
      puts "\n"
    end
  end

  Dir.chdir File.dirname(@apps_root)

  # 新規Railsアプリケーション解析コマンド
  # <--- ER解析
  # ERD = gem railsloady:  https://qiita.com/zaru/items/8227686ebee9f519985b
    # "gem 'railroady' >> Gemfile "
    # `bundle install`
    # `bundle exec rake diagram:all`
  puts_command_under_wildcard_dir "grep -nirE '(has|have|belongs)_' $dir/app/models/* "
  puts_command_under_wildcard_dir "ls -alt                            $dir/db/* --include=*create*rb --include=schema.rb"
  puts_command_under_wildcard_dir "grep -nirE '(lock_version|lockfile)'              $dir/db/migrate/*create*rb "
  puts_command_under_wildcard_dir "grep -nirE 't.string'              $dir/db/* --include=*create*rb --include=schema.rb"
  # <--- task/scheduler/ 解析
  puts_command_under_wildcard_dir "find                               $dir/* | sort | less |grep -nE '$dirw+\/batches.+rb'"
  puts_command_under_wildcard_dir "find                               $dir/* | sort | less |grep -nE '$dirw+\/.+\.rake$' | grep -v 'vendor/bundle'"
  puts_command_under_wildcard_dir "find                               $dir/lib/tasks/ -name '*.rake' |xargs ls -alt |sort"
  # <--- 初期データ seed/fixture 解析
  puts_command_under_wildcard_dir "find                               $dir/* | sort | less |grep -nE '$dirw+\/db\/seed.+rb'"
  puts_command_under_wildcard_dir "grep -lnirE 'csv'                  $dir/db/seed* " #|xargs vi"
  puts_command_under_wildcard_dir "grep -lnirE 'group'                $dir/db/* --include=00*rb  --include=schema.rb "
  puts_command_under_wildcard_dir "grep -lnirE 'group'                $dir/db/* --include=201*rb --include=schema.rb "

