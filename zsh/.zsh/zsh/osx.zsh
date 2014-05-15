export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

if [[ "$OSTYPE" == darwin* ]]; then
	PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
	#ANDROID_HOME=/usr/local/opt/android-sdk

	#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
	#. $HOME/perl5/perlbrew/etc/bashrc
	PATH=$PATH:/usr/local/Cellar/go/1.2.1/libexec/bin
	GOPATH=$HOME/go
	PATH=$PATH:$GOPATH/bin

	export PATH GOPATH #ANDROID_HOME

	alias ls="ls -Gh"
	alias lt="ll -tcr"
	alias sshtunnel="sshuttle --dns -vvr markus@kuchen 0/0"
fi
