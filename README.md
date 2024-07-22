# tmux-fzf
Yet another tmux fzf plugin

## Dependencies
- [fzf](https://github.com/junegunn/fzf)
- python 3.x

## Installing
The easiest way to install tmux-fzz is to use [TPM](https://github.com/tmux-plugins/tpm):
```
set -g @plugin 'tonymajestro/tmux-fzf'
```

## Usage
tmux-fzf defaults to using `prefix` + `f`. After pressing `prefix` + `f`, a fzf window will pop up displaying a list of all the tmux windows for the current session. You can use the arrow keys or `<C-j>` and `<C-k>` to navigate the fzf results. Hitting enter will switch to the selected tmux window. To cancel, press escape or <C-c>.
