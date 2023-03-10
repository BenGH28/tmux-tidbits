#!/usr/bin/env bash

# get better regex support for project name sanitization
shopt -s extglob

project_name=""
repo_path=""

get_project_name() {
	read -p "Enter new project name: " project_name
	# sanitize it for unwanted characters
	project_name=${project_name//+([^A-Za-z0-9])/-}
}

make_project_repo() {
	repo_path="$1/$project_name"
	mkdir -p $repo_path
	curr_dir=$(pwd)
	cd $repo_path
	git init
	cd $curr_dir
}

create_new_session() {
	tmux new-session -d -c $repo_path -s $project_name
}

switch_to_session() {
	tmux switch-client -t $project_name
}

new() {
	get_project_name
	make_project_repo $1
	create_new_session
	switch_to_session
}

new $1
