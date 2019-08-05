# TODO CLI

Get sh*t done via command line

## Install

### Mac and Linux

1. Download it:
    ```
    curl -s -o todo https://raw.githubusercontent.com/zwbetz-gh/todo-cli/master/todo
    ```
1. Make it executable:
    ```
    chmod +x todo
    ```
1. Add it to your `PATH`

> **Protip:** rename `todo` to `t` for even less typing. 

### Windows

1. Install [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
1. Do steps from _Mac and Linux_ section above

## Dependencies

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
  wipe                    Wipe all todos
  nuke                    Nuke and recreate todo database
```

## Examples

```
$ todo a Buy milk
Added 'Buy milk'

$ todo a Buy eggs
Added 'Buy eggs'

$ todo a "Refill Millie's tennis balls"
Added 'Refill Millie's tennis balls'

$ todo l
id  date        todo
--  ----        ----
1   2019-07-25  Buy milk
2   2019-07-25  Buy eggs
3   2019-07-25  Refill Millie's tennis balls

$ todo e 2 Buy a lot of eggs
Edited 'Buy eggs' to be 'Buy a lot of eggs'

$ todo l
id  date        todo
--  ----        ----
1   2019-07-25  Buy milk
2   2019-07-25  Buy a lot of eggs
3   2019-07-25  Refill Millie's tennis balls

$ todo d 2
Done 'Buy a lot of eggs'

$ todo l -a
id  date        done  todo
--  ----        ----  ------
1   2019-07-25  [ ]   Buy milk
2   2019-07-25  [x]   Buy a lot of eggs
3   2019-07-25  [ ]   Refill Millie's tennis balls

$ todo u 2
Undone 'Buy a lot of eggs'

$ todo l -a
id  date        done  todo
--  ----        ----  ----
1   2019-07-25  [ ]   Buy milk
2   2019-07-25  [ ]   Buy a lot of eggs
3   2019-07-25  [ ]   Refill Millie's tennis balls

$ todo r 2
Removed 'Buy a lot of eggs'

$ todo l
id  date        todo
--  ----        ----
1   2019-07-25  Buy milk
3   2019-07-25  Refill Millie's tennis balls

$ todo wipe
Wiped todos

$ todo nuke
Nuked and recreated todo database
```
