export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

if [[ "$OSTYPE" == darwin* ]]; then
	export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
	export PATH=$PATH:/usr/local/opt/ruby/bin
	export PATH=$PATH:/usr/local/Cellar/go/1.2.1/libexec/bin
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOPATH/bin
	. $HOME/perl5/perlbrew/etc/bashrc

	alias ls="ls -Gh"
	alias lt="ll -tcr"
	alias q="qlmanage -p"
fi
