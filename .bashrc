#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Tabcompletion with sudo
complete -cf sudo

# Run the keychain before we connect anywhere
alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && ssh'

# Shutdown stuff
alias reboot='sudo reboot'
alias halt='sudo poweroff'

# Truecrypt aliases
# ex. tcm [-k /keyfile/path] /device/path
alias tcm='sudo truecrypt --text --fs-options=users,uid=$(id -u),gid=$(id -g),fmask=0113,dmask=0002 --mount' 
alias tcu='sudo truecrypt --text -d'

# Don't do tedious sudo for netcfg
alias netcfg='sudo netcfg'

# Keymap switching
alias se='setxkbmap -layout se && xmodmap ~/.Xmodmap'
alias us='setxkbmap -layout us && xmodmap ~/.Xmodmap'

# Powersave in usermode
alias hibernate='sudo pm-hibernate'
alias suspend='sudo pm-suspend'

# Internet access check
alias p8='ping -n 8.8.8.8'

# Launch eclips
alias eclipse='/home/anders/tools/adt-bundle-linux-x86_64/eclipse/eclipse'

# Unpack .tar.gz
alias tgz='tar xzf'

# Quiet bc start
alias bc='bc -q'

# Enable / disable automatic locking
alias lock='/usr/bin/slimlock'
alias lockon='xautolock -enable'
alias lockoff='xautolock -disable'

# Tor browser
alias tbb="tor-browser-en"

# Audo ctrl
alias mute="amixer sset Master,0 mute"
alias unmute="amixer sset Master,0 unmute"
alias speaker-on="sed -i 's/card [0-9]/card 1/' ~/.asoundrc"
alias speaker-off="sed -i 's/card [0-9]/card 0/' ~/.asoundrc"

# Color for grep
alias grep="grep --color"

# Color code man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

# Color in less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

# Python startup
export PYTHONSTARTUP=~/.pythonrc

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/anders/perl5";
export PERL_MB_OPT="--install_base /home/anders/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/anders/perl5";
export PERL5LIB="/home/anders/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/anders/perl5/bin:$PATH";
