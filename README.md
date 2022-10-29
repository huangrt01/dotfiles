## dotfiles
* my dotfiles, the design philosophy is illustrated in my [Shell Note](https://github.com/huangrt01/CS-Notes/blob/master/Notes/Output/Shell-MIT-6-NULL.md)
* easy-to-use
```shell
chmod 777 bootstrap.sh
./bootstrap.sh
zsh
```

#### submodules
* zsh plugins: [zplug](https://github.com/zplug/zplug), [fzf](https://github.com/junegunn/fzf), [autojump](https://github.com/wting/autojump.git), [zsh-completions](https://github.com/zsh-users/zsh-completions), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search), [zsh-git-prompt](https://github.com/olivierverdier/zsh-git-prompt)
* vim plugins：[ack.vim](https://github.com/mileszs/ack.vim), [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim), [nerdtree](https://github.com/preservim/nerdtree), [vim-fugitive](https://github.com/tpope/vim-fugitive), [vim-rhubarb](https://github.com/tpope/vim-rhubarb), [ale](https://github.com/dense-analysis/ales)
* `shallow=true'

#### local customization
* shell
```shell
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
```

* git
```shell
[include]
        path = ~/.gitconfig_local
```
* vim
```shell
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
```
* tmux
```shell
if-shell "[ -f ~/.tmux_local.conf ]" 'source ~/.tmux_local.conf'
```

#### Manually install

```sh
sudo apt-get update
sudo apt-get install manpages-dev
sudo apt-get install gdb
```

* iTerm2, powerline-font, brew

```sh
git clone git@github.com:powerline/fonts
cd fonts && ./install.sh
# enter iTerm2/Preferences/Profile/Text/Font/Meslo*
```

* vim-ale related: [shellcheck](https://github.com/koalaman/shellcheck), [write-good](https://github.com/btford/write-good)(or [proselint](http://proselint.com/) )

```shell
brew/apt install shellcheck
npm install -g write-good
```

* MailMaster, WeChat
* [tldr](https://tldr.sh/), fd, rg, [mosh](https://mosh.org/#getting), [tree](http://mama.indstate.edu/users/ice/tree/), ag

```shell
apt install silversearcher-ag
apt install tree

# https://nodejs.org/en/download/package-manager/#installing-node-js-via-package-manager
npm install -g tldr

apt install fd-find
apt install cloc
```

* [hub](https://github.com/github/hub)([usage](https://hub.github.com/#developer)), tig
* [Valgrind](https://valgrind.org/), Perf, stress, [rr](https://rr-project.org/), htop

```shell
sudo apt-get update
sudo apt install zsh
zsh --version

# log out and login back
echo $SHELL
$SHELL --version

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt-get install python3-pip
pip install --upgrade pip
pip install --upgrade setuptools
pip install ipython
pip install ipdb

pip install -i https://pypi.tuna.tsinghua.edu.cn/simple virtualenvwrapper
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
# or
source ~/.local/bin/virtualenvwrapper.sh

# install perf
sudo apt install linux-source
cd /usr/src
tar -xjf linux-source-4.4.0.tar.bz2
cd tools/perf
make # fail! why?
sudo apt install linux-tools-common

perf
# ...
# follow the instructions
# ...
# finish installing perf

apt install stress
apt install htop
```

* python3, pip3, ipython, ipdb, [line_profiler](https://github.com/pyutils/line_profiler), [memory-profiler](https://pypi.org/project/memory-profiler/), [pycallgraph](http://pycallgraph.slowchop.com/en/master/)
```
pip install memory-profiler
pip install line_profiler
pip install pycallgraph
apt/brew install graphviz
# dot -v
```

**Security**:

* [gpg](https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages), [haveged](https://www.digitalocean.com/community/tutorials/how-to-setup-additional-entropy-for-cloud-servers-using-haveged)

```sh
brew install gnupg
```

**Firefox Add-on**

* HTTPS Everywhere, Multi-Account Containers(No Chrome), [uBlock Origin](https://github.com/gorhill/uBlock), 1Password

* [stylus](https://github.com/openstyles/stylus/)
* Full Web Page Screenshots (Chrome: Full Page Screen Capture)

#### Mac 
* iTerm2, Typora
* [hammerspoon](https://github.com/Hammerspoon/hammerspoon)
* [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
