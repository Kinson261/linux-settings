# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

eval "$(oh-my-posh init bash --config ~/.oh-my-posh-themes/sim-web.omp.json)"
# eval "$(oh-my-posh init bash --config ~/.oh-my-posh-themes/stelbent.minimal.omp.json)"
# eval "$(oh-my-posh init bash --config ~/.oh-my-posh-themes/emodipt-extend.omp.json)"
# eval "$(oh-my-posh init bash --config ~/.oh-my-posh-themes/nordtron.omp.json)"

# carapace-bin
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
source <(carapace _carapace)

