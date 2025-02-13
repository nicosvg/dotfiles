zoxide init fish | source

# Aliases
alias lg="lazygit"
alias n="nvim"
# Yarn
alias y="yarn"
alias ytu="yarn test:unit"
alias yti="yarn test:integration"
alias yct="yarn check-types"
alias yct="yarn check-types"
# Mob
alias ms="mob start 10"
alias mn="mob next"
alias md="mob done"

# set color theme for prompt
set theme_color_scheme nord

# Config Rust
source "$HOME/.cargo/env.fish"
