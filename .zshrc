# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------
# Homebrew (Apple Silicon)
# ------------------------------
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ------------------------------
# Oh My Zsh
# ------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Hide username@hostname in prompt
DEFAULT_USER=$USER

# Plugins
plugins=(
  git
  macos
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ------------------------------
# Terminal & Color Settings
# ------------------------------
export TERM="xterm-256color"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ------------------------------
# History Settings (Improved)
# ------------------------------
HISTSIZE=5000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# ------------------------------
# Git Prompt Optimization
# ------------------------------
ZSH_THEME_GIT_PROMPT_CACHE=1

# ------------------------------
# SSH Agent (Optional)
# ------------------------------
# eval "$(ssh-agent -s)" > /dev/null 2>&1
# ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1

# ------------------------------
# macOS Aliases
# ------------------------------
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# ------------------------------
# General Aliases
# ------------------------------
alias ll="ls -lah"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias update="brew update && brew upgrade && brew cleanup"

# ------------------------------
# Docker Aliases
# ------------------------------
alias d="docker"
alias dps="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias dpa="docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias dstop="docker stop"
alias drm="docker rm"
alias dim="docker images"
alias drmi="docker rmi"
alias dexec="docker exec -it"
alias dlogs="docker logs -f"
alias dcompose="docker compose"
alias dclean="docker system prune -af"

# Docker Compose
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcr="docker compose restart"

# ------------------------------
# Kubernetes Aliases
# ------------------------------
alias k="kubectl"
alias kctx="kubectl config use-context"
alias kctxs="kubectl config get-contexts"
alias kns="kubectl config set-context --current --namespace"
alias kpods="kubectl get pods -o wide"
alias ksvc="kubectl get svc"
alias klogs="kubectl logs -f"
alias kdesc="kubectl describe"
alias kdel="kubectl delete"
alias kexec="kubectl exec -it"
alias kapply="kubectl apply -f"
alias kgetall="kubectl get all --all-namespaces"
alias kportfw="kubectl port-forward"

# ------------------------------
# Auto-start tmux (Optional)
# ------------------------------
# if command -v tmux &> /dev/null && [[ -z "$TMUX" ]]; then
#   tmux
# fi

# ------------------------------
# Custom Overrides
# ------------------------------
[[ -f ~/.zshrc_custom ]] && source ~/.zshrc_custom

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
