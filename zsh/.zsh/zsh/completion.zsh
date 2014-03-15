unsetopt correct_all
setopt correct nocorrectall
setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle :compinstall filename '$HOME/.zshrc'

# performance tweaks
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache
zstyle ':completion:*' use-perl on

# completion colours
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' completer _complete _match _approximate _7slash 
zstyle ':completion:*:match:*' original only

# allow more mistypes if longer command
zstyle -e ':completion:*:approximate:*' \
	max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# ignore completion for commands we don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

# get rid of .class and .o files for vim
zstyle ':completion:*:vim:*' ignored-patterns '*.(class|o)'

# show menu when tabbing
zstyle ':completion:*' menu yes select

# better completion for kill
zstyle ':completion:*:*:kill:*' command 'ps --forest -u$USER -o pid,%cpu,tty,cputime,cmd'

# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
compdef pkill=killall

# bugged with zsh 4.3.10 for whatever reason
zstyle ':completion:*' file-sort time
#zstyle ':completion:*' file-sort name

# Ignore same file on rm
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

zstyle ':completion:*:wine:*' file-patterns '*.(exe|EXE):exe'

# don't complete usernames (the come from localhost!)
zstyle ':completion:*:(ssh|scp):*' users

# e.g. ls foo//bar -> ls foo/bar
zstyle ':completion:*' squeeze-slashes true

# if in foo/bar don't show bar when cd ../<TAB>
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Prevent lost+found directory from being completed
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found'

# ignore case when completing
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# make some stuff look better
# from: http://ft.bewatermyfriend.org/comp/zsh/zshrc.d/compsys.html
zstyle ':completion:*:descriptions' format "- %{${fg[yellow]}%}%d%{${reset_color}%} -"
zstyle ':completion:*:messages'     format "- %{${fg[cyan]}%}%d%{${reset_color}%} -"
zstyle ':completion:*:corrections'  format "- %{${fg[yellow]}%}%d%{${reset_color}%} - (%{${fg[cyan]}%}errors %e%{${reset_color}%})"
zstyle ':completion:*:default'      \
	select-prompt \
	"%{${fg[yellow]}%}Match %{${fg_bold[cyan]}%}%m%{${fg_no_bold[yellow]}%}  Line %{${fg_bold[cyan]}%}%l%{${fg_no_bold[red]}%}  %p%{${reset_color}%}"
zstyle ':completion:*:default'      \
	list-prompt   \
	"%{${fg[yellow]}%}Line %{${fg_bold[cyan]}%}%l%{${fg_no_bold[yellow]}%}  Continue?%{${reset_color}%}"
zstyle ':completion:*:warnings'     \
	format        \
	"- %{${fg_no_bold[red]}%}no match%{${reset_color}%} - %{${fg_no_bold[yellow]}%}%d%{${reset_color}%}"
zstyle ':completion:*' group-name ''

# manual pages are sorted into sections
# from: http://ft.bewatermyfriend.org/comp/zsh/zshrc.d/compsys.html
zstyle ':completion:*:manuals'       separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections   true

### highlight the original input.
    zstyle ':completion:*:original' \
        list-colors "=*=$color[red];$color[bold]"

### highlight words like 'esac' or 'end'
    zstyle ':completion:*:reserved-words' \
        list-colors "=*=$color[red]"

### colorize hostname completion
    zstyle ':completion:*:*:*:*:hosts' \
        list-colors "=*=$color[cyan];$color[bg-black]"

### colorize username completion
    zstyle ':completion:*:*:*:*:users' \
        list-colors "=*=$color[red];$color[bg-black]"

### colorize processlist for 'kill'
    zstyle ':completion:*:*:kill:*:processes' \
        list-colors "=(#b) #([0-9]#) #([^ ]#)*=$color[none]=$color[yellow]=$color[green]"


