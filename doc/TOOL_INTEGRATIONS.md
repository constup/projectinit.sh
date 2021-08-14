# Integrations

Integrations are optional. You can use scripts from a terminal. However, you can integrate scripts into other tools (like IDEs and editors).

## PHP Storm

### PHP Storm - Windows

You must have bash Windows executable. `bash.exe` can be found, for example, in Git for Windows or Cmder.

Each `.sh` file in `./build/` directory can be integrated as a separate External Tool in PHPStorm.

Open PHPStorm settings (`Ctrl+Alt+s`), go to `Tools > External Tools` and add an external tool for the desired script with the following parameters:

- `Program` - Full path of `bash.exe` on your Windows machine;
- `Arguments` - Full path to the bash script;
- `Working directory` - `$ProjectFileDir$`
- Check the `Make console active on message in stdout` and `Make console active on message in stderr` checkboxes.

Additionally, you can set the `Group` parameter of the external tool to a group of your choice. If a group with the desired name doesn't exist, you can just type it in and it will be created automatically. Otherwise, select the group from the dropdown.

---

[Back to README.md](../README.md)