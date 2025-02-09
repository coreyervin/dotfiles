# Set Zsh as the default shell
export SHELL=$(which zsh)
export ZSH="$HOME/.oh-my-zsh"

# Use the Agnoster theme
ZSH_THEME="agnoster"

# Hide username@hostname in Agnoster prompt (optional)
DEFAULT_USER=$USER

# Enable plugins (ensure they are installed)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting macos)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Enable colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM="xterm-256color"

# Improve Zsh history
HISTSIZE=5000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS    # Ignore duplicate commands
setopt INC_APPEND_HISTORY  # Save commands as they are entered

# Optimize Git prompt speed
ZSH_THEME_GIT_PROMPT_CACHE=1

# Start SSH agent and load keys
# eval "$(ssh-agent -s)" > /dev/null 2>&1
# ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1

# MacOS-specific aliases
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Aliases for convenience
alias ll="ls -lah"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias update="brew update && brew upgrade && brew cleanup"

# Docker Aliases
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

# Docker Compose Aliases
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcr="docker compose restart"

# Kubernetes (k8s) Aliases
alias k="kubectl"
alias kctx="kubectl config use-context"
alias kctxs="kubectl config get-contexts"
alias kns="kubectl config set-context --current --namespace"
alias kpods="kubectl get pods --output=wide"
alias ksvc="kubectl get svc"
alias klogs="kubectl logs -f"
alias kdesc="kubectl describe"
alias kdel="kubectl delete"
alias kexec="kubectl exec -it"
alias kapply="kubectl apply -f"
alias kgetall="kubectl get all --all-namespaces"
alias kportfw="kubectl port-forward"

# Homebrew (Mac package manager)
if command -v brew &> /dev/null; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Start tmux if not already running
if command -v tmux &> /dev/null && [[ -z "$TMUX" ]]; then
  tmux
fi

# Source custom configurations (if any)
[[ -f ~/.zshrc_custom ]] && source ~/.zshrc_custom
eval "$(/usr/local/bin/brew shellenv)"
