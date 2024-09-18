# Dotfiles

See https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

## Use GNU Stow

Example: create symlinks to tmux conf

```bash
cd ~/dotfiles
stow -t ~/ tmux
```

## Refresh font cache

`fc-cache -f -v`

## Lazygit

- Install Lazygit (git ui)
- Install delta for nice diffs
- Configuration of delta should already be available via the .gitconfig file

### Catppuccin theme for delta

- Theme is already configured in .gitconfig
- To have syntax highlighting with theme
    - Install bat
    - Install [Catppuccin bat](https://github.com/catppuccin/bat/tree/main)
