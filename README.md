# [ProjectInit.sh](https://projectinit.sh)

A set of bash scripts to kickstart software projects.

<img src="https://img.shields.io/badge/license-GNU%20GPL%203.0-brightgreen" alt="GNU GPL 3.0 License badge" />

## OS support

**Note**: Depending on what each tool in ProjectInit.sh is supposed to do, you may need additional software installed,
but nothing which you probably don't already have in your development environment.

- **Linux**: Bash is the most common shell on any Linux distro, so ProjectInit.sh is supported as well.

- **Windows**: Supported in terminal emulators and environments that can run Bash ([Cmder](https://cmder.net/), 
[ConEmu](https://conemu.github.io/), [Mingw](https://www.mingw-w64.org/),...). During development,
ProjectInit.sh is tested on [Cmder](https://cmder.net/) with additional Linux tools installed with 
[Scoop](https://scoop.sh/) (for example: `wget`).

- **MacOS**: Since *zsh* is default terminal, you will need to have Bash installed.

If you need help installing bash or any other prerequisites, take a look at the [Prerequisites](./doc/PREREQUISITES.md) 
documentation page.

## Coding style

ProjectInit.sh uses [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html) as a coding standard.

## Installation

### Step 1

Clone this repository: `git clone git@github.com:constup/projectinit.sh.git`

or

Download the latest release from 
[https://github.com/constup/projectinit.sh/releases](https://github.com/constup/projectinit.sh/releases).

### Step 2

Configure ProjectInit.sh by running:

```shell
sh configure.sh
```

## How to use

All tools (scripts) are located in `bin` folder of ProjectInit.sh, separated into directories based on a language or 
technology they are covering.

Just open your bash terminal, `cd` into the desired `bin` subdirectory and run.

Example:

```shell
cd bin/php
sh init_generic.sh
```

## Available tools

- PHP:
  - `init_generic.sh`:
    - Composer package
    - Symfony 5 web application
    - Symfony 5 console or API application
    - Symfony 6 web application
    - Symfony 6 console or APi application
- NodeJS
  - `init_generic.sh`
    - NestJS application

## Additional resources 

- [Integrations with editors and IDEs](doc/TOOL_INTEGRATIONS.md)

## Supporting development

"*Programmer [ proh-gram-er ] - An organism which consumes coffee and produces source code.*"
<a href="https://www.buymeacoffee.com/puEW3HvWvP" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-green.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## License

GNU GPL 3.0 - Full license is available in [LICENSE](./LICENSE) file.
