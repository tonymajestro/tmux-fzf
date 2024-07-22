#! /usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
tmux bind-key f run-shell "$CURRENT_DIR/tmux-fzf.sh -w >/dev/null || true"
tmux bind-key F run-shell "$CURRENT_DIR/tmux-fzf.sh -s >/dev/null || true"
