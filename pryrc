if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'fin', 'finish'
  Pry.commands.alias_command 'wai', 'whereami'
  # watch Expressionの値を確認し、変わったときにNotificationを表示する
  # wtf? 
  # $       現在行の周辺を表示
  # l 10    現在行の前後10行を表示
  # l -m    現在のメソッド全体を表示
end

if defined?(PryStackExplorer)
  Pry.commands.alias_command 'd', 'down'
  Pry.commands.alias_command 'u', 'up'
  Pry.commands.alias_command 'ss', 'show-stack'
  Pry.commands.alias_command 'sf', 'frame '#goto frame N
end

if defined?(PryRails)
  Pry.commands.alias_command 'rp', 'recognize-path'
  Pry.commands.alias_command 'rpl',  'recognize-path localhost:3000/'
  Pry.commands.alias_command 'srg',  'show-routes --grep '
  Pry.commands.alias_command 'rld',  'reload!'
  #NG 2 below are NG:  alias 聞いていない
  Pry.commands.alias_command 'swms', 'show-models'
  Pry.commands.alias_command 'swm',  'show-model'

 #: recognize-path localhost:3000/my/report/neuroblastoma/genes.html?ajax=true 
 #: recognize-path localhost:3000/my/report/neuroblastoma/genes.html?ajax=true 
 #: show-routes --grep ajax
end

if defined?(PryDoc)
  #  Pry.commands.alias_command 'helppd', 'recognize-path'
  #show-doc,  show-source  ===> aliased ? , $
end
