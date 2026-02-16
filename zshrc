# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.zsh_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.config/zsh/zsh_aliases ]; then
    . ~/.config/zsh/zsh_aliases
fi

# Private configurations unique to each system this will run on.
# This file should be used for aliases and exports that are not 
# common among all the computers zsh with run on.
if [ -f ~/.zprofile ]; then
  . ~/.zprofile
fi

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# Add gopath bin to PATH
export PATH="$PATH:$HOME/go/bin"

# Change default editor used by sudoedit
export EDITOR='nvim'

# Use neovim whenever you open a man page
export MANPAGER='nvim +Man!'

# Set up fzf key bindings and fuzzy completion
# fzf keybindings you will use most will likely be the following:
# ctrl+t
# **
# To learn more, please see fzf github page.
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd for listing path candidates.
# - The first agrument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1" 
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Useful keybindings for utilizing fzf with git.
# See: https://github.com/junegunn/fzf-git.sh
source ~/.config/zsh/fzf-git.sh

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$' {}"   "$@" ;;
    ssh)          fzf --preview 'dig {}'              "$@" ;;
    *)            fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
  esac
}

# ---- Bat (better cat) ----
export BATH_THEME="gruvbox-dark"

# ---- zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

# ---- Enable plugins that are found in the zsh folder ----
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search.zsh
# source ~/.config/zsh/you-should-use.plugin.zsh
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/kube-ps1/kube-ps1.sh

# History substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.npm-global/bin:$PATH"
