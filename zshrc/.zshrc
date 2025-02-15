# ===============================
# Aliases
# ===============================

# FastFetch (Better `Neofetch`)
alias ff="fastfetch"

# OneFetch (Git Repo Stats)
alias of="onefetch"

# Navigation
alias ..="cd .."

# Lazygit & Lazydocker
alias lg='lazygit'
alias lzd='lazydocker'

# Bat (Better `cat`)
alias cat="bat"

# Eza (Better `ls`)
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2 --icons --git"
alias ls="eza --icons=always"

# ===============================
# Environment Variables
# ===============================

export PATH="/opt/homebrew/bin:$PATH"
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Bun package manager
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ===============================
# Plugins & Enhancements
# ===============================

# Zsh Syntax Highlighting & Autosuggestions
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^w' autosuggest-execute

# Atuin (better history)
eval "$(atuin init zsh)"

# Zoxide (better `cd`)
eval "$(zoxide init zsh)"
alias cd="z"

# Starship (prompt theme)
eval "$(starship init zsh)"

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ===============================
# FZF Configuration
# ===============================

# Set up FZF key bindings and fuzzy completion
eval "$(fzf --zsh)"

# FZF Color Theme
export FZF_DEFAULT_OPTS="
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
  --color=selected-bg:#45475a
  --multi"

# Use `fd` as the default finder
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Custom FZF path completion using `fd`
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# File & Directory Preview for FZF
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced FZF Command Customization
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

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
