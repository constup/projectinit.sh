#!/bin/bash

#######################################
# Draw a simple separator.
# Arguments:
#  None
#######################################
draw_separator () {
  echo "--------------------------------------"
}

#######################################
# Set text color in terminal.
# Arguments:
#   1 - one of the offered values from the `case` statement.
# Example:
#   set_color('red');
#######################################
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
