#!/bin/bash

# Variables
dotfiles=~/dotfiles
packages="zsh zsh-syntax-highlighting vim neovim tmux virtualenvwrapper \
i3 i3status nemo rofi xclip xserver-xorg-core xinit x11-common wireplumber xss-lock zip pipewire-pulse \
pipewire-alsa pipewire-audio pipewire-bin pipewire picom network-manager nala ntfs-3g light i3lock gzip \
golang feh easyeffects"

# Install git and pull dotfiles
echo - "\nInstalling git and pulling dotfiles"
apt -y install git
git pull https://github.com/benricok/dotfiles $dotfiles

# Installing packages
echo -e "\n\nInstalling packages"
apt -y install $packages

# Clean existing files
echo -e "\n\nCleaning existing directories and files"
rm -rf ~/.bashrc ~/.tmux ~/.tmux-conf ~/.zsh_prompt ~/.zshrc ~/.cofig/i3 ~/.config/i3status ~/.config/alacritty ~/.config/clangd ~/.config/gtk-2.0 ~/.config/gtk-3.0 ~/.config/rofi > /dev/null

# Change default shell
chsh -s /bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Create syslinks
echo -e "\n\nCreating symlinks"
ln -sf $dotfiles/alacritty ~/.config/alacritty
ln -sf $dotfiles/clangd ~/.config/clangd
ln -sf $dotfiles/gtk-2.0 ~/.config/gtk-2.0
ln -sf $dotfiles/gtk-3.0 ~/.config/gtk-3.0
ln -sf $dotfiles/i3 ~/.config/i3
ln -sf $dotfiles/i3status ~/.config/i3status
ln -sf $dotfiles/rofi ~/.config/rofi

# Copy individual files
echo -e "\n\nCopying individual files"
cp $dotfiles/zshrc ~/.zshrc
cp $dotfiles/tmux.conf ~/.tmux.conf

echo -e "\n\nDone!"
