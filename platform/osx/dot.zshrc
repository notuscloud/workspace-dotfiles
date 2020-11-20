# Functions
function log_info(){
  date=$(date)
  echo "INFO: $date - $1"
}

# Context
# Used so we can separate different work context
# zsh theme could can or maybe bin path
# The aim is so we can have a preconfigured zsh environment for different purposes
export ZSH_CONTEXT=${ZSH_CONTEXT:-default}
log_info "Trying to open ZSH_CONTEXT: $ZSH_CONTEXT"

# Look for the correct ~/.zshrc-* files
ZSHRC_FILE_NAME=".zshrc-$ZSH_CONTEXT"
if [[ -e ~/"$ZSHRC_FILE_NAME" ]]; then
  source ~/"$ZSHRC_FILE_NAME"
else
  log_info "Could not find a .zshrc file for selected context $ZSH_CONTEXT, falling back to default"
  source ~/.zshrc-default
fi
