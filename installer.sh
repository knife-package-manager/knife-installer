#!/bin/sh

printf "comrade Installer\n"
printf "This installer builds comrade and generates an executable file tailored to your computer.\n"
printf "Estimated build time is about 4 minutes.\n"
printf "Enter y or yes to run, or n or no to cancel\n"
printf "[y/n] "
read val

ok=false
current_dir=$(pwd)

if [ "$val" = "y" ] || [ "$val" = "yes" ] || [ "$val" = "" ]; then
  echo "Start installation"
  if [ -d "$HOME/.comrade" ] && [ -e "$HOME/.comrade/bin/comrade" ]; then
  printf "comrade is already installed!\n"
  printf "If you still want to install it, you can reinstall comrade with rade upgrade!\n"
  printf "Or clone the comrade repository to ~/.comrade/build and use make to reinstall rade yourself!\n"
   cd "$current_dir" &&
    rm install.sh
    exit 1
  fi
  printf "creating comrade_build..."
  mkdir -p "$HOME/comrade_build" &&
    printf "ok\n"
  printf "downloading the test.rs..."
  curl -sSfL https://github.com/rade-package-manager/comrade-installer.github.io/releases/download/0.1/check_comrade_install_dependency.rs -o "$HOME/comrade_build/test.rs" &&
    printf "ok\n"
  printf "checking rustc..."
  if which rustc >"$HOME/comrade_build/info.log"; then
    printf "ok\n"
  else
    printf "\nrustc is not installed. rustc is required for comrade installation.\nPlease install Rust before installing comrade\n."
    exit 1
  fi
  printf "compiling test.rs..."
  rustc "$HOME/comrade_build/test.rs" -o "$HOME/comrade_build/test" &&
    printf "ok\n" &&
    printf "Checking to see if the program is installed...\n"
  if "$HOME/comrade_build/test"; then
    printf ""
  else
    printf "Test program failed to run.\n"
    exit 1
  fi
  printf "creating ~/.comrade..."
  mkdir -p ~/.comrade &&
    printf "ok\n"
  printf "cloning rade-package-list..."
  printf "===clone packagelist===\n" >>"$HOME/comrade_build/info.log"
  git clone --quiet https://github.com/rade-package-manager/rade-package-list ~/.comrade/packagelist/ &&
    printf "ok\n"
    printf "clone is ok" >> "$HOME/comrade_build/info.log"
  printf "creating ~/.comrade/bin/..."
  mkdir -p ~/.comrade/bin &&
    printf "ok\n"
  printf "creating ~/.comrade/build/..."
  mkdir -p ~/.comrade/build &&
    printf "ok\n"
  printf "cloning comrade..."
  printf "===clone comrade-package-manager===\n" >>"$HOME/comrade_build/info.log"
  git clone --quiet https://github.com/comrade-package-manager/comrade-package-manager ~/.comrade/build &&
    printf "ok\n"
  printf "cd ~/.comrade/build/..."
  cd ~/.comrade/build &&
    printf "ok\n"
  printf "making...\n"
  if make install; then
    printf "All done!\n"
    printf "comrade installed successfully!\nFor more information about comrade, please visit the comrade Repository\n"
    ok=true
  else
    printf "Build failed.\n"
    exit 1
  fi

  if [ -f ~/.bashrc ] && [ -r ~/.bashrc ]; then
    echo 'export PATH=$PATH:$HOME/.comrade/bin' >>~/.bashrc
  fi
  if [ -f ~/.zshrc ] && [ -r ~/.zshrc ]; then
    echo 'export PATH=$PATH:$HOME/.comrade/bin' >>~/.zshrc
  fi
  if [ -f ~/.config/fish/config.fish ] && [ -r ~/.config/fish/config.fish ]; then
    echo 'fish_add_path ~/.comrade/bin' >>~/.config/fish/config.fish
  fi

  if [ -d ~/.comrade/build ]; then
    find ~/.comrade/build -mindepth 1 -delete
  fi

elif [ "$val" = "n" ] || [ "$val" = "no" ]; then
  echo "Installation canceled"
  cd "$current_dir" &&
    rm install.sh
  exit

else
  echo "Invalid input. Please enter y or yes to run, or n or no to cancel."
  cd "$current_dir" &&
    rm install.sh
    exit
fi
