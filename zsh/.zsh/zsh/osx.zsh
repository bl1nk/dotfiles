export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

if [[ "$OSTYPE" == darwin* ]]; then
	export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
	export ANDROID_HOME=/usr/local/opt/android-sdk

	# ruby gems
	#export GEM_HOME='/usr/local'
	#export PATH=$PATH:/usr/local/opt/ruby/bin
	PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
	# perl cpan
	. $HOME/perl5/perlbrew/etc/bashrc

	alias ls="ls -Gh"
	alias lt="ll -tcr"
fi
