# Prerequisites

ProjectInit.sh is a set of Bash scripts. It's trying to use as many default commands available in Bash
and/or on your operating system as possible. It's also using the tools which you should already have in
your development environment (for example, if you're setting up a PHP project, local PHP is required).

## Linux

No special prerequisites are required. Most Linux distributions already have Bash and supporting tools.

## Windows

There's a couple of ways to use Bash tools on Windows:

- [Cmder](https://cmder.net/)
- [ConEmu](https://conemu.github.io/)
- [Cygwin](https://www.cygwin.com/)
- [MSYS2](https://www.msys2.org/)
- [MinGW/Win-Builds](http://win-builds.org/doku.php)
- [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install)
- Bash terminal in [Git for Windows](https://gitforwindows.org/)

This guide will cover a setup with [Cmder](https://cmder.net/) as terminal emulator and [Scoop](https://scoop.sh) 
as package manager.

If you need to install Cmder and Scoop, check out this blog post (by the original author of ProjectInit.sh): 
[Using Scoop and Cmder to make PHP development on Windows bearable](https://dev.to/nikolastojilj12/using-scoop-and-cmder-to-make-php-development-on-windows-bearable-8pd)

### Installing terminal tools

Open a terminal and install required tools with Scoop:

```shell
scoop install wget git
```

You can now open a new Bash terminal in Cmder and run any ProjectInit.sh script.

## MacOS

MacOS uses [Zsh](https://www.zsh.org/) as a default shell, but it also should have Bash already installed.

Use the following command to switch to Bash:

```shell
chsh -s /bin/bash
```

You should now be able to run ProjectInit.sh.
