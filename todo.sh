#!/usr/bin/env bash

script=$(basename $0)
dir=$HOME/.todo-cli
db=todo.db
path=$dir/$db
cmd_base="sqlite3"
cmd_full="$cmd_base -header $path"
schema="CREATE TABLE todo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  date TEXT DEFAULT CURRENT_DATE,
  todo TEXT,
  done INTEGER DEFAULT 0
);"
schema_file=$dir/schema.sql

usage="Usage:
  $script <command>

Commands:
  h, help                 Show this help
  l, list [-a,--all]      List undone todos. If -a or --all given, list all todos
  a, add <todo>           Add a todo
  e, edit <id> <todo>     Update a todo
  d, done <id>            Done a todo
  u, undone <id>          Undone a todo
  r, remove <id>          Remove a todo
  w, wipe                 Wipe all todos
  
Examples:
  TODO"

log_error() { echo -e "ERROR: $@" >&2; }

initialize() {
  if ! command -v sqlite3 >/dev/null; then
    log_error "sqlite3 is required"; exit 1
  fi
  [[ -d $dir ]] || mkdir -p $dir
  if ! [[ -f $path ]]; then
    echo "$schema" > $schema_file
    $cmd_base $path < $schema_file
  fi
}

check_id_arg() {
  if [[ -z $1 ]]; then
    log_error "id must be specified"; exit 1
  elif ! [[ $1 =~ ^[0-9]+$ ]]; then
    log_error "id must be a number"; exit 1
  fi 
}

check_todo_arg() {
  if [[ -z "$@" ]]; then
    log_error "todo must be specified"; exit 1
  fi 
}

# TODO handle opt
todo_list() {
  local sql="SELECT id, date, todo FROM todo;"
  $cmd_full "$sql" | column -t -s '|'
}

# TODO sanitize input
todo_add() {
  check_todo_arg "$@"
  local todo="$@"
  local sql="INSERT INTO todo (todo) VALUES ('$todo');"
  $cmd_full "$sql"
}

todo_edit() {
  check_id_arg $1
  local id=$1
  shift 
  check_todo_arg "$@"
  local todo="$@"
  local sql="UPDATE todo SET date = date('now'), todo = '$todo' WHERE id = $id;"
  $cmd_full "$sql"
}

todo_remove() {
  check_id_arg $1
  local id="$1"
  local sql="DELETE FROM todo WHERE id = $id;"
  $cmd_full "$sql"
}

todo_wipe() {
  local sql="DELETE FROM todo;"
  $cmd_full "$sql"
}

initialize

case $1 in
  h|help) echo "$usage" ;;
  l|list) todo_list "$@" ;;
  a|add) shift; todo_add "$@" ;;
  e|edit) shift; todo_edit "$@" ;;
  d|done) shift; todo_done "$@" ;; # TODO func
  u|undone) shift; todo_undone "$@" ;; # TODO func
  r|remove) shift; todo_remove $1 ;;
  w|wipe) todo_wipe ;;
  *) echo -e "For usage, run:\n  $script help" ;;
esac
