echo 'Please Enter something'
read input

echo "You entered::$input"

# actually below can check only if entire string has some letters in it.
if [[ $input =~ ^([a-zA-Z]) ]];
then   
    echo 'All letters'
else
    echo 'Something not letter in '$input
fi

# this version is more solid as it can tell if entire string is numeric or not.
if [[ $input =~ ^([0-9 ]*$) ]]
then 
    echo 'Its integer'
else 
    echo 'Not a number'
fi