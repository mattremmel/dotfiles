sudo systemctl enable --now NetworkManager

# Packages

- base devel

## Git
- git
  - git config --global credential.helper store
  - git config --global user.name "Matthew Remmel"
  - git config --global user.email "matt.remmel@gmail.com"
- lazygit

- yay
  - makepkg -si?

## Shell
- alacritty
- zsh
  - chsh -s /usr/bin/zsh
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

## Docker
- docker
- docker-compose
  - sudo systemctl enable --now Docker?
  - sudo usermod -aG docker $USER && newgrp docker

## Rust
- rustup
  - rustup install stable nightly
- mold

## Dotnet
- dotnet-sdk
- dotnet-runtime
- aspnet-runtime

## Node
- nodejs
- npm

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
- clion
- rider
- pycharm-professional
- rustrover
- intellij-idea-ultimate-edition
- datagrip
- webstorm
