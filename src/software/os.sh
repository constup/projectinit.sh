#!/bin/bash

detect_os () {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Mac OS"
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Windows"
  elif [[ "$OSTYPE" == "msys" ]]; then
    echo "Windows"
  elif [[ "$OSTYPE" == "win32" ]]; then
    echo "Windows"
  else
    echo "Unknown"
  fi
}