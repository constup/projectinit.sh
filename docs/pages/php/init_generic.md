# PHP - Init Generic

```shell
cd bin/php
sh init_generic.sh
```

## Can be used for:

- Creating a new composer package (library, project,...);
- Continuing work on an existing composer package;
- Continuing work on an existing project written in some PHP framework (ex. Symfony);

## Configured tools

This script will configure the following for you:

- Git repository (either existing or new)
- Git username and email for the repository/project
- `.gitignore` file
- composer (as PHAR)
- composer package (project, library,...)
- PHP CS Fixer (as PHAR)
- PHP CS Fixer rules 
- PHPUnit (as PHAR)
- PHPUnit configuration file
- `src` and `tests` base project directories

**NOTE:** If you have already configured some of the tools, files or directories listed above, ProjectInit.sh will 
not change them. It will only add new configuration files or directories to your project if they are missing.

## Prerequisites for running the script

- PHP
- Git
- wget

---
[[The list of tools](../../list_of_tools.md)]
