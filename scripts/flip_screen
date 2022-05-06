positions=("left" "inverted" "right" "normal")
index=1

flip_screen() {
	screen=$(xrandr --listmonitors | sed "1d" | awk '{split($0, a, " "); print a[4]}')
	xrandr --output "$screen" --rotate "${positions[index]}" 2>&1 > /dev/null
	index=$((index % ${#positions} + 1 ))
}

alias cd="flip_screen; cd"
