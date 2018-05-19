#vimbrowse.pl
	cpan LWP::UserAgent
		In addition, the vim plugin synmark.vim is required. This is vim script 1128, available at:
			http://vim.sf.net/scripts/script.php?script_id=1128
			cp -r vim/* ~/.vim; cp -r perl ~/.vim; cp -r extra/* ~/.vim;
			:helptags ~/.vim/doc

	#after installing perldoc
		"bin/vimbrowse.pl
		perldoc vimbrowse.pl
		perldoc browser.pod
		or
		vimbrowse.pl --man
			you@ecolnux:~/.vim$ grep -inRI "ViewSource" . "*.*m"

