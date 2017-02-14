#Line below this is called a shebang, it indicates to command line which 
#program to use to execute the script. Thus, the line below tells command line
#to run the script in the bash program. However, if the default program 
#already running is bash, deleting this line doesn't make a difference.
#!/bin/bash

# Below this is an if, then statement. The $# is a special parameter telling
# you the number of arguments to script.
# $0 expands to the name of the shell script. If bash is invoked with a file 
# of commands, then $0 is set to the name of the file. It often comes with 
# a usage message. The statement means, if the number of arguments to script
# (the filename) is not supplied after the script name with the bash
# command prompt, then display a usage message and die. Overall, if..else...fi
# tells the script to make a choice based on the success or failure of a 
# command and to excute all commands up to fi.  
if [ $# -eq 0 ]; then
	echo "Usage: $0 filename"
	exit 1
fi

# This line of command below specifies that the filename is the first argument
# specified in the command, and thus
# our saccharomyces_cerevisiae.gff file. Without this line, echo just prints "The number
# of genes in  is " and doesn't know what filename to look in. 
filename=$1

# The echo command prints out what is on the screen following the echo command,
# in this case the phrase "The number of genes in $filename is ". And because the
# previous line of scipt specified the filename, the $filename command
# will now insert that filename into the phrase it's echoing.
# The -n option means to not output the trailing new line of text. 
echo -n  "The number of genes in $filename is "

#The first line, cat $filename says to open up the whole file, in this case
# saccharomyces_cerevisiae.gff, and then pipe the contents of that file
# into the grep command. The grep command, with the specification -v
# will look through the whole file and look for everything that does not
# have a number sign at the beginning of the line (specified
# in the single quotes). The ^ before the # anchors
# the number sign to the beginning of the line. After grep has 
# identifed everything not matching a # at the beginning of the line,
# next it pipes that data into the cut -f3 command. The specifier -f
# isolates a certain field in the command cut, which will cut out sections 
# of your file. Thus, cut -f3 will cut out the third field in the
# already grepped text. This is the field in the file that
# lists whether or not the entry is a gene. Next, this 3rd field
# will be piped into the grep command again to pull out 
# only those lines that include the word "gene". That output
# will be piped to the word count command, which with the 
# -l specifier will count the number of lines
# and output that back into the end of the phrase 
# "The number of genes in $filename is ".  
cat $filename | 
	grep -v '^#' |
	cut -f3 |
	grep gene |
	wc -l

