#!/bin/bash
typeset -i dotfiles_ver=$(cat ~/dotfiles/version.txt)
LAST_VERSION_FILE=~/.last_dotfiles_version.txt

compatible=0
if [[ -f "$LAST_VERSION_FILE" ]]; then
	typeset -i last_run_ver=$(cat $LAST_VERSION_FILE)
	if (( dotfiles_ver == last_run_ver )); then
		compatible=1
	fi
fi
if [ $compatible -eq 0 ]; then
	echo "Dotfiles version is incompatible, must reset it, break now or wait"
	sleep 3
	cd ~
	rm -rf dotfiles
	git clone https://github.com/esm7/dotfiles.git && dotfiles/install
	exit 1
fi
echo $dotfiles_ver > $LAST_VERSION_FILE
