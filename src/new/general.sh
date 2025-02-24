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