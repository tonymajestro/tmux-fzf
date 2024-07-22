#! /usr/bin/env bash

set -e
set -u

usage() {
  echo "usage:"
  echo "tmux-fzf [-s | --session]   (select tmux session)"
  echo "tmux-fzf [-w | --window]    (select tmux window)"
}

select_window=false
select_session=false

while (($#)); do
  case $1 in
  --)
    shift
    positional+=("{@[@]}")
    ;;
  -w | --window) select_window=true ;;
  -s | --session) select_session=true ;;
  -*) usage && exit 2 ;;
  *) positional+=("{@[@]}") ;;
  esac
  shift
done

if [ "$select_window" == true ] && [ "$select_session" == true ]; then
  echo "error: cannot select window and session at the same time"
  usage
  exit 2
fi

if [ "$select_window" == false ] && [ "$select_session" == false ]; then
  usage
  exit 2
fi

# Select tmux window
if [ "$select_window" == true ]; then
  # Select tmux window using tmux
  selection=$(tmux list-windows | fzf --tmux)
  if [ -z "$selection" ]; then
    exit 0
  fi

  # Parse tmux list-files output to get window number:
  # example:  0: dotfiles- (1 panes) [99x34] [layout b91d,99x34,0,0,0] @
  window=$(echo "$selection" | python3 -c "print(input().split(':')[0])")

  # Switch to selected tmux window
  tmux select-window "-t: $window"
fi

# Select tmux session
if [ "$select_session" == true ]; then
  # Select tmux session using tmux
  selection=$(tmux list-sessions | fzf --tmux)
  if [ -z "$selection" ]; then
    exit 0
  fi

  # Parse tmux list-files output to get session number:
  # example:  0: 5 windows (created Mon Jul 22 10:14:44 2024) (attached)
  session=$(echo "$selection" | python3 -c "print(input().split(':')[0])")

  # Switch to selected tmux window
  tmux switch-client -t "$session"
fi
