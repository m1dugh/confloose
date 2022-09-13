scripts_count=${#scripts[@]}

display_scripts () {
	echo "Scripts: "
	for i in ${!scripts[@]}; do
		echo "  $((i+1))) ${scripts[$i]}"
	done
	echo 
	echo "  0) quit"
	echo
}

read -p "Target file (default=./.bashrc): " file

if [ -z $file ];
then
	file="./.bashrc"
fi


display_scripts




while true; do
    # Ask for input
    echo -n "Select: "
    read selected

    # Check input is numeric
    re='^[0-9]+$'
    if ! [[ $selected =~ $re ]] ; then
        echo "error: Not a number" >&2
        selected=-1
        continue
    fi

    # Check input is in bounds
    if [ $selected -gt $scripts_count ]; then
        echo "error: Input value too high"
        selected=-1
        continue
    fi

    # Handle exit option (value 0)
    if [ $selected -eq 0 ]; then
		source $file
		echo "Remember to 'source $file'"
        break
    fi

    echo "-----"
    index=$((selected - 1))
    eval "run_${scripts[$index]}"
	echo "${scripts[$index]} saved to $file"

    echo "-----"
    display_scripts
done
