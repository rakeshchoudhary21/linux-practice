lab=(jef roger brain)
lab[3]=test
lab=("${lab[*]}" "${lab[*]}")
echo ${#lab[*]}