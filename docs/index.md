## ProjectInit

**NOTE**: This page and the rest of the documentation is currently work in progress. Once the final version is 
published, this note will be removed. 

### Description

ProjectInit.sh is a tool which blends a perfect mix of interactive user input and automation. It will ask you about the 
most important decisions when setting up your project, but will also keep the boring stuff automated. The core ideas of
ProjectInit.sh are:

- Creating a new project in an organized and standardized way.
- To be fully compatible with your existing projects and repositories and not override any of your existing project
  settings.
- Fully functional on all major operating systems.
- Modular with features separated into components and functions, so that users can easily compose their own scripts by 
  using already implemented components.

Running ProjectInit.sh scripts is easy. Example for a PHP project: 

```shell
cd bin/php
sh init_generic.sh
```

### Supported types of projects

- PHP Composer library
- Symfony 5 web, console or API application
- Symfony 6 web, console or API application
- NestJS application

[See the full list of available tools and features here.](list_of_tools.md)

### Install, configure and run

Install by cloning the repository:

```shell
git clone git@github.com:constup/projectinit.sh.git
```

or by downloading the latest release from [https://github.com/constup/projectinit.sh/releases](https://github.com/constup/projectinit.sh/releases).

Configure ProjectInit.sh by running:

```shell
sh configure.sh
```

### Completely cross-platform

ProjectInit.sh is tested on Linux, Windows and macOS. For detailed instructions on how to install Bash and supporting
tools (like wget, curl,...) on your operating system, check out this Documentation section.

### Spend more time on actual work

If you are building, maintaining and/or contributing to multiple projects or git repositories, ProjectInit.sh can help 
you set up everything you need to start a new project or setup an existing one on a new computer.
All of your projects will also be set up in exactly the same way, just the way you like it.

### Make it your own

ProjectInit.sh comes with a default set of bash scripts separated into components and functions. Each master script is a
compilation of individual Bash functions.

You are free to mix the components or write your own to cover your perfect setup.

### Beginner? Learn with ProjectInit.sh

ProjectInit.sh is written in Bash and divided into individual components. Want to learn how to download Composer from
terminal? Take a look at `src/php/composer/composer.sh`:

```shell
download_latest_composer_phar () {
  echo ""
  wget -O composer.phar "https://getcomposer.org/composer.phar"
  chmod +x composer.phar
  php composer.phar self-update
  echo ""
  php composer.phar --version
}
```
### Demo

This demo video shows an example of creating a new Symfony 5 web application by using ProjectInit.sh v0.1.2-alpha.
<div style="height: 349px;">
<iframe src='//www.youtube.com/embed/kR6ppQMqTQ4' style="top: 0; left: 0; width: 100%; height: 100%;" allowfullscreen>
</iframe>
</div>

### Release history highlights

 - **09.12.2023. - 0.2.1-alpha**: Various improvements, added a choice for PHPUnit version and bumping available Symfony
version to 6.4.
 - **10.08.2022. - 0.2.0-alpha**: Added support for creating NestJS projects. Code now follows 
[Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
 - **15.06.2022. - 0.1.6-alpha**: You will be asked for your SSH key if repository cloning fails. Autocomplete 
capability has been added to a couple of file input queries.
 - **10.06.2022. - 0.1.5-alpha**: Added support for creating Symfony 6 projects.
 - **03.12.2021. - 0.1.4-alpha**: Fixes.
 - **28.12.2021. - 0.1.3-alpha**: QoL improvements.
 - **27.11.2021. - 0.1.2-alpha**: Added support for creating Symfony 5 projects.
