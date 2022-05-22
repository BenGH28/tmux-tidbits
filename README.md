# Tidbits

Just some tidbits that might help you manage your tmux sessions.

**REQUIREMENTS:** [*fzf*](https://github.com/junegunn/fzf) is required

There are 4 operations available to you:
1. killing the session (default: `prefix` + `C-k`)
    - customize with option `@kill-key`
2. list and switch to one of the available session (default: `prefix` + `C-l`)
    - customize with option `@list-key`
3. start a new coding project in a new session (default: `prefix` + `C-n`)
    - customize with option `@new-key`
4. open an existing coding project in a session (default: `prefix` + `C-p`)
    - customize with option `@projects-key`

You can identify where `tmux-tidbits` looks for your coding projects
by working with the option `@projects-dir`. If the directory doesn't exist
then it will be created.

## Custom options
- `@kill-key`: `C-k`
- `@list-key`: `C-l`
- `@project-key`: `C-p`
- `@new-key`: `C-n`
- `@projects-dir`: `~/projects`

## Preview
kill a session
![image](https://user-images.githubusercontent.com/45215137/169681209-95713cb5-f514-494b-b411-52d4b7e34ae2.png)

list a project
![image](https://user-images.githubusercontent.com/45215137/169681162-893b5180-8fa0-4cdc-bf9d-41cb338483cb.png)

open a project 
![image](https://user-images.githubusercontent.com/45215137/169681121-45750275-98ac-4599-9b3f-84e64a63ad68.png)

start a new project
![image](https://user-images.githubusercontent.com/45215137/169681236-412ba4da-4af9-4959-951c-24b1e180a496.png)
