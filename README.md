# knife-installer
This program clones knife using git, builds it using cargo, etc.
installer.sh:.
This is a Shell Script that installs knife as mentioned earlier.
It clones, builds, etc. and installs knife.

check_knife_install_dependency.rs: A program that checks for dependencies in the installation process.
A program that checks for the existence of dependencies needed to build knife.
It is cloned by installer.sh and built using rustc.

