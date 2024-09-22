#!/bin/sh

printf "rade Installer\n"
printf "This installer builds rade and generates an executable file tailored to your computer.\n"
printf "Estimated build time is about 4 minutes.\n"
printf "Enter y or yes to run, or n or no to cancel\n"
printf "[y/n] "
read val

ok=false
current_dir=$(pwd)

if [ "$val" = "y" ] || [ "$val" = "yes" ] || [ "$val" = "" ]; then
  echo "Start installation"
  if [ -d "$HOME/.comrade" ] && [ -e "$HOME/.comrade/bin/rade" ]; then
    printf "rade is already installed!\n"
    printf "If you still want to install it, you can reinstall rade with rade upgrade!\n"
    printf "Or clone the rade repository to ~/.comrade/build and use make to reinstall rade yourself!\n"
    cd "$current_dir" &&
      rm install.sh
    exit 1
  fi

  printf "creating comrade_build..."
  mkdir -p "$HOME/comrade_build" &&
    printf "ok\n"

  printf "downloading the test.rs..."
  curl -sSfL https://github.com/rade-package-manager/rade-installer/releases/download/0.1/check_comrade_install_dependency.rs -o "$HOME/comrade_build/test.rs" &&
    printf "ok\n"

  printf "checking rustc..."
  if which rustc >"$HOME/comrade_build/info.log"; then
    printf "ok\n"
  else
    printf "\nrustc is not installed. rustc is required for rade installation.\nPlease install Rust before installing rade.\n"
    exit 1
  fi

  printf "compiling test.rs..."
  rustc "$HOME/comrade_build/test.rs" -o "$HOME/comrade_build/test" &&
    printf "ok\n" &&
    printf "Checking to see if the program is installed...\n"

  if "$HOME/comrade_build/test"; then
    printf "Test program ran successfully.\n"
  else
    printf "Test program failed to run.\n"
    exit 1
  fi

  printf "creating ~/.comrade..."
  mkdir -p ~/.comrade &&
    printf "ok\n"

  printf "cloning rade-package-list..."
  printf "===clone packagelist===\n" >>"$HOME/comrade_build/info.log"
  git clone https://github.com/rade-package-manager/rade-package-list ~/.comrade/packagelist >>"$HOME/comrade_build/info.log" 2>&1 &&
    printf "ok\n"
  printf "clone is ok\n" >> "$HOME/comrade_build/info.log"

  printf "creating ~/.comrade/log..."
  mkdir -p ~/.comrade/log &&
    printf "ok\n"

  printf "creating ~/.comrade/log/install..."
  mkdir -p ~/.comrade/log/install &&
    printf "ok\n"

  printf "creating ~/.comrade/bin/..."
  mkdir -p ~/.comrade/bin &&
    printf "ok\n"

  printf "creating ~/.comrade/build/..."
  mkdir -p ~/.comrade/build &&
    printf "ok\n"

  printf "cloning rade..."
  printf "===clone rade-package-manager===\n" >>"$HOME/comrade_build/info.log"
  git clone https://github.com/rade-package-manager/rade-package-manager ~/.comrade/build >>"$HOME/comrade_build/info.log" 2>&1 &&
    printf "ok\n"

  printf "cd ~/.comrade/build/..."
  cd ~/.comrade/build &&
    printf "ok\n"

  printf "making...\n"
  if make install; then
    printf "All done!\n"
    printf "rade installed successfully!\nFor more information about rade, please visit the rade Repository.\n"
    ok=true
  else
    printf "Build failed.\n"
    exit 1
  fi

  # Adding rade to PATH
  if [ -f ~/.bashrc ] && [ -r ~/.bashrc ]; then
    if ! grep -q 'export PATH=$PATH:$HOME/.comrade/bin' ~/.bashrc; then
      echo 'export PATH=$PATH:$HOME/.comrade/bin' >>~/.bashrc
      printf "Added to .bashrc\n"
    fi
  fi

  if [ -f ~/.zshrc ] && [ -r ~/.zshrc ]; then
    if ! grep -q 'export PATH=$PATH:$HOME/.comrade/bin' ~/.zshrc; then
      echo 'export PATH=$PATH:$HOME/.comrade/bin' >>~/.zshrc
      printf "Added to .zshrc\n"
    fi
  fi

  if [ -f ~/.config/fish/config.fish ] && [ -r ~/.config/fish/config.fish ]; then
    if ! grep -q 'fish_add_path ~/.comrade/bin' ~/.config/fish/config.fish; then
      echo 'fish_add_path ~/.comrade/bin' >>~/.config/fish/config.fish
      printf "Added to fish config\n"
    fi
  fi

  # Cleanup build directory
  if [ -d ~/.comrade/build ]; then
    find ~/.comrade/build -mindepth 1 -delete
    printf "Cleaned up build directory\n"
  fi

elif [ "$val" = "n" ] || [ "$val" = "no" ]; then
  printf "Installation canceled\n"
  cd "$current_dir" &&
    rm install.sh
  exit 0

else
  printf "Invalid input. Please enter y or yes to run, or n or no to cancel.\n"
  cd "$current_dir" &&
    rm install.sh
  exit 1
fi
