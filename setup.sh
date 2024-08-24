#!/bin/bash
echo -ne "

 ___      ___  ___      _____ ______           ________       _______       _________    ___  ___      ________   
|\  \    /  /||\  \    |\   _ \  _   \        |\   ____\     |\  ___ \     |\___   ___\ |\  \|\  \    |\   __  \  
\ \  \  /  / /\ \  \   \ \  \\\__\ \  \       \ \  \___|_    \ \   __/|    \|___ \  \_| \ \  \\\  \   \ \  \|\  \ 
 \ \  \/  / /  \ \  \   \ \  \\|__| \  \       \ \_____  \    \ \  \_|/__       \ \  \   \ \  \\\  \   \ \   ____\
  \ \    / /    \ \  \   \ \  \    \ \  \       \|____|\  \    \ \  \_|\ \       \ \  \   \ \  \\\  \   \ \  \___|
   \ \__/ /      \ \__\   \ \__\    \ \__\        ____\_\  \    \ \_______\       \ \__\   \ \_______\   \ \__\   
    \|__|/        \|__|    \|__|     \|__|       |\_________\    \|_______|        \|__|    \|_______|    \|__|   
                                                 \|_________|                                                     
                                                                                                                  
                                                                                                                   
"
VIMRC_URL="https://raw.githubusercontent.com/aayushx402/MyVim/main/vimrc"

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

install_editors() {
    if ! command_exists vim && ! command_exists nvim; then
        echo -e "\033[1;32mVim and Neovim are not installed. Installing...\033[0m"
        sudo pacman -S vim neovim --noconfirm
    else
        echo -e "\033[1;32mVim or Neovim is already installed.\033[0m"
    fi
}

apply_vimrc() {
    echo -e "\033[1;32mDownloading and applying vimrc...\033[0m"
    sudo curl -o /etc/vimrc "$VIMRC_URL"
}

echo -e "\033[1;34mStarting setup...\033[0m"

if [ "$EUID" -ne 0 ]; then
    echo -e "\033[1;33mRequesting sudo privileges...\033[0m"
    sudo -v
fi

install_editors

apply_vimrc

echo -e "\033[1;32mConfiguration applied successfully!\033[0m"

