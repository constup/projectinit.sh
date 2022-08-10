# PHP - Init Generic

```shell
cd bin/php
sh init_generic.sh
```

## Can be used for:

- Creating a new composer package (library, project,...);
- Creating a new Symfony 5 application (web, command line or API);
- Creating a new Symfony 6 application
- Continuing work on an existing composer package;
- Continuing work on an existing project written in some PHP framework (ex. Symfony);

## Features

This script can perform the following for you:

- Create a Git repository if it doesn't exist, or use an existing one
- Configure Git username and email for the repository
- Add a generic `.gitignore` file, if your project doesn't have it already
- Download composer (as PHAR) to your project root directory
- Set up a new composer package (project, library,...)
- Download PHP CS Fixer (as PHAR) to your project root directory
- Add generic PHP CS Fixer rules, if your project doesn't have them already 
- Download PHPUnit (as PHAR) to your project root directory
- Add generic PHPUnit configuration file, if your project doesn't have one already
- Create `src` and `tests` base project directories

**NOTE:** If you have already configured some tools, files or directories listed above, ProjectInit.sh will not change 
them. It will only add new configuration files or directories to your project if they are missing. One of the main goals
of ProjectInit.sh is to be used on already existing projects without changing your existing configuration.

## Prerequisites for running the script

- PHP
- Git
- wget

---
[The list of tools](../../list_of_tools.md) • [Home page](../../index.md)
