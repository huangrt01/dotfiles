if type -p brew >/dev/null; then
 echo "Brew is installed."
else
 echo "Brew is not installed."
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# https://stackoverflow.com/questions/72345515/mac-os12-4-python-error-failed-to-locate-python
sudo ln -s /Library/Developer/CommandLineTools/usr/bin/python3 /Library/Developer/CommandLineTools/usr/bin/python

git clone https://github.com/powerline/fonts
cd fonts && ./install.sh
cd .. & rm -rf fonts
# enter iTerm2/Preferences/Profile/Text/Font/Meslo*

