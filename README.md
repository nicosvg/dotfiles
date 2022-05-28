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
