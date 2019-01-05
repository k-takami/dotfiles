# XXX: `sudo gem install debugger byebug rdebug sqlite3 pry-debugger `
# USAGE: $ ruby ~/dotfiles/SCRIPTS/ror_01_analyze_app.rb [-f from-path]

require_relative 'common'
@apps_root = @option[:from]
@mode      = @option[:mode]

def puts_command_under_wildcard_dir(command)
  Dir.glob(@apps_root.to_s).sort.each do |_dir|
    result = ` #{ command.gsub('$dir', @apps_root) } `
    puts "■■■  コマンド #{command} の結果 =============================== \n #{result} \n" # unless result.nil? || result.empty?
    puts "\n"
  end
end

Dir.chdir File.dirname(@apps_root)

# 新規Railsアプリケーション解析コマンド
p ''
p '# <--- ER解析'
# ERD = gem railsloady:  https://qiita.com/zaru/items/8227686ebee9f519985b
# "gem 'railroady' >> Gemfile "
# `bundle install`
# `bundle exec rake diagram:all`
puts_command_under_wildcard_dir "grep -nirE '(has|have|belongs)_' $dir/app/models/* "
puts_command_under_wildcard_dir 'ls -alt                            $dir/db/* --include=*create*rb --include=schema.rb'
puts_command_under_wildcard_dir "grep -nirE '(lock_version|lockfile)'              $dir/db/migrate/*create*rb "
puts_command_under_wildcard_dir "grep -nirE 't.string'              $dir/db/* --include=*create*rb --include=schema.rb"
p ''
p '<--- task/scheduler/ 解析'
puts_command_under_wildcard_dir 'ls -alt                            $dir/batches.+rb '
puts_command_under_wildcard_dir "find                               $dir -name '*.rake' | grep -v 'vendor/bundle' " # FIXME
# exit
# p "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
p ''
p '# <--- 初期データ seed/fixture 解析'
puts_command_under_wildcard_dir "find                               $dir/* | sort | less |grep -nE '$dir/db/seed.+rb'"
puts_command_under_wildcard_dir "grep -lnirE 'csv'                  $dir/db/seed* " # |xargs vi"
puts_command_under_wildcard_dir "grep -lnirE 'group'                $dir/db/* --include=00*rb  --include=schema.rb "
puts_command_under_wildcard_dir "grep -lnirE 'group'                $dir/db/* --include=201*rb --include=schema.rb "
p ''
p '# <--- 初期データ seed/fixture 解析'
puts_command_under_wildcard_dir "grep -hnirE 'config.wrappers' $dir/config -C1"
p ''
p "# Seedありマスターanalyzer  vim で出力結果を　:%s/\d\d*: *// | sort u してください"
puts_command_under_wildcard_dir "grep -hnirE '\.(create|new)' $dir/db/seeds"
p ''
p "# webアプリ常用変数 vim で出力結果を　:%s/\d\d*: *// | sort u | %s/\ncurrent_/|/ してください"
puts_command_under_wildcard_dir "grep -honirE 'current_[0-9a-zA-Z]+' $dir/app $dir/lib"
