https://code.visualstudio.com/docs/python/python-tutorial

```vim
:read ~/.config/Code/User/keybindings.json
```

```json
[
    {
        "key": "alt+shift+l",
        "command": "editor.action.format",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+`",
        "command": "workbench.action.terminal.focus"
    },
    {
        "key": "ctrl+e",
        "command": "workbench.action.quickOpen"
    },
    {
        "key": "ctrl+`",
        "command": "workbench.action.focusActiveEditorGroup",
        "when": "terminalFocus",
    },
    {
        "key": "ctrl+f",
        "command": "-workbench.action.terminal.focusFindWidget",
        "when": "terminalFocus"
    },
]
```

# Remote Docker Compose
- https://devblogs.microsoft.com/python/remote-python-development-in-visual-studio-code/
- https://code.visualstudio.com/docs/remote/containers
- https://github.com/Microsoft/python-sample-tweeterapp

## Getting Started
Install https://code.visualstudio.com/insiders/

Run `code-insiders .`, reload (because vscode sees `.devcontainer.json`)

Install python extension (to be able to set breakpoints)

Ctrl+Shift+P --> `Remote-Containers: Rebuild Container`

Run via `Debug` > `Python: Django`

## Notes
set `$HOME` in Dockerfile so vscode can install stuff as the unprivileged user
`app`
https://github.com/Microsoft/vscode-remote-release/issues/22

Command must be `sleep infinity` (see `docker-compose.vscode.yml`), because
vscode needs to run `runserver` as described in `.vscode/launch.json`
