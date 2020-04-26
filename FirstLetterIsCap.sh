echo 'Please enter your name'
read name

if [[ $name =~ [A-Z]{1}[a-z] ]]
then 
    echo 'Yea'
fi

echo "You are $name"