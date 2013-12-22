#some aliases
alias subs="$DIR/../sh-napiprojekt/subs.sh"
alias wallchanger="$DIR/../sh-wall-changer/sh-wall-changer.exe"


#autocompletion for imgop.sh
_imgop()
{
	local cur=${COMP_WORDS[COMP_CWORD]}
	if [[ $COMP_CWORD -eq 1 ]]; then
		COMPREPLY=( $(compgen -W "degrade downgrade fix-anamorphic fix-png stitch" -- $cur) )
	else
		COMPREPLY=( $(compgen -A file -- $cur) )
	fi
}
complete -F _imgop imgop.sh
