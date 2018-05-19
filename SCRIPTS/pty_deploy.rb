require "rubygems"
require "expect"
require 'pty'


	STDOUT.puts "Enter the remote name :(heroku or origin)"
	remote=STDIN.gets.chomp
	
	STDOUT.puts "Enter Commit Message:"
	commit_message =STDIN.gets.chomp
	
	STDOUT.puts "Enter New files(No files leave empty)"
	new_files =STDIN.gets.chomp
	
	STDOUT.puts "Enter  the files to commit"
	modified_files = STDIN.gets.chomp
	
	commands = {}
	commands["add"]="git add"+ " "+ new_files if !new_files.empty?
	commands["commit"]="git commit -m '#{commit_message}' #{new_files} #{modified_files}"  if !commit_message.empty? && (!modified_files.empty?  || !new_files.empty?)
	commands["pull"]="git pull #{remote} master"
	commands["push"]="git push #{remote} master"

	def interact(command, error)
		begin
			PTY.spawn("#{command}") do |reader,writer, pid|
				reader.each do |read|
					if error && !error.empty? && read=~/#{error}/
						Process.kill(9, pid)
						puts read
						return "error"
					else
						puts read
					end
				end
			end
		rescue Errno::EIO  
		end
	end
	
	if !remote.empty? && !commit_message.empty? && (!new_files.empty? || !modified_files.empty? )
		commands.each do |key,command|
			puts key
			if key == "add"
				error="did not match any files" 
			elsif key == "pull"
				error="commit your changes or stash them before you can merge|Automatic merge failed|does not appear to be a git repository|The following untracked working tree files would be overwritten by merge|Pull is not possible because you have unmerged files." 
			end
			result=interact(command, error)
			puts "\n\n Error occur Kindly fix that  and run the script." if result == "error"			
			break 	if result == "error"			
		end
	else
		puts "\n\n\n"
		puts "Error: Please enter remote master\n" if remote.empty?
		puts "Error: Please enter Commit Message\n" if commit_message.empty?
		puts "Error: Please enter files for push\n" if (new_files.empty? && modified_files.empty? )
	end
		
