ext() {
	for file in $@; do
		extract "$file"
	done
}

bind '"\C-e":"extract\C-m"'
