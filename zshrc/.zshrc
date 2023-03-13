if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#Need to replace with fine grained token
export GITHUB_TOKEN=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
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
yabaiRunning="` brew services list | grep yabai | awk '{ print $2}'`"
skhdRunning="` brew services list | grep skhd | awk '{ print $2}'`"
if [[ $yabaiRunning != 'started' ]]; then
	brew services start yabai
fi
if [[ $skhdRunning != 'started' ]]; then
	brew services start skhd
fi

# brew services start spacebar
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/Users/michael/.local/bin:$PATH
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"
export PATH="/usr/local/bin/nvim:$PATH"
export PATH="~/.local/bin/:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export ALACRITTY="/Applications/Alacritty.app/Contents/MacOS/alacritty"
export PATH="$PATH:$ALACRITTY"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Launch rails console
alias rc='docker-compose exec cg-api bundle exec rails c'

# Launch rails conosle for read only DB
alias rcro='heroku run rails c -a cg-api-readonly'

# Launch rails console for sandbox DB
alias rcsb='heroku run rails c -a cg-api-sandbox'
# Migrate database
alias rdm='docker-compose exec cg-api bundle exec rails db:migrate'

# Rollback database migration by 1 step
alias rbdm='docker-compose exec cg-api bundle exec rails db:rollback'

# Attach pry debugger
alias rp='docker attach $(docker-compose ps -q cg-api)'
# GIT SCRIPTS
alias gitswitch='git branch | gum filter | xargs git switch'
# GREP RUBY SNIPPETS
function test_snippet() {
	# This will grab a range from the specified file
	# sed '2,4!d' somefile.txt
	# Need to grep results, and save line numbers to array
	# then step through line numbers showing 1-2 lines above/below for context
	# allow user to choose to ignore, delete, or replace offending items
	grep -F -c '/' ~/dev/chronograph/app/models/util_models/Util.rb
	grep -F -no '/' ~/dev/chronograph/app/models/util_models/Util.rb

	grep -F -c '\' ~/dev/chronograph/app/models/util_models/Util.rb
	grep -F -no '\' ~/dev/chronograph/app/models/util_models/Util.rb

	grep -F -c 'self.' ~/dev/chronograph/app/models/util_models/Util.rb
	grep -F -no 'self.' ~/dev/chronograph/app/models/util_models/Util.rb
}
alias pullTenant='sh ~/dev/chronograph/scripts/pull-tenant.sh'
# Other shortcuts
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dce-api='docker-compose exec cg-api'
alias dce-doc='docker-compose exec cg-doc'
alias dce-gql='docker-compose exec cg-gql'
alias dce-irr='docker-compose exec cg-irr'
alias web-up='npm run dev -- app'
alias api-up='docker-compose up'
alias api-reup='docker-compose up --build'
alias clearnode="rm -rf node_modules/.cache/hard-source"
#
alias zr='source ~/.zshrc'
alias lvimconfig='nvim ~/.config/lvim/config.lua'
alias zc="nvim ~/.zshrc"
alias kr="brew services restart yabai; brew services restart skhd;"
function keyupgrade {
	brew services stop yabai
	brew services stop skhd
	# brew services stop spacebar
	brew upgrade yabai
	brew upgrade skhd
	# brew upgrade spacebar
	brew services start yabai
	brew services start skhd
	# brew services start spacebar
}
alias searchlog="git log --grep="
alias v="nvim"
alias v.="nvim ."
alias disabledock="defaults write com.apple.dock autohide-delay -float 1000; killall Dock"
alias enabledock="defaults delete com.apple.dock autohide-delay; killall Dock"
alias pull-tenant="sh ~/dev/chronograph/scripts/pull-tenant.sh"
alias clearhistory="tmux list-panes -s | sed 's/:.*//g' | xargs -n 1 tmux clear-history -t"
alias ta="tmux a -t gruvmachine"
tmux a -t gruvmachine
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions
