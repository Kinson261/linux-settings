ZSH_THEME="intheloop" # set by `omz`

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# vscode
export VSCODE_SUGGEST=1

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY

# plugins=(git zsh-autosuggestions zsh-syntax-highlighting emotty emoji colorize tailscale)
plugins=(git zsh-syntax-highlighting emotty emoji colorize tailscale)

source $ZSH/oh-my-zsh.sh

PATH="/home/kinson/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/kinson/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/kinson/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/kinson/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/kinson/perl5"; export PERL_MM_OPT;

export PATH=$HOME/.local/bin:$PATH

# oh-my-posh
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/sim-web.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/stelbent.minimal.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/emodipt-extend.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/nordtron.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/1_shell.omp.json)"
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/catppuccin_frappe.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/hunk.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/if_tea.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/kushal.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/multiverse-neon.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/negligible.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/the-unnamed.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/tokyonight_storm.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.oh-my-posh-themes/ys.omp.json)"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	$HOME/yazi/target/release/yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias yazi='y'

# superfile
# spf
spf() {
    os=$(uname -s)

    # Linux
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi

    # macOS
    if [[ "$os" == "Darwin" ]]; then
        export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
    fi

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}
alias spf='spf --fix-hotkeys --fix-config-file'

# obsidian ollama
alias ollama_obsidian="sudo systemctl stop ollama.service && OLLAMA_ORIGINS=app://obsidian.md* ollama serve"

# carapace-bin
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# tailspin (alias tspin) ==> journal viewer
export PATH=$HOME/.cargo/bin:$PATH

# Markitdown

# Syncthing completions
autoload -U +X bashcompinit && bashcompinit
complete -C /usr/bin/syncthing syncthing

export GPG_TTY=$(tty)

# yadm autocompletion
fpath=(~/.config/yadm/completion/zsh/ $fpath)
autoload -U compinit
compinit

# the fuck
eval $(thefuck --alias fuck)

# fzf
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# eza
alias ls="eza --color=always --icons=always"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# execute after start
fastfetch
# y
# spf
