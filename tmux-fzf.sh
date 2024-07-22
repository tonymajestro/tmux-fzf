#! /usr/bin/env bash

set -e
set -u

select_window=true

while (($#)); do
  case $1 in
  --)
    shift
    positional+=("{@[@]}")
    ;;
  -w | --window) select_window=true ;;
  -*) opterr $1 && exit 2 ;;
  *) positional+=("{@[@]}") ;;
  esac
  shift
done

# Select tmux window using tmux
selection=$(tmux list-windows | fzf --tmux)
if [ -z "$selection" ]; then
  exit 0
fi

# Parse tmux list-files output to get window number:
# example:  0: dotfiles- (1 panes) [99x34] [layout b91d,99x34,0,0,0] @
window=$(echo "$selection" | python3 -c "print(input().split(':')[0])")

# Switch to selected tmux window
tmux select-window "-t:$window"
