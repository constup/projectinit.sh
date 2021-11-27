# Bash cheat sheet

This page can help you write your own components for ProjectInit.sh.

## Reading user input directly

### Options

Use `read`.

- `-p`: read as prompt. Don't add a trailing new line before trying to read input.
- `-r`: Backslash does not act as an escape character. The backslash is considered to be part of the line.

### Examples

- Read into global variable:
  - multi-line input: 
      ```shell
    echo "Your project's root directory:"
    read -r PROJECT_ROOT_DIR
      ```
  - single line input:
      ```shell
      read -rp "Your project's root directory: " PROJECT_ROOT_DIR
      ```
- Read into local variable:
  - multi-line input:
      ```shell
    echo "Your project's root directory:"
    local project_root_dir
    read -r project_root_dir 
      ```
  - single line input:
    ```shell
    local project_root_dir
    read -rp "Your project's root dir: " project_root_dir
    ```
