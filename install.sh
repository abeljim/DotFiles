#!/usr/bin/env bash

#install basics
function basics {
	sudo dnf install neovim zsh dconf gnome-tweaks util-linux-user -y
	sudo dnf install gnome-extensions-app -y
	sudo dnf install fira-code-fonts

	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	ZSHRC="/home/abelj1/.zshrc"
	ZSH_CUSTOM="/home/abelj1/.oh-my-zsh/custom"
	
	# Set Spaceship as the theme in .zshrc
	sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="spaceship"/' "$ZSHRC"

	git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
}

function prog {
	sudo dnf install @development-tools gh -y

	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
	sudo dnf check-update
	sudo dnf install code -y
}

echo "Do you wish to install this basics?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) basics; break;;
        No ) break;;
    esac
done

echo "Do you wish to install this programming?"
select yn in "Yes" "No"; do
    case $yn in
	Yes ) prog; break;;
	No ) break;;
    esac
done

echo "Do you wish to install this desktop settings?"
select yn in "Yes" "No"; do
    case $yn in
	Yes ) bash ./desktop.sh; break;;
	No ) break;;
    esac
done

