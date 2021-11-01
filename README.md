# [ProjectInit.sh](https://projectinit.sh)

## Description

This is a set of bash scripts intended to start up projects. The workflow is simple: Configure, Generate, Run.

## OS support

This is a set of bash scripts. **Linux** is natively supported.

**Windows** is supported on terminal emulators which support bash (`Cmder`, `ConEmu`, `Mingw` or any other). During development, the scripts were tested on `Cmder`, but they should work in any other terminal emulator.

**OSX** is not tested.

## Use

### Step #1 - Configure

Simply run: 

```shell
sh ./configure.sh
```

### Step #2 - Generate

#### Method #1 - Run all generators

Just run:

```bash
sh ./run_generators.sh
```

Generated project init scripts will be placed in `./build/` directory.

#### Method #2 - Run an individual generator

You can run an individual generator from the root directory of this repository.
Generator scripts have the `generate_` prefix.

### Step #3 - Run

To use a generated init script, run it from the `./build/` directory.

```bash
cd build
sh some_script.sh
```

## Cleaning up build directory

If you want a fresh start, run `./cleanup_builds.sh` and then configure and/or generate the scripts again.

## Available scripts

- `init_generic.sh`
    - check if project directory exists and create one if it doesn't;
    - check if the project's directory is a Git repository and initialize Git repository if it isn't;
    - download the latest **Composer**
    - download the latest **PHP CS Fixer**
    - setup Git username and user email for the repository
    - setup `.gitignore`
    - composer install

## Additional resources 

- [Integrations with editors and IDEs](doc/TOOL_INTEGRATIONS.md)
