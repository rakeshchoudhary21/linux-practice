# This is how u create a function, and remember u get the inputs via $@ and $1 to N etc
function addStuff {
    # below variable is accessible outside this function and can be used to access the result of calling this function,
    # we can set result as local so it wont be available outside
    result=0
    local locResult=0
    for input in $@
        do
            let result+=input # when doing this way u dont need to add $input
            # let result=result+$input
            let locResult=$locResult+$input
        done

    echo "Result $result"
    echo "Loc Result $locResult"
}

#addStuff 1 2 3 4 # this is how u invoke a function

# if u invoke this file using source FunctionDemo.sh then addStuff becomes a global function that can be invoked diretly
# at the terminal

# above is a function without side effect. Side effect means altering the current state, like writing to file or moving it around

# to capture the result of local, we need to use command substitution

res=$(addStuff 1 2 3)
echo "Command substitution::$res"