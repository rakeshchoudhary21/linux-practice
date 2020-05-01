echo 'This is the guessing game'
numOfFiles=`ls -l | grep '^-' | wc -l`
echo 'Guess the number of files in current dir'
read guess
echo 'Your guess:'$guess
keepRunning=true

while ($keepRunning)
do
	if [[ $guess -eq numOfFiles ]]
	then 
		echo 'Congrats your are right'
		keepRunning=false
	else
		echo 'Lets guess again'
		read guess
	fi
done
