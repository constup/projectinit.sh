#!/bin/bash

read_password() {
  local password=''
  while IFS= read -r -s -n1 char; do
    [[ -z $char ]] && { printf '\n' >/dev/tty; break; }
    if [[ $char == $'\x7f' ]]; then
        [[ -n $password ]] && password=${password%?}
        printf '\b \b' >/dev/tty
    else
      password+=$char
      printf '*' >/dev/tty
    fi
  done

  echo "$password"
}

in_array() {
  local needle="$1"
  shift
  local element
  for element in "$@"; do
    if [[ "$element" == "$needle" ]]; then
      return 0  # found
    fi
  done
  return 1  # not found
}