# coding: utf-8
# ruby 1.9.x # require 'debugger'
# ruby 1.8.x # require 'rdebug'

# $ sudo gem install rake -v 0.8.4
require 'rake'
require 'erb'
# USAGE: rake install
# ln -fs ~/Dotfiles/ ~/.dotfiles
# mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

desc "install the dot files into user's home directory"

task :uninstall do
  command = "
    sudo rm -r /.VM_HOST /.RAILS_ROOT /.tigrc /.README.md /.BACKUP /.*rc /.SCRIPTS /.SUPPLEMENTS /.gvimrc /.gitignore /git.tgz /.my_rails_root /.oh-my-zsh
    cd ~                                                                          ;
    sudo rm -i  session*  *.diff .sw* .*rc                                        ;
    sudo rm -i  .bash_history .rdebug_hist .irb_history .lesshst .psql_history    ;
    sudo rm -ir .gitignore .gitconfig .rubocop.yml                                ;
    sudo rm -ir .vim* .vim_mru_files .ve_favorite .vt_locations .NERDTreeBookmarks .vim-fuf-cache ;
    sudo rm -ir .dotfiles .SCRIPTS .SI .BACKUP                                    ;
  "
  system command
end

task :install do
  if os.to_s =~ /x$/ || os == :windows
    $PWD = Dir.pwd
    $HOME = ENV['HOME']
  end
  puts "#{$PWD}  ____   #{$HOME}  ____    #{ENV['HOME']} _____   #{os} ______________________"

  unless os == :windows
    install_oh_my_zsh
    switch_to_zsh
  end

  replace_all = false
  files = Dir['*'] - %w[
    Rakefile README.rdoc LICENSE oh-my-zsh
    ATOM AWSCLI CHEATSHEETS LICENSE RAILS_ROOT SCRIPTS SI SUPPLEMENTS VM_HOST HTML README.md vim-neosnippet.tgz win73.vimrc SI.tar.zip WWW_20160515
  ]

  unless os == :windows
    files << "oh-my-zsh/custom/plugins/rbates"
    files << "oh-my-zsh/custom/rbates.zsh-theme"
  end
  files.each do |file|
    system %Q{mkdir -p "#{$HOME}/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else

        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end

      end
    else
      link_file(file)
    end
  end
  #OSX 10.13はcurlだけ標準添付,alpine-linuxはwgetだけ標準添付
  system 'curl "https://drive.google.com/uc?export=download&id=1r6RDufI3w9SMWJc93qw-EmtZwkTnzdY4" -o SI.tar.zip -L'
  # TODO: xcode-select docker & kinematic & raspell 自動化
  # xcode-select --install
  # atom_restore
  # cd ~/Downloads/src
  # system ' curl "https://drive.google.com/uc?export=download&id=1tkI_Ff1QHUfilbkuZ21tOxBZFnCJk5j4" -o DockerCE_18.06osx-EDGE.dmg -L'
  # system curl "https://drive.google.com/uc?export=download&id=1iXTIJXfyFu63qKy6zGFyfqT4e4Qhs2MJa" -o Kitematic (Beta).app.zip -L'
  # Google Chrome
  # https://drive.google.com/open?id=0B6o6bFqaG4IHYV9vZU8xalJrbXM
  system "source ~/.bashrc;"
  result = `mv .git/hooks/pre-commit.sample .git/hooks/pre-commit`
  result = `echo "source ~/.bashrc; " >> .git/hooks/pre-commit `
  result = `echo "rbcrails; mybugstaged; rbwcstaged; # rbprails; #raspell;  " >> .git/hooks/pre-commit `
  if os == :macosx
    result = `echo "__git_complete gibr _git_branch  " >> /usr/local/etc/bash_completion.d/git-completion.bash `
    result = `echo "__git_complete gico _git_checkout" >> /usr/local/etc/bash_completion.d/git-completion.bash `
  end

  puts "#############\n vim を起動して :NeoBundleInstall を実行してください \n #############\n"
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  #TODO: be admin/root before linking/coping
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  elsif file =~ /zshrc$/ # copy zshrc instead of link
    puts "copying ~/.#{file}"
    system %Q{cp "#{$PWD}/#{file}" "#{$HOME}/.#{file}"}
  elsif os == :windows
    puts "coping ~/.#{file}"
    system %Q{ cp -pr "#{$PWD}/#{file}" "/.#{file}"}
  else
    puts "linking ~/.#{file}"
    # copy files if OS is windows. otherwise perform 'ln -S' .
    command =  %Q{ln -fs "#{$PWD}/#{file}" "#{$HOME}/.#{file}"}
    # puts "######### command= #{command} ### ENV[HOME]= #{ENV['HOME']} #####"
    system command
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "#{$HOME}/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end


def os
  require 'rbconfig'
  @os ||= (
    host_os = RbConfig::CONFIG['host_os']
    case host_os
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      :macosx
    when /linux/
      :linux
    when /solaris|bsd/
      :unix
    else
      raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
    end
  )
end

#rm -rf ~/.dotfiles/vim/bundle/**/.git
# su root
# # rm /var/www/.*rc
# ln -s  /var/www/.dotfiles/bashrc  /var/www/.bashrc
# ln -s  /var/www/.dotfiles/vim  /var/www/.vim
# ln -s  /var/www/.dotfiles/vimrc  /var/www/.vimrc
# ln -s  /var/www/.dotfiles/SCRIPTS/  /var/www/.SCRIPTS
# ln -s  /var/www/.dotfiles/irbrc  /var/www/.irbrc
# ln -s  /var/www/.dotfiles/pryrc  /var/www/.pryrc
# ln -s  /var/www/.dotfiles/rdebugrc  /var/www/.rdebugrc
# ln -s  /var/www/.dotfiles/tigrc  /var/www/.tigrc

=begin
###########  刷新手順 ####################
# IE11 でrepo 削除、forkしなおし
# PCで以下；
  rm -rf .dotfiles_old/
  mv .dotfiles/ .dotfiles_old
  git clone https://github.com/k-takami/dotfiles.git
  mv dotfiles/ .dotfiles ;

  cd $_
  # rm -rf * .gitignore
  sudo mv /media/sf_Downloads/dotfiles-master.zip .
  unzip dotfiles-master.zip
  sudo unzip dotfiles-master.zip
  sudo mv dotfiles-master/* .
  sudo cp -pr ../.dotfiles_old/vim .
  sudo rm dotfiles-master*
  sudo chmod -R 775 * ; sudo chmod -R 644 vim; sudo chown -R user:user *
  sudo chmod 644 oh-my-zsh/custom/plugins/rbates/*
  sudo chmod 644 oh-my-zsh/custom/rbates*

  git add . ; girstHD SI.tar.zip
  git rm  vim/plugin/tComment.vim vim/plugin/unimpaired.vim
  unzip SI.tar.zip ; tar xvf SI.tar ; rm SI.tar
  lat ; gst ;

  gicmm "mint17 tmp"
  git push https://k-takami@github.com/k-takami/dotfiles master
  wget https://drive.google.com/open?id=1Uz72XWoXXzm6BSPqmrkBW51jY1pM1Qaa
=end
