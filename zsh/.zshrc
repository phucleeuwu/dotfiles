# ===============================
# Aliases
# ===============================

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# Navigation
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# Lazygit & Lazydocker
alias lg="lazygit"
alias lzd="lazydocker"

# Git Repo Stats
alias of="onefetch"

# FastFetch (Better `Neofetch`)
alias ff="fastfetch"

# Bat (Better `cat`)
alias cat="bat"

# Fd (Find alternative)
alias fdf="fd --type=f --hidden"  # Find files only
alias fdd="fd --type=d --hidden"  # Find directories only

# Ripgrep (Better `grep`)
alias rgt="rg --type"  # Search by file type, e.g., `rgt js "function"`

# Eza (Better `ls`)
alias ls="eza --icons"
alias l="eza -l --icons --git -a"
alias ld="eza -lD --icons --git -a"
alias lf="eza -lf --icons --git -a"
alias lt="eza --tree --level=2 --long --icons"  # No --git here since it's for long format
alias tree="eza --tree --icons"  # No --git here either
alias la="eza -a --icons"  # No --git here, as it's unnecessary

# Zoxide (Better `cd`)
eval "$(zoxide init zsh)"
alias cd="z"

# ===============================
# Environment Variables
# ===============================

export PATH="/opt/homebrew/bin:$PATH"
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# ===============================
# Zinit Plugin Manager 
# ===============================

# Load Zinit (using the cache)
source /opt/homebrew/opt/zinit/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Zinit Ice options for speed
zinit ice wait lucid depth"1"

# Load Plugins with these options
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light jeffreytse/zsh-vi-mode
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-completions
zinit light phucleeuwu/zsh-syntax-highlighting

# Additional Alias and Completions
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
zinit snippet OMZP::sudo
zinit snippet OMZP::brew

# ===============================
# Plugins & Enhancements
# ===============================

# Atuin (Better History)
eval "$(atuin init zsh)"

# Starship (Prompt Theme)
eval "$(starship init zsh)"

# ===============================
# FZF Configuration
# ===============================
eval "$(fzf --zsh)"

# Fzf Tab Completion
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# Set up FZF key bindings and fuzzy completion

# FZF Color Theme
export FZF_DEFAULT_OPTS="
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
  --color=selected-bg:#45475a
  --multi"

# ===============================
# Yazi (Better File Manager)
# ===============================
y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

autoload -Uz compinit && compinit
