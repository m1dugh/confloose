save_cfl() {

	if [ "$#" -ne 1 ]; then
		echo "Usage: save_cfl <file> << <value>"
		return 1
	fi

	file=$1

	_write() {
		tee -a $1 &> /dev/null
	
	}

	_write $file <&0

}

