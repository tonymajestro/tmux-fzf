# tmux-fzf
Yet another tmux fzf plugin. Used to quickly navigate between open tmux sessions and windows.

## Dependencies
- [fzf](https://github.com/junegunn/fzf)
- python 3.x

## Screenshot

![tmux-fzf screenshot](/images/screenshot.png)


## Installing
The easiest way to install tmux-fzz is to use [TPM](https://github.com/tmux-plugins/tpm):

```
set -g @plugin 'tonymajestro/tmux-fzf'
```

## Keys
`prefix` + `f`: search for tmux windows in current session

`prefix` + `F`: search for running tmux sessions

You can use the arrow keys or `<C-j>` and `<C-k>` to navigate the fzf results. Hitting enter will switch to the selected tmux session or window. To cancel, press escape or <C-c>.
