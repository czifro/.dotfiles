echo "Configuring shell..."

export PROFILE_CONFIG="$HOME/.zprofile"
source "$HOME/.config/zsh/env/common"

unset_env
reset_env

# Load tool configurations
local tools=($(ls $ZSH_TOOLS_DIR))
for tool in ${tools[@]}; do
  source "$ZSH_TOOLS_DIR/$tool"
done

# Load environment configurations
# Loading after tools to allow for environment specific overrides
local envs=($(ls $ZSH_ENV_DIR))
for env in ${envs[@]}; do
  if [ "$env" = "common" ]; then
    # Don't load twice
    continue
  fi
  source "$ZSH_ENV_DIR/$env"
done

unset_env
set_env

