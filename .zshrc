export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode reminder
ZSH_THEME="dracula"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias battery="pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto"
alias brewupdate="brew update && brew upgrade"
alias c="clear && pwd"
alias D="npm run dev"
alias dev="cd ~/Dev"
alias gl="git log --oneline"
alias gll="git log --graph --oneline --all"
alias gb="git branch --sort=committerdate | xargs" # add `-n1` for newline per branch 
alias gbv="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(align:35)%(color:yellow)%(refname:short)%(color:reset)%(end) - %(color:red)%(objectname:short)%(color:reset) - %(color:green)%(committerdate:relative)%(color:reset))'"
alias gs="git status --short"
alias gsb="git status --short --branch"
alias git-undo="git reset HEAD@{1}"
alias lsn="ls --color=never"
alias pnet="cd ~/Dev/PNetHomepagePkg"
alias reload="source ~/.zshrc"
alias storage="echo Used $(df -kh . | tail -n1 | awk '{print $5}') of $(df -kh . | tail -n1 | awk '{print $2}') \($(df -kh . | tail -n1 | awk '{print $4}') free\)"
alias update="softwareupdate -i -r && brew update && brew upgrade"
alias shellconfig="code $HOME/.zshrc"

function complexExample() {
    if [ "$1" != "" ]
    then
        echo $1
    else
        echo "default value when no input parameter given"
    fi
}
function findit() { lsof -i :"${1:?no port given}" | grep -e CLOSED -e LISTEN; }
function git-reset() {git reset --hard HEAD~${1:?enter number of commits to reset, inclusive}; }
function git-squash() {
    git reset --soft HEAD~${1:?enter number of commits to squash, inclusive} && git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})";
}
function killit() { command kill -9 "${1:?no PID given}"; }

TERMINAL_PROMPT='' # construct prompt, comment/uncomment the following lines to create the proper prompt - this relies on having the `dracula.zsh-theme` installed with all OPTION variables set to true
DRACULA_TIME_FORMAT="%_I:%M%p" # override time format
# DRACULA_ARROW_ICON='-> ' # override the default arrow icon (for ligatures e.g. => -> ->>)
TERMINAL_PROMPT+='%(1V:%F{yellow}:%(?:%F{green}:%F{red}))%B$(dracula_arrow)' # show arrow/anything pre-prompt
TERMINAL_PROMPT+='%F{green}%B$(dracula_time_segment)' # show time
TERMINAL_PROMPT+='%F{magenta}%B$(dracula_context)' # show user/context
TERMINAL_PROMPT+='%F{blue}%B%4~ ' # shows up to 4 folders deep
TERMINAL_PROMPT+='$DRACULA_GIT_STATUS' # git branch and icon
TERMINAL_PROMPT+='%(1V:%F{yellow}:%(?:%F{green}:%F{red}))%B$(dracula_arrow end)' # show prompt on new line
TERMINAL_PROMPT+='%f%b' # Ensure effects are reset
export PS1=$TERMINAL_PROMPT
