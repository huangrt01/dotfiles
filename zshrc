# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source ~/.bash_profile
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
source $ZSH/oh-my-zsh.sh
export HOMEBREW_NO_AUTO_UPDATE=true
export PATH="/usr/local/opt/opencv@2/bin:$PATH"
export PATH=$HOME/valgrind/bin:$PATH
export VALGRIND_LIB=~/valgrind/lib/valgrind/

# User configuration

export MANPATH="/usr/local/man:$MANPATH"
export PATH=~/.mybin:${PATH}
for file in ~/.mybin/*
do
	if test -f $file
	then
		source $file
	fi
done

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim' #mvim
fi

# ZSH-VIM Mode
bindkey -v

TZ='Asia/Shanghai'; export TZ

# ZPlug configuration
if [[ ! -f $HOME/.zplug/init.zsh ]] {
	echo "ZPLUG not installed!!!"
}
source ~/.zplug/init.zsh

# use thefuck: double-click ESC
OMZPLUGIN=("git" "python" "vi-mode" "thefuck")
OMZCUSPLUGIN=("zsh-syntax-highlighting" "zsh-autosuggestions" "zsh-history-substring-search" "zsh-completions")

for plug in "${OMZPLUGIN[@]}"
do
    zplug "$ZSH/plugins/$plug/$plug.plugin.zsh" , from:local
done
for plug in "${OMZCUSPLUGIN[@]}"
do
    zplug "$ZSH/custom/plugins/$plug/$plug.plugin.zsh" , from:local
done
if ! zplug check --verbose; then
    echo 'Run "zplug install" to install'
fi
# Then, source plugins and add commands to $PATH
zplug load --verbose


eval $(thefuck --alias)
if [ -f ~/.zshrc_local ]; then
	source ~/.zshrc_local
fi


# Test if ~/.aliases exists and source it
if [ -f ~/.aliases ]; then
    source ~/.aliases
	echo "source aliases"
fi

AUTOJUMP="$ZSH/custom/plugins/autojump"
if [[ ! -d ~/.autojump ]] {
	echo "autojump not installed!!!"
}

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
if [[ ! -d $HOME/.fzf ]] {
	echo "fzf not installed!!!"
}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export CLICOLOR=1
export TERM=xterm-256color

# Fix GPG signing failed bug
export GPG_TTY=$(tty)
# GPG Key
GPGKEY="FA27DC667CF8ACBEAB82282E499E970F57682D66"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$ZSH/custom/plugins/zsh-git-prompt/zshrc.sh"
# PROMPT='%B%m%~%b$(git_super_status) %# '
#. $HOME/anaconda3/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
source ~/.prompt
build_prompt

# fix vim tab
rm ~/.zcompdump*
rm ~/.zplug/zcompdump*


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/data01/home/huangruiteng/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/data01/home/huangruiteng/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/data01/home/huangruiteng/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/data01/home/huangruiteng/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

