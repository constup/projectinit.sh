#!/bin/bash

draw_separator () {
  echo "--------------------------------------"
}

set_color () {
  case $1 in
    'reset color')
      tput sgr0
      ;;
    'black')
      tput setaf 0
      ;;
    'red')
      tput setaf 1
      ;;
    'green')
      tput setaf 2
      ;;
    'yellow')
      tput setaf 3
      ;;
    'blue')
      tput setaf 4
      ;;
    'purple')
      tput setaf 5
      ;;
    'cyan')
      tput setaf 6
      ;;
    'white')
      tput setaf 7
      ;;
    *)
      tput sgr0
      ;;
  esac
}
