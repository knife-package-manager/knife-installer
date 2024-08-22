# knife-installer

This program clones Knife using Git, builds it using Cargo, and installs Knife.

installer.sh: As mentioned above, this is a shell script that installs, clones, and builds Knife.

check_knife_install_dependency.rs: installer.sh installs using curl and builds this program using rustc.
This program checks the dependencies needed to build Knife and verifies if it can be installed.
