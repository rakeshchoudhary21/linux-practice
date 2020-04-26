# ls -l lists stuff. and remember, the letter d at start of row(with permission set) indicates
# Directory
echo `pwd`
test=`ls -l`
echo $test

echo `wc -c Notes.sh`

# cat command accepts any number of files and combines into single output

echo `touch test.txt`
#echo `cat >> test.txt`

echo `cat Notes.sh test.txt`

# less command is cool. 
# It lets us read files page by page. hitting space takes us to next page and b takes us back
# up and down arrow keys for going up and down.
# to quit less view just hit q

# head and tail let us quickly skim over files..
# head prints first 10 lines of file. we can set lines with -n option
# tail does the opposite

# the > symbol means to take output to start of the file .. >> means at end
# single > will endup overwriting the file. meaning existing content is lost.

echo `echo 'RAKESH IS THE BEST' > test.txt`

echo `ls -l ~ >> SomeFile.txt`

# mv command can be used for renaming stuff. cp for creating copies.
# to copy a folder use -r option (recursive)

# trash folder location is ~/.local/share/Trash

# copying stuff from command line in linux is using ctrl+shift+c on mac its just cmd+c

# rm cmd needs -r to delete folder. Remember first delete to trash folder then permanantly
# shred cmd does the same(delete), also unlink cmd.
# also `find fileName -delete` does the same

# find commnd -- find ~/Desktop/LinuxLearning/ *.sh


# search with less::: after less type / to do search
# found entries are highlighted... now press n to go to next entry. Press Shift n to go to previous entry
# and obviously q to quit.

# apropos media
# above cmd lists out all available media players.
# man -h is for human readable format 

# cal to see calendar and cal -y to see entire year

# like everything else we can do ls with wildcards...
# ls appserver_pangea.log* will list all pangea log files

# u can use grep directly.. no need to cat it. grep 'My log' appserver_pangea.log

# egrep is more powerful. we can search characters with wild cards between them... like egrep 'p.p' note.txt --- can return pop,pip.

# egrep 's+s' note.txt --  will match sas, sssas , ssssssssas etc
# egrep 's*s' notes.txt -- will match as, aas, kkkks, saaaaaaaaaaaaaas,...

# we can set count of matches;;;;; egrep 's{2}a' --- will match ssa
# egrep 's{2,5}' -- matches 2 to 5 occurrances of letter s

# egrep '(as){2}' --- matches a letter with as occuring twice.. adjascently.. rasas is ok. wont match raskas

# echo 'RAAKAAS' | egrep '(K.{2}){1}' matches one occurance of k followed by any 2 chars

# regex-- \w word \d digit \s space \W for non word \D for non digit

# egrep '\s' tedt.txt -- will return all lines having space in them
# egrep \d -- for all lines with digits

# -v in linux if for invert. egrep -v '\w' test.txt -- this will match everything non word

# in regex [] is for adding multiple different entries to be matched. () is for groups.
# [aeiou] will match all vowels. (aeiou) will match literal aeiou. ^ in [] means no match

# 2 commnds to find the recently entered commands:::
# history and cat ~/.bash_history


# we can add alias in .bash_profile or .bash_rc file, to reload bash file use source command

# diff test.txt test2.txt -- shows difference between files.
# sdiff tes.txt test2.txt -- show difference side by side

# computing hashes of files... this lets us ensure that the file we got is genuine by comparing our generated hash with the hash
# the provider has sent
# md5 notes.txt --- md5
# shasum notes.txt -- sha1

# head -n 5 test >> test2 -- will copy the first 5 lines from one file to the other.

# grep "[aeiou]$" states.txt -- to find states whose name end with vowel

# ls -a -- is to see hidden files along with normal files.. ls -al is to see with permission

# uniq and sort commands
# cat ~/.bash_history | uniq -u | sort -- to list all historical cmnds. then unique among them then sort
# uniq -D is to list all the duplicates.
# uniq -u is for unique in the file.

# empty file---- > file.txt

# make file 
# format :: [target]: [dependencies(usually files)]
#                    <a tab in next line> [commands]
# like below -- test.txt is target of make..(make test.txt) and it executes command in next line---touch
# test.txt:
#	touch test.txt
#hello:
#	echo 'HELLO'

# if make target is run again without any change in the makefile than it wont work. it would say 'target' is up to date.
# all is a dummy target used to execute multiple targets in one go.

# clean target is usually used to delete the files... make clean
# basic maths with shell

echo '10/2' | bc -l # this is how u do math

# in a executable file we could do like below
expr 10 / 2 # output 5
expr 22 / 7 # outputs 3 since bash rounds down to nearest number
# for proper math use bc - l with echo. this is bench calculator.

# bc can take a file as an argument
bc /tmp/tem.sh # executes the arithmatic argument from the file
# bc -i will start interactive shell for bench calculator

# variables
num=2
echo 'Num is='$num
let num=$num+2 # this works in terminal...
echo 'Num is now='$num

# u can execute stuff in variables, this is called command substitution
rakesh=$(echo rakesh | wc -c)
echo 'chars in name rakesh='$rakesh

# $ can be used to insert vars inside the strings.

# when u execute a shell script , there are a few args available inside the script.
# $1 is the first argment in front of script name ex: sh Notes.sh SOME_AG , below prints SOME_AG
# there are $N args
# $@ is an array we can iterate over

echo 'ONE-'$1

for x in $@
    do
        echo $x
    done

echo 'Number of args: '$#  # prints number of command line args

#The exit statue of last command ran is store in $?
echo $? # if its zero then last program exited proper

true
echo $? # true has exit status of 0
false
echo $? # this is non zero

# operators AND and OR
echo true && true
echo true && false
echo true || false
echo false || true # false since true is second op and its not even executed

# conditional operators are always between [[]] only in bash

[[ 4 -gt 3 ]] && echo t || echo f # prints t

[[ 3 -gt 4 ]] && echo t || echo f # prints f, things are evaluated left to right 3 > 4 is false

# ops:: -gt -ge -le -lt -eq -e(file exists) -d(dir exists) -z(length of string is zero) -n(length of string is non zero)

[[ -e $Notese.sh ]] && echo 'YEA--' || echo 'No files with that name'
[[ -z "" ]] && echo 'ZERO LENGTH STRING'

# regex using =~
[[ rhytms =~ [aeiou] ]] && echo 'Contains vowels' || echo 'No vowels'
[[ Rakesh =~ [aeiou] ]] && echo 'Contains vowels' || echo 'No vowels'

# =~ for regex
# = for string comparison [[ $rakesh = "rakesh" ]]
# !=  for not equals for strings
# ! for negation

# these work in bash only
if [[ 5 -eq 5 ]]
then
    echo 'Yes 5==5'
fi

# string compare using -eq ignores case R is equal to r
if [[ $1 -eq $2 ]]
then   
    echo "$1 is equal to $2"
else 
    echo "$1 aint same as $2"
fi

if [[ $1 -eq $2 ]]
then
    echo "$1 is equal to $2"
elif [[ $(($1 % 2)) -eq 0 ]]
then 
    echo "Its even $1"
else
    echo "It aint event $1"
fi

# every if has to have fi, if nested ifs then inside the then again close the if with fi

# arrays

my_arr=(0 1,2 3) # space will create the next item not the comma
echo ${my_arr[0]}

# to get all values $my_arr will return first item 
echo ${my_arr[*]}
echo $my_arr # prints first item only
my_arr[3]='New_va'
echo ${my_arr[2]} # there is no index out of bounds here. 3rd item is New_va and 2nd item nothing
echo ${#my_arr[*]} #get length
echo ${#my_arr} #this wont work since it returns length of first item that is 1
#slice
echo ${my_arr[*]:1:3}

# append array
my_arr+=(ek aur value)
echo ${my_arr[*]}
echo $((${#my_arr[*]} + ${#rakesh})) # this works
echo ${#rakesh} # this prints one only

# brace expansion
echo {a..e} # print a b c d e
echo k{a..z} # prints ka kb kc ... kz u get the idea
echo {a..z}{1..26} 

echo 8{a..z}9 #8 will appear on left of each letter from a..z and 9 on the right
start=1
end=10
eval echo {$start..$end} #this also works, we need to add eval though otherwise wont work

echo {{a..c},{1..4}} # works a b c 1 2 3
echo {a..z}{1..5}  # each of letter from first set appears with each of letter from second set. so 26*5 total entries
echo {What,where,who,why}? # must be comma separated

# for with braces
evenCount=0;
for item in {1..100}
do
    if [[ $((item % 2)) -eq 0 ]]
    then
        evenCount=$(($evenCount + 1))
    fi
done

echo "Event count from 1 to 100 is $evenCount"

# to create a list in bash with predefined elements use single small bracket
list=(0 0 1 1)
echo $list # this will print only the first item
list[0]=100
echo $list

# this will get only the first item, u need the entire seq
for k in $list
do
    echo $k
done

for k in ${list[*]}
do
    echo $k
done

for file in $(ls) 
do
    echo $file
done

#whatever appears inside $() should be an executable command, u cant put a sequence there

x=5
while [[ x -ge 0 ]]
do
    echo $x
    let x-=1 # we can use let for doing simple arithmatic here
done

#the yes command makes infinitely printintg y till ctrl c is pressed
yes YES # will print YES till killed

# egrep "^[AEIOU]" someFile.txt will get names starting with vowels, "[AEIOU]$" will get ending with vowels