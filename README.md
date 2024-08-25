# rade-installer

This program clones Knife using Git, builds it using Cargo, and installs comrade.

installer.sh: As mentioned above, this is a shell script that installs, clones, and builds comrade.

check_comrade_install_dependency.rs: installer.sh installs using curl and builds this program using rustc.
This program checks the dependencies needed to build comrade and verifies if it can be installed.
