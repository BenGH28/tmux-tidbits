# Tidbits

Just some tidbits that might help you manage your tmux sessions.

**REQUIREMENTS:** [*fzf*](https://github.com/junegunn/fzf) is required

There are 4 operations available to you:
1. killing the session (default: `prefix` + `C-k`)
    - customize with option `@kill-key`
2. listing the sessions (default: `prefix` + `C-l`)
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
