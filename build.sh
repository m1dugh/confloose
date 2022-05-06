#!/bin/bash

# the final file
OUTPUT_FILE="confloose.sh"

# the base64 encoded final file
RESULT="confloose_min.sh"

#cleans the ouput file
echo "#!/bin/bash" > "$OUTPUT_FILE"

# adds tools to final file
for tool in tools/*; do
	cat $tool >> "$OUTPUT_FILE"
done

# Export list of scripts
echo "scripts=($(ls scripts/ | sed -e 's/\..*$//'))" >> "$OUTPUT_FILE"

# expot script files wrapped up in functions
for script in scripts/*; do
	name="$(basename $script)"
	echo "run_$name () {" >> "$OUTPUT_FILE"
	cat $script >> "$OUTPUT_FILE"
	echo "}" >> "$OUTPUT_FILE"
done

# exports mains script
cat run.sh >> "$OUTPUT_FILE"

base64 "$OUTPUT_FILE" > "$RESULT"

rm "$OUTPUT_FILE"

