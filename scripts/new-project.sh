#!/usr/bin/env bash

# get better regex support for project name sanitization
shopt -s extglob

get_new_project_name() {
    read -r -p "Enter new project name: " project_name
    # sanitize it for unwanted characters
    project_name=${project_name//+([^A-Za-z0-9])/-}
    echo "$project_name"
}

make_project_repo() {
    repo_path="$1/$project_name"
    mkdir -p "$repo_path"
    curr_dir="$(pwd)"
    cd "$repo_path" || exit
    git init
    cd "$curr_dir" || exit
}

create_new_session() {
    project_name="$1"
    repo_path="$2/$project_name"
    tmux new-session -d -c "$repo_path" -s "$project_name"
}

switch_to_session() {
    project_name="$1"
    tmux switch-client -t "$project_name"
}

new() {
    repo_dir="$1"
    project_name="$(get_new_project_name)"
    make_project_repo "$repo_dir"
    create_new_session "$project_name" "$repo_dir"
    switch_to_session "$project_name"
}

clone() {
    repo_dir="$1"
    read -r -p "repo URL: " project_url
    cd "$repo_dir" && git clone "$project_url"

    # get project name from url and remove .git from the end
    project_name="$(echo "$project_url" | sed -E 's/.*\/(.*)\.git$/'"\\1"/)"
    repo_path="$1/$project_name"
    create_new_session "$project_name" "$repo_dir"
    switch_to_session "$project_name"
}

main() {
    action="$1"
    repo_dir="$2"
    case "$action" in
        new)
            new "$repo_dir"
            ;;
        clone)
            clone "$repo_dir"
            ;;
        *)
            echo "Usage: $0 {new|clone}"
            ;;
    esac
}
main "$1" "$2"
