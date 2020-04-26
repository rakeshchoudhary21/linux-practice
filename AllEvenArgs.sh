echo "Processing the args::$@"

allDigits=true
for x in $@
do
    if [[ ! $x =~ [0-9] ]] # this can take care of preceding + or -
    then    
        echo 'Its Not a digit:'$x
        allDigits=false
        #break
    fi
done

echo $allDigits
result=true
# to excute some stuff using $ u need two (())
for x in $@
do
    if [[ $(($x % 2)) != 0 ]]
    then
        result=false
    fi
done

echo 'All evens:'$result