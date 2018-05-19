#! /bin/bash
# USAGE:  sh ~/.SCRIPTS/list_snipets4snipmate.sh ruby rails javascript ......other vim-filetypes
list_snippets_for() {
  egrep "^snippet|^#" ~/.vim/snippets/$1.snippets | awk '/^#/ {comment = comment $0} /^snippet/ {print $0 "\t\t" comment; comment=""}'
}

if [ "$1" == "" ]
then
  echo "You must specify at least one file type as an argument to ls_snip"
  exit
fi

for filetype in "$@"
do
  echo `echo $filetype | awk '{print toupper($0)}'`
  list_snippets_for $filetype
  echo
done
