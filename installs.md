sudo systemctl enable --now NetworkManager

# Packages

- base devel

## Git
- git
  - git config --global credential.helper store
  - git config --global user.name "Matthew Remmel"
  - git config --global user.email "matt.remmel@gmail.com"
- lazygit
- ~/.gitconfig
  - ```
    [includeIf "gitdir:~/workspace/work"]
        path = ~/workspace/work/.gitconfig
    ```
- ~/workspace/work/.gitconfig
  - ```
    [user]
        name = "Name Override"
        email = "Email Override"
    ```

- yay
  - git clone https://aur.archlinux.org/yay.git
  - makepkg -si

## Font
- ttf-jetbrains-mono-nerd

## Shell
- alacritty
- zsh
  - chsh -s /usr/bin/zsh
  - sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  - git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  - git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

- starship

## Neovim
- neovim
- tree-sitter
- tree-sitter-cli

## Tmux
- tmux
- tpm

## General
- bat
- exa
- procs
- ripgrep
- tokei
- direnv
- btop
- clang
- cmake
- just
- rsync
- unzip
- neofetch

## Bluetooth
- bluez
- bluez-utils
- blueman
- Check that bluetooth is being killed `sudo rfkill list`
- enable `sudo systemctl enable --now bluetooth.service`

## Docker
- docker
- docker-compose
  - sudo systemctl enable --now Docker?
  - sudo usermod -aG docker $USER && newgrp docker

## Rust
- rustup
  - rustup install stable nightly
- mold
  - TODO: Update cargo config

## Dotnet
- dotnet-sdk
- dotnet-runtime
- aspnet-runtime

## Node
- nodejs
- npm

## Python
- TODO

## Kubernetes
- kubectl
- k9s
- openlens

## AWS
- awscli

## Bitwarden
- bitwarden

## Dotfiles
ln -s /real/path /sym/path

## Jetbrains
- jre-openjdk
- clion
- rider
- pycharm-professional
- rustrover
- intellij-idea-ultimate-edition
- datagrip
- webstorm

# Browser
- brave-bin

# Slack
- slack-desktop

# Postman
- postman-bin

# VSCode
- visual-studio-code-bin

## General Software
- signal-desktop
