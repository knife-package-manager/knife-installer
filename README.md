# knife-installer

This program clones knife using git, builds it using cargo, etc.

installer.sh: As mentioned above, this is a shell script that installs knife, clones it, builds it, etc.

check_knife_install_dependency.rs: This program checks for dependencies during the installation process.
check_knife_install_dependency.rs: This is a program that checks for the existence of dependencies needed to build knife, which is installed by installer.sh using curl and built using rustc.
