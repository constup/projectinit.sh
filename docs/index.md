## ProjectInit

**NOTE**: This page and the rest of the documentation is currently work in progress. Once the final version is 
published, this note will be removed. 

### Setup your next software project in seconds 

```shell
cd projectinit.sh/build
sh php_init_generic.sh
```

### Install, configure, build and run

Install by cloning the repository:

```shell
git clone git@github.com:constup/projectinit.sh.git
```

or by downloading the latest release.

### Completely cross-platform

ProjectInit.sh is tested on Linux, Windows and MacOS. For detailed instructions on how to install Bash and supporting
tools (like wget, curl,...) on your operating system, check out this Documentation section.

### Spend more time on actual work

If you are building, maintaining and/or contributing to multiple projects or git repositories, ProjectInit.sh can help 
you set up everything you need to start a new project or setup an existing one on a new computer.
All of your projects will also be set up in exactly the same way, just the way you like it.

### Make it your own

ProjectInit.sh comes with a default set of bash scripts separated into components. Each master script is a compilation
of individual component scripts.

You are free to mix the components or write your own to cover your perfect setup.

### Beginner? Learn with ProjectInit.sh

ProjectInit.sh is written in Bash and divided into individual components. Want to learn how to download Composer from
terminal? Take a look at `component/phar/download_composer.sh`:

```shell
echo ""
curl "https://getcomposer.org/composer.phar" --output composer.phar
php composer.phar self-update
echo ""
php composer.phar --version
```

Since this is all written in Bash, you can run commands from the script directly in your terminal and even learn how 
to set up a project yourself by using just terminal - no tools needed.



