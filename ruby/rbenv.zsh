# check whether RBenv is installed.
if $($HOME/.rbenv/bin/rbenv &>/dev/null)
then
	# update PATH to include reference to rbenv.
	export PATH="$HOME/.rbenv/bin:$PATH"

	# Add rbenv's shims directory to your $PATH and set up Bash autocompletion.
	eval "$(rbenv init -)"
fi