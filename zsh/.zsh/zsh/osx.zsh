export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

if [[ "$OSTYPE" == darwin* ]]; then
	PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
	ANDROID_HOME=/usr/local/opt/android-sdk

	PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
	. $HOME/perl5/perlbrew/etc/bashrc
	PATH=$PATH:/usr/local/Cellar/go/1.2.1/libexec/bin
	GOPATH=$HOME/go
	PATH=$PATH:$GOPATH/bin

	export PATH ANDROID_HOME GOPATH

	alias ls="ls -Gh"
	alias lt="ll -tcr"
fi
