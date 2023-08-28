#!/usr/bin/bash

# The install script is tested on Xubunut 20.04 LTS

# Goal: Running the script repeatedly should not mess up.

function install_apt {
	# Uninstall unwanted packages
 	apt-get remove \
		libreoffice-base-core \
		libreoffice-common \
		libreoffice-style-breeze \
		libreoffice-style-colibre \
		libreoffice-style-tango \
		trojita \
		qpdfview \
		2048-qt \
		noblenote

	apt-get autoremove

	# Install wanted packages
	apt-get install \
		mupdf \
		rxvt-unicode \
		bspwm \
		chromium-browser \
		fonts-inconsolata \
		hsetroot \
		nnn \
		python3-pip \
		tig \
		curl \
		dmenu \
		fzf \
		polybar \
		brightnessctl \
		micro

}

function install_manual {
	# Install go
	wget https://go.dev/dl/go1.17.3.linux-amd64.tar.gz
	rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz
	rm go1.17.3.linux-amd64.tar.gz

	# Install vscode
	#wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O vscode.deb
	#dpkg -i vscode.deb
	#rm vscode.deb

	# Install sqlite3
	wget https://github.com/nalgeon/sqlite/releases/download/3.40.0/sqlite3-ubuntu
	chmod a+x sqlite3-ubuntu
	mv sqlite3-ubuntu /usr/local/bin/sqlite
}

function setup_keyboard {
	# Swap ctrl+capslock
	sed -i 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:swapcaps"/' /etc/default/keyboard

}

# uncomment from below:
#install_apt
#install_manual
#setup_keyboard
