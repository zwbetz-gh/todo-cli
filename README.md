# TODO CLI

Get sh*t done via command line

## Install

### Mac and Linux

1. Download it:
    ```
    curl -o todo https://raw.githubusercontent.com/zwbetz-gh/todo-cli/master/todo
    ```
1. Make it executable:
    ```
    chmod +x todo
    ```
1. Add it to your `PATH`

### Windows

1. Install [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
1. Do steps from _Mac and Linux_ section above

### Dependencies

`todo` stores your todos in a sqlite database, so the `sqlite3` CLI needs to be installed. If you don't have it, [download it](https://www.sqlite.org/download.html), or install it from your favorite package manager

## Usage

```
Usage:
  todo <command>

Commands:
  h, help                 Show this help
  l, list [-a]            List undone todos. If -a given, list all todos
  a, add <todo>           Add a todo
  e, edit <id> <todo>     Edit a todo
  d, done <id>            Done a todo
  u, undone <id>          Undone a todo
  r, remove <id>          Remove a todo
  w, wipe                 Wipe all todos
  n, nuke                 Nuke and recreate todo database
```
