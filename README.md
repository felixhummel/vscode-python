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
set `$HOME` https://github.com/Microsoft/vscode-remote-release/issues/22

Ctrl+Shift+P --> `Remote-Containers*`

Note the `.vscode/launch.json`
