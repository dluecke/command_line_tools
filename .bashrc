#!/bin/bash

if [ -r ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

SCRATCH='/Users/davidluecke/scratch/users/davidluecke'
PATH="$PATH:/usr/local/bin/Rscript:/Users/davidluecke/scripts"

export PS1="\W \$ "
export CLICOLOR=1

abspath () {
	if [[ -f $1 ]];then
		pathstring=$(cd $(echo $1|rev|gcut -d '/' -f 1 --complement|rev);pwd)
		echo $pathstring'/'$(echo $1|rev|gcut -d '/' -f 1 |rev)
	fi
	if [[ -d $1 ]];then
		echo $(cd $1;pwd)
	fi
}
export -f abspath

# print the header (the first line of input)
# and then run the specified command on the body (the rest of the input)
# use it on a file: body somecommand <file
# use it in a pipeline, e.g. ps | body grep somepattern
body() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}
export -f body

testfunction () {
	echo $1
}
export -f testfunction
