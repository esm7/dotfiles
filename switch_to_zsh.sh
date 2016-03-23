# Switch to zsh, replacing the current shell, if it exists and not currently
# active.
# * This file must be sourced, not executed! *
# If this file is executed, a subshell is created, usually of /bin/bash or /bin/sh,
# and ZSH_VERSION doesn't exist even if we're using zsh
if [ -z "$ZSH_VERSION" ]; then
	if [ -e /bin/zsh ]; then
		echo "Launching zsh..."
		export SHELL=/bin/zsh
		exec /bin/zsh -l
	else
		echo "Can't find /bin/zsh :("
	fi
else
	echo "In zsh"
fi
