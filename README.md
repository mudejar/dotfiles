# Mudejar's Dotfiles

## Purpose
Dotfiles are configuration files that typically begin with a dot (.) and are used to personalize and customize various aspects of software applications and the command-line interface. These files often control the settings and behavior of tools, applications, and the shell environment on a Unix-like operating system. The dotfiles in this repository are used for configuration files for my Linux and MacOS based machines.

### Installer scripts
Ideally, I should be able to move into a new "clean" system, run an installer script (found in `installers` folder) that corresponds to the operating system, and then run the command `./install` from this directory. Doing so should result in all configuration files being correctly linked to their proper places in the Linux/Unix filesystem. You should also be able to run these installer scripts in a brown field system, and anything that is already installed will be ignored.

### Config folder
The config folder will always be copied into the `$HOME/.config` directory, regardless of the operating system you run dotbot in. This is a folder for configuration files that will remain the same in any Unix/Linux based environment.

## System requirements

#### Dotbot
These dotfiles are managed using [dotbot](https://github.com/anishathalye/dotbot). When editing the configuration file, make sure to keep the script idemptotent. In other words, running `./install` several times should not break the system.

The ./install script is a wrapper that invokes Dotbot. This script is usually a small shell script that passes the necessary configuration to Dotbot. Dotbot reads the install.conf.yaml file located in the root of the repository. This configuration file specifies the actions that Dotbot will perform, such as creating symbolic links, running shell commands, or cleaning up old files.

The configurations put in place within these dotfiles will be utilized by programs that don't come installed with Linux or MacOS by default. You can install all required programs using the installer scripts found in the `installers` folder. However, if you just want to run the configuration without all the programs that utilize the configuration files, then you should have the following installed:

- Python +3.8
- [dotbot](https://github.com/anishathalye/dotbot)
