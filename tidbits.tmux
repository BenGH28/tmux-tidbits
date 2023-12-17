#! /usr/bin/env bash

# The MIT License (MIT)

# Copyright (c) 2022 Ben Hunt

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $CURRENT_DIR/scripts/util.sh

default_kill_key="C-k"
default_list_key="C-l"
default_projects_key="C-p"
default_new_key="C-n"
default_projects_dir="$HOME/projects/"
projects_dir=$(get_tmux_option "@projects_dir" "$default_projects_dir")
win_width=$(get_tmux_option "@tidbit_win_width" 80)

tmux bind-key $(get_tmux_option "@kill-key" "C-k") display-popup -E -h 10 -w $win_width "$CURRENT_DIR/scripts/kill-session.sh"
tmux bind-key $(get_tmux_option "@list-key" "C-l") display-popup -E -h 10 -w $win_width "$CURRENT_DIR/scripts/list-sessions.sh"
tmux bind-key $(get_tmux_option "@projects-key" "C-p") display-popup -E -h 10 -w $win_width "$CURRENT_DIR/scripts/repos.sh $projects_dir"
tmux bind-key $(get_tmux_option "@new-key" "C-n") display-popup -E -h 3 -w $win_width "$CURRENT_DIR/scripts/new-project.sh $projects_dir"
