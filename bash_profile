export HOMEBREW_NO_AUTO_UPDATE=true
export PATH="/usr/local/opt/opencv@2/bin:$PATH"
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/huangrt01/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/huangrt01/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/huangrt01/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/huangrt01/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/huangrt01/google-cloud-sdk/path.bash.inc' ]; then . '/Users/huangrt01/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/huangrt01/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/huangrt01/google-cloud-sdk/completion.bash.inc'; fi
