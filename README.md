# [ProjectInit.sh](https://projectinit.sh)

A set of bash scripts to kickstart software projects.

## OS support

- **Linux**:

- **Windows**: Supported in terminal emulators and environments that can run Bash ([Cmder](https://cmder.net/), 
[ConEmu](https://conemu.github.io/), [Mingw](https://www.mingw-w64.org/),...). During development,
ProjectInit.sh is tested on [Cmder](https://cmder.net/) with additional Linux tools installed with 
[Scoop](https://scoop.sh/) (for example: `wget`).

- **MacOS**: Since *zsh* is default terminal, you will need to have Bash installed.

If you need help installing bash or any other prerequisites, take a look at the [Prerequisites](./doc/PREREQUISITES.md) documentation page.

## Installation

### Step 1

Clone this repository: `git clone git@github.com:constup/projectinit.sh.git`

or

Download the latest release.

### Step 2

Configure ProjectInit.sh by running:

```shell
cd projectinit.sh
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

## Additional resources 

- [Integrations with editors and IDEs](doc/TOOL_INTEGRATIONS.md)
