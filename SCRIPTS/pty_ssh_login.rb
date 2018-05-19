require 'rubygems'
require 'pty'
require 'expect'



	STDOUT.puts "Enter the Host name"
	hostname =STDIN.gets.chomp
	STDOUT.puts "Enter the User name"
	username =STDIN.gets.chomp
	STDOUT.puts "Enter the Password"
	password = STDIN.gets.chomp
	
gemset="sample_test"
ruby_version="ruby-2.1.2"
rvm={:rvm_install=>["rvm use #{ruby_version}  --install","Using /home/#{username}/.rvm/gems/#{ruby_version}"],:rvm_use=>["rvm use #{ruby_version}@#{gemset} --create  --default","Using /home/#{username}/.rvm/gems/#{ruby_version} with gemset #{gemset}"]}
gems={:gem_installing_libv8=>"gem install libv8 -v 3.16.14.3",:gem_installing_therubyracer => "gem install therubyracer -v 0.12.1",:gem_installing_rails=> "gem install rails -v 4.1.1",:exit=>"exit"}

begin
	PTY.spawn("ssh  #{username}@#{hostname}") do |reader,writer, pid|
		puts reader.expect(/#{username}@#{hostname}'s password:/,timeout=5)
		writer.puts("#{password}")
		reader.expect(/\$|#{username}@#{hostname}'s password:/).each do |password_matched|
			if password_matched.match(/\$/)
				puts password_matched
				rvm.each do |key,command|
					puts "#{key.to_s.gsub("_"," ")}..."
					writer.puts(command.first)
					reader.expect(/\$/).each do |result|
						if result.include?(command.last)
							puts command.last
						else
							puts "Error Occur While Installing #{ruby_version}...."
							sleep(3) 
							Process.kill(9, pid)
						end
					end
				end	
				gems.each do |key,command|
					puts "#{key.to_s.gsub("_"," ")}..."
					puts reader.expect /\$/
					writer.puts(command)
				end					
			else
				puts "Worng Username or Password...."
				Process.kill(9, pid)
			end		
		end		
	end
rescue Errno::EIO  
end

