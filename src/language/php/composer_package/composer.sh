#!/bin/bash

ask_composer_library_config() {
  echo ""
  echo "Composer library name (format: <your_brand>/<your_library_name>):"
  read -r projectinit_composer_library_name
}