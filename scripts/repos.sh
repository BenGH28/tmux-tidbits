#!/bin/bash

repos() {
	choice=$(/usr/bin/ls -A $1 | fzf --reverse --prompt="project: ")

	[ -z $choice ] && exit 0

	exists=$(tmux list-sessions | grep "$choice" | awk '{print $1}' | sed 's/://')

	case $exists in
	$choice)
		#it already exists so just switch to it
		tmux switch-client -t $choice
		;;
	*)
		# make a new session
		tmux new-session -d -c $1/$choice -s $choice
		# switch to that session
		tmux switch-client -t $choice
		;;
	esac
}

repos $1
