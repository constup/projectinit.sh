# NodeJS - Init Generic

```shell
cd bin/nodejs
sh init_generic.sh
```

## Can be used for:

- Creating a new NestJS application

## Features

The script can perform the following for you:

- Create a Git repository if it doesn't exist, or use an existing one
- Configure Git username and email for the repository
- Install NestJS globally for the current version of NodeJS, if you don't already have it installed
- Create a new NestJS project

**NOTE:** If you have already configured some tools, files or directories listed above, ProjectInit.sh will not change
them. It will only add new configuration files or directories to your project if they are missing. One of the main goals
of ProjectInit.sh is to be used on already existing projects without changing your existing configuration.

## Prerequisites for running the script

- nvm (_planned to be automated with ProjectInit.sh_)
- NodeJS (_planned to be automated with ProjectInit.sh_)
- Git

---
[The list of tools](../../list_of_tools.md) • [Home page](../../index.md)
