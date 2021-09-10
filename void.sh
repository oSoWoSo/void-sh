#!/bin/bash

# Original author: fossraven
# SRC: https://codeberg.org/fossraven/void-sh
# Some changes: oSoWoSo
# SRC site: https://codeberg.org/oSoWoSo


#
# - Update the system
# - Install recommended packages
# - Install development packages
# - Install the X Window System (1/13)
# - Install a Desktop environment (2/13)
# - Install a Display manager (3/13)
# - Install a Window manager (4/13)
# - Install fonts (5/13)
# - Install an internet browser (6/13)
# - Install LibreOffice (7/13)
# - Install GIMP + Inkscape (8/13)
# - Install QEMU + Virt Manager (9/13)
# - Install a Terminal emulator (10/13)
# - Install a Backup program (11/13)
# - Install a Video player (12/13)
# - Enable required services (13/13)
# - Configure Cron
# - Configure Audio
# - Configure Network Manager
# - Configure Bluetooth
# - Configure Printing support
# - Configure TLP for notebook power saving
# - Configure the Display manager
#

# Color definitions

blue=$(tput setaf 4)
green=$(tput setaf 2)
red=$(tput setaf 1)
none=$(tput sgr0)

echo -n "$red"
echo "Let's begin installing..."
echo -n "$none"

# Update the System

echo -n "$blue"
echo "Checking for updates..."
echo -n "$none"

sudo xbps-install -Su
echo -n "$green"
echo "Done"
echo -n "$none"

# Install recommended packages

echo -n "$blue"
echo "Install recommended packages..."
echo -n "$none"

sudo xbps-install curl wget unzip zip nano vim gptfdisk mtools mlocate \
	ntfs-3g fuse-exfat bash-completion linux-headers

echo -n "$green"
echo "Done"
echo -n "$none"

# Install development packages

read -p "Do you want to install development tools? (y/N) " devtools
case $devtools in
	y )

	sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja \
			optipng sassc

	echo -n "$green"
	echo "Done"
	echo -n "$none"

	;;

	n )

	;;
esac

# Install shell

echo -n "$blue"
echo "Install shell..."
echo -n "$none"

printf "Possible (type in number): \n
- 1 Fish
- 2 Zsh
- 0 None\n"

read -p "Which shell do you want?" shell
case $shell in
	1 )
	
	echo -n "$blue"
	echo "Install Fish..."
	echo -n "$none"

	sudo xbps-install fish-shell
	sudo usermod --shell /bin/fish "$USER"
	
	;;
	
	2 )
	
	echo -n "$blue"
	echo "Install Zsh..."
	echo -n "$none"

	sudo xbps-install zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting
	sudo usermod --shell /bin/zsh "$USER"
	
	;;
esac

# Install the X Window System

read -p "Do you want to use a graphical environment? (y/N) " xwinsys
case $xwinsys in
	y )
	echo -n "$blue"
	echo "Install the X Window System..."
	echo -n "$none"

	sudo xbps-install xorg-server xorg-server-xwayland xorg-video-drivers xorg-input-drivers \
		xinit xauth xrandr xrdb xwininfo xdpyinfo xsetroot neofetch
	echo -n "$blue"
	echo "Copy configurations..."
	echo -n "$none"

	if [ ! -d /etc/X11/xorg.conf.d ]; then
		sudo mkdir -p /etc/X11/xorg.conf.d
	fi

	sudo cp -r keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
	sudo cp -r libinput.conf /etc/X11/xorg.conf.d/20-libinput.conf

	echo -n "$green"
	echo "Done"
	echo -n "$none"

	# Install a Desktop environment
	
	echo -n "$blue"
	echo "Install a Desktop environment..."
	echo -n "$none"

	printf "Possible (type in number): \n
	- 1 Xfce
	- 2 MATE
	- 3 GNOME
	- 4 KDE Plasma
	- 5 Budgie
	- 6 Cinnamon
	- 7 LXQt
	- 8 Enlightenment
	- 9 LXDE
	- 10 Lumina
	- 0 none\n"

	read -p "Which Desktop environment do you want? " desktop
	case $desktop in
		1 ) 
		echo -n "$blue"
		echo "Install Xfce..."
		echo -n "$none"

		sudo xbps-install xfce4-appfinder xfce4-battery-plugin xfce4-clipman-plugin xfce4-cpufreq-plugin \
			xfce4-cpugraph-plugin xfce4-dict xfce4-diskperf-plugin xfce4-fsguard-plugin \
			xfce4-genmon-plugin xfce4-mailwatch-plugin xfce4-mpc-plugin xfce4-netload-plugin \
			xfce4-notifyd xfce4-panel xfce4-panel-appmenu xfce4-places-plugin xfce4-power-manager \
			xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-sensors-plugin \
			xfce4-session xfce4-settings xfce4-systemload-plugin xfce4-taskmanager xfce4-terminal \
			xfce4-timer-plugin xfce4-verve-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin \
			Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin ristretto \
			xarchiver mousepad xfwm4 xfdesktop zathura zathura-pdf-poppler gvfs gvfs-mtp gvfs-gphoto2 \
			xfce-polkit parole

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;
		
		2 ) 
		echo -n "$blue"
		echo "Install MATE..."
		echo -n "$none"

		sudo xbps-install mate-applets mate-backgrounds mate-calc mate-control-center mate-desktop \
			mate-icon-theme mate-indicator-applet mate-media mate-menus mate-notification-daemon \
			mate-panel mate-panel-appmenu mate-screensaver mate-sensors-applet mate-session-manager \
			mate-settings-daemon mate-system-monitor mate-terminal mate-themes mate-tweak mate-utils \
			mozo pluma caja caja-image-converter caja-sendto caja-open-terminal caja-wallpaper \
			caja-xattr-tags eom atril gvfs gvfs-mtp gvfs-gphoto2 engrampa mate-power-manager mate-polkit
		
		echo -n "$green"
		echo "Done"
		echo -n "$none"	
		;;
		
		3 )
		echo -n "$blue"
		echo "Install GNOME..."
		echo -n "$none"

		sudo xbps-install gnome-shell gnome-control-center gnome-tweaks gnome-system-monitor gnome-terminal gdm \
			gnome-disk-utility nautilus nautilus-sendto gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins \
			evince gedit gedit-plugins gnome-video-effects gnome-themes-extra gnome-session gnome-screenshot \
			gnome-shell-extensions gnome-icon-theme gnome-icon-theme-extras gnome-icon-theme-symbolic \
			gnome-backgrounds file-roller chrome-gnome-shell totem
		
		echo -n "$blue"
		echo "GNOME Applications"
		echo "Includes: GNOME Calendar, GNOME Clocks, GNOME Weather, Evolution, GNOME Font Viewer,"
		echo "GNOME Calculator, GNOME Characters, GNOME Contacts, GNOME Documents, GNOME Maps"
		echo -n "$none"

		read -p "Do you want to install GNOME applications? (y/N) " gnomeapps
		case $gnomeapps in
			y )

			echo -n "$blue"
			echo "Install GNOME applications..."
			echo -n "$none"
			sudo xbps-install gnome-calendar gnome-clocks gnome-weather evolution gnome-font-viewer \
				gnome-calculator gnome-characters gnome-contacts gnome-documents gnome-maps

			;;
		
			n )

			;;
		esac
		
		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;
		
		4 )
		echo -n "$blue"
		echo "Install KDE Plasma..."
		echo -n "$none"

		sudo xbps-install plasma-desktop plasma-disks plasma-thunderbolt plasma-systemmonitor plasma-pa plasma-nm \
			plasma-firewall plasma-browser-integration plasma-vault latte-dock oxygen kdegraphics-thumbnailers \
			dolphin dolphin-plugins kate5 konsole okular gwenview ark sddm sddm-kcm yakuake spectacle \
			partitionmanager ffmpegthumbs kde-gtk-config5
		echo -n "$blue"
		echo "KDE Applications"
		echo "Includes: KMail, Kontact, KOrganizer, KAddressbook, Akregator, Konversation, KCalc, KCharSelect"
		echo -n "$none"

		read -p "Do you want to install KDE applications? (y/N) " kdeapps
		case $kdeapps in
			y )

			echo -n "$blue"
			echo "Install KDE applications..."
			echo -n "$none"

			sudo xbps-install kmail kontact korganizer kaddressbook akregator konversation kcalc kcharselect

			;;

			n )

			;;
		esac

		read -p "Do you want to use KDE Connect? (y/N) " kdeconnect
		case $kdeconnect in
			y )

			echo -n "$blue"
			echo "Install KDE Connect..."
			echo -n "$none"

			sudo xbps-install kdeconnect

			;;

			n )

			;;
		esac

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		5 )
		echo -n "$blue"
		echo "Install Budgie..."
		echo -n "$none"
		sudo xbps-install budgie-desktop gnome-control-center gnome-system-monitor gnome-terminal nautilus \
			nautilus-sendto gnome-keyring evince gedit gedit-plugins eog eog-plugins gnome-screenshot \
			gnome-disk-utility gvfs gvfs-mtp gvfs-gphoto2 file-roller

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		6 )
		echo -n "$blue"
		echo "Install Cinnamon..."
		echo -n "$none"
		sudo xbps-install cinnamon gnome-system-monitor gnome-terminal gnome-screenshot gnome-disk-utility \
			gnome-keyring gedit gedit-plugins evince gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins file-roller
		
		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		7 )
		echo -n "$blue"
		echo "Install LXQt..."
		echo -n "$none"
		sudo xbps-install lxqt-about lxqt-admin lxqt-archiver lxqt-build-tools lxqt-config lxqt-globalkeys lxqt-notificationd \
			lxqt-openssh-askpass lxqt-panel lxqt-policykit lxqt-powermanagement lxqt-qtplugin lxqt-runner lxqt-session \
			lxqt-sudo lxqt-themes obconf-qt openbox pcmanfm-qt lximage-qt FeatherPad qlipper qterminal

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		8 )
		echo -n "$blue"
		echo "Install Enlightenment..."
		echo -n "$none"
		sudo xbps-install enlightenment terminology mousepad gvfs gvfs-mtp gvfs-gphoto2 zathura zathura-pdf-poppler \
			Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		9 )
		echo -n "$blue"
		echo "Install LXDE..."
		echo -n "$none"
		sudo xbps-install lxde-common lxde-icon-theme lxappearance lxinput lxpanel lxrandr lxsession lxtask \
			lxterminal pcmanfm gvfs gvfs-mtp gvfs-gphoto2 viewnior mousepad zathura zathura-pdf-poppler \
			openbox obconf lxappearance-obconf xarchiver

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		10 )
		echo -n "$blue"
		echo "Install Lumina..."
		echo -n "$none"
		sudo xbps-install lumina lumina-pdf lumina-calculator gvfs gvfs-mtp gvfs-gphoto2 mousepad lxterminal viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;
		
		0 ) 
			
		;;
	esac

	# Install display manager
	
	echo -n "$blue"
	echo "Install a display manageer..."
	echo -n "$none"
	printf "Possible (type in number): \n
	- 1 Lightdm
	- 2 Emptty
	- 3 Slim
	- 0 none\n"
	
	read -p "Which display manager do you want? " displaymanager
	case $displaymanager in
		1 )
		echo -n "$blue"
		echo "Install Lightdm..."		
		echo -n "$none"		
		sudo xbps-install lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings
		
		echo -n "$green"
		echo "Done"
		echo -n "$none"			
		;;
		
		2 )
		echo -n "$blue"
		echo "Install Emptty..."		
		echo -n "$none"
		sudo xbps-install emptty

		echo -n "$green"
		echo "Done"
		echo -n "$none"					
		;;

		3 )
		echo -n "$blue"
		echo "Install Slim..."		
		echo -n "$none"
		sudo xbps-install slim

		echo -n "$green"
		echo "Done"
		echo -n "$none"					
		;;
		
		0 ) 
			
		;;
	esac

	# Install a Window manager
	echo -n "$blue"
	echo "Install a Window Manager..."
	echo -n "$none"
	printf "Possible (type in number): \n
	--- Xorg ---
	- 1 i3-gaps
	- 2 Openbox
	- 3 Fluxbox
	- 4 bspwm
	- 5 herbstluftwm
	- 6 IceWM
	- 7 awesome
	- 8 jwm
	- 9 dwm
	- 10 FVWM3
	--- Wayland ---
	- 11 Sway
	- 12 Wayfire
	- 0 none\n"

	read -p "Which Window manager do you want? " windowmanager
	case $windowmanager in
		1 ) 
		echo -n "$blue"
		echo "Install i3-gaps..."
		echo -n "$none"
		sudo xbps-install i3-gaps i3lock i3status i3blocks dunst dmenu feh Thunar \
			thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver \
			lm_sensors acpi playerctl scrot htop xfce4-terminal arandr gvfs gvfs-mtp \
			gvfs-gphoto2 mousepad xfce4-taskmanager viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"			
		;;

		2 )
		echo -n "$blue"
		echo "Install Openbox..."
		echo -n "$none"
		sudo xbps-install openbox obconf lxappearance lxappearance-obconf jgmenu dunst \
			feh lxterminal lxrandr lxinput pcmanfm gvfs gvfs-mtp gvfs-gphoto2 \
			mousepad lxtask scrot htop xarchiver viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;
		
		3 )
		echo -n "$blue"
		echo "Install Fluxbox..."
		echo -n "$none"
		sudo xbps-install fluxbox dunst feh xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad xfce4-terminal scrot htop xarchiver \
		        viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		4 )
		echo -n "$blue"
		echo "Install Bspwm..."
		echo -n "$none"
		sudo xbps-install bspwm sxhkd dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		5 )
		echo -n "$blue"
		echo "Install herbstluftwm..."
		echo -n "$none"
		sudo xbps-install herbstluftwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		6 )
		echo -n "$blue"
		echo "Install IceWM..."
		echo -n "$none"
		sudo xbps-install icewm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		7 )
		echo -n "$blue"
		echo "Install awesome..."
		echo -n "$none"
		sudo xbps-install awesome vicious dunst feh arandr xfce4-terminal Thunar thunar-volman \
				thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot \
				htop xarchiver viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		8 )
		echo -n "$blue"
		echo "Install jwm..."
		echo -n "$none"
		sudo xbps-install jwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		9 )
		echo -n "$blue"
		echo "Install dwm..."
		echo -n "$none"
		sudo xbps-install dwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		10 )
		echo -n "$blue"
		echo "Install FVWM3..."
		echo -n "$none"
		sudo xbps-install fvwm3 feh xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;
		
		11 )
		echo -n "$blue"
		echo "Install Sway..."
		echo -n "$none"
		sudo xbps-install sway swaybg swayidle swaylock azote grimshot Waybar gvfs gvfs-mtp gvfs-gphoto2 \
				htop wofi

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		12 )
		echo -n "$blue"
		echo "Install Wayfire..."
		echo -n "$none"
		sudo xbps-install wayfire grim gvfs gvfs-mtp gvfs-gphoto2 htop wofi

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		0 ) 
			
		;;
	esac

	# Install fonts

	read -p "Do you want to install some fonts? (y/N) " fonts
	case $fonts in
		y ) 
		echo -n "$blue"
		echo "Install fonts..."
		echo -n "$none"
		sudo xbps-install liberation-fonts-ttf dejavu-fonts-ttf \
			ttf-ubuntu-font-family fonts-roboto-ttf

		echo -n "$green"
		echo "Done"
		echo -n "$none"			
		;;
		
		n ) 
			
		;;
	esac

	# Install an Internet browser
	echo -n "$blue"
	echo "Install an Internet browser..."
	echo -n "$none"
	printf "Possible (type in number): \n
	- 1 Firefox
	- 2 Firefox-ESR
	- 3 Chromium
	- 4 qutebrowser
	- 5 Falkon
	- 6 Badwolf
	- 0 None\n"

	read -p "Which browser do you want? " browser
	case $browser in
		1 )
		echo -n "$blue"
		echo "Install Firefox..."
		echo -n "$none"
		sudo xbps-install firefox firefox-i18n-en-US firefox-i18n-de

		echo -n "$green"
		echo "Done"
		echo -n "$none"			
		;;

		2 ) 
		echo -n "$blue"
		echo "Install Firefox Extended Support Release..."
		echo -n "$none"
		sudo xbps-install firefox-esr firefox-esr-i18n-en-US firefox-esr-i18n-de

		echo -n "$green"
		echo "Done"
		echo -n "$none"			
		;;

		3 ) 
		echo -n "$blue"
		echo "Install Chromium..."
		echo -n "$none"
		sudo xbps-install chromium

		echo -n "$green"
		echo "Done"
		echo -n "$none"			
		;;

		4 )
		echo -n "$blue"
		echo "Install qutebrowser..."
		echo -n "$none"
		sudo xbps-install qutebrowser

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		5 )
		echo -n "$blue"
		echo "Install Falkon..."
		echo -n "$none"
		sudo xbps-install falkon

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;
		
		0 ) 
			
		;;
		
		6 )
		echo -n "$blue"
		echo "Install Badwolf..."
		echo -n "$none"
		sudo xbps-install badwolf

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;
		
	esac

	# Install LibreOffice

	read -p "Do you want to install LibreOffice? (y/N) " libreoffice
	case $libreoffice in
		y )
		echo -n "$blue"
		echo "Install LibreOffice..."
		echo -n "$none"
		sudo xbps-install libreoffice-writer libreoffice-calc libreoffice-impress \
			libreoffice-draw libreoffice-math libreoffice-base libreoffice-gnome \
			libreoffice-i18n-en-US libreoffice-i18n-de

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		n )

		;;
	esac

	# Install GIMP + Inkscape

	read -p "Do you want to install GIMP and Inkscape? (y/N) " gimpinkscape
	case $gimpinkscape in
		y )
		echo -n "$blue"
		echo "Install GIMP and Inkscape..."
		echo -n "$none"
		sudo xbps-install inkscape gimp

		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		n )

		;;
	esac

	# Install QEMU + Virt Manager

	read -p "Do you want to install QEMU and Virt Manager? (y/N) " qemuvirt
	case $qemuvirt in
		y )
		echo -n "$blue"
		echo "Install QEMU and Virt Manager..."
		echo -n "$none"
		sudo xbps-install qemu virt-manager libvirt
		echo -n "$blue"
		echo "Enable libvirtd service..."
		echo -n "$none"
		if [ -L /var/service/libvirtd ]; then
			echo -n "$green"
			echo "Service libvirtd already exist. Continue."
			echo -n "$none"
		else
			sudo ln -sv /etc/sv/libvirtd /var/service
			echo -n "$green"
			echo "Done"
		fi

		;;

		n )

		;;
	esac

	# Install a Terminal emulator
	echo -n "$blue"
	echo "Install a Terminal emulator..."
	echo -n "$none"
	printf "Possible (type in number): \n
	- 1 Alacritty
	- 2 xterm
	- 3 LXTerminal
	- 4 Yakuake
	- 5 Sakura
	- 6 Kitty
	- 0 I take the given one\n"

	read -p "What terminal emulator do you want? " terminal
	case $terminal in
		1 ) 
		echo -n "$blue"
		echo "Install Alacritty..."
		echo -n "$none"
		sudo xbps-install alacritty alacritty-terminfo
		export TERMINAL="alacritty"
		printf TERM="alacritty" > ~/.bashrc
	
		echo -n "$green"
		echo "Done"
		echo -n "$none"			
		;;
		
		2 ) 
		echo -n "$blue"
		echo "Install xterm..."
		echo -n "$none"
		sudo xbps-install xterm
		export TERMINAL="xterm"
		printf TERM="xterm" > ~/.bashrc

		echo -n "$green"
		echo "Done"
		echo -n "$none"			
		;;
		
		3 ) 
		echo -n "$blue"
		echo "Install LXTerminal..."
		echo -n "$none"
		sudo xbps-install lxterminal
		export TERMINAL="lxterminal"
		printf TERM="lxterminal" > ~/.bashrc
		
		echo -n "$green"
		echo "Done"
		echo -n "$none"			
		;;

		4 )
		echo -n "$blue"
		echo "Install Yakuake..."
		echo -n "$none"
		sudo xbps-install yakuake
		export TERMINAL="yakuake"
		printf TERM="yakuake" > ~/.bashrc
		
		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		5 )
		echo -n "$blue"
		echo "Install Sakura..."
		echo -n "$none"
		sudo xbps-install sakura
		export TERMINAL="sakura"
		printf TERM="sakura" > ~/.bashrc
		
		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;

		0 )
		echo -n "$blue"
		echo "Install Kitty..."
		echo -n "$none"
		sudo xbps-install kitty kitty-terminfo
		export TERMINAL="kitty"
		printf TERM="kitty" > ~/.bashrc
		
		echo -n "$green"
		echo "Done"
		echo -n "$none"
		;;
	esac

	# Install a Backup program
	echo -n "$blue"
	echo "Install a Backup program..."
	echo -n "$none"
	printf "Possible (type in number): \n
	- 1 Borg
	- 2 Timeshift
	- 3 Deja-dup
	- 0 none\n"

	read -p "Which Backup program do you want? " backup
	case $backup in
			1 )

			echo -n "$blue"
        	echo "Install Borg..."
			echo -n "$none"
			sudo xbps-install borg

			echo -n "$green"
			echo "Done"
			echo -n "$none"
			;;

			2 )
			
			echo -n "$blue"
            echo "Install Timeshift..."
			echo -n "$none"
			sudo xbps-install timeshift

			echo -n "$green"
			echo "Done"
			echo -n "$none"
			;;

			3 )
			
			echo -n "$blue"
            echo "Install Deja-dup..."
			echo -n "$none"
			sudo xbps-install deja-dup

			echo -n "$green"
			echo "Done"
			echo -n "$none"
			;;

			0 )

			;;
	esac

	# Install a Video player
	echo -n "$blue"
	echo "Install a Video player..."
	echo -n "$none"
	printf "Possible (type in number): \n
	- 1 mpv
	- 2 VLC Media Player
	- 3 Parole (part of Xfce)
	- 4 Totem (part of GNOME)
	- 0 none\n"

	read -p "Which Video player do you want? " videoplayer
	case $videoplayer in
			1 )
			
			echo -n "$blue"
            echo "Install mpv..."
			echo -n "$none"
			sudo xbps-install mpv

			echo -n "$green"
			echo "Done"
			echo -n "$none"
			;;

			2 )
			
			echo -n "$blue"
            echo "Install VLC Media Player..."
			echo -n "$none"
			sudo xbps-install vlc

			echo -n "$green"
			echo "Done"
			echo -n "$none"
			;;

			3 )
			
			echo -n "$blue"
            echo "Install Parole..."
			echo -n "$none"
			sudo xbps-install parole

			echo -n "$green"
			echo "Done"
			echo -n "$none"
			;;

			4 )
			
			echo -n "$blue"
            echo "Install Totem..."
			echo -n "$none"
			sudo xbps-install totem

			echo -n "$green"
			echo "Done"
			echo -n "$none"
			;;

			0 )

			;;
	esac

	# Enable required services

	echo -n "$blue"
	echo "Enable required services..."
	echo -n "$blue"
	echo "Enable D-Bus..."

	sudo xbps-install -y dbus

	if [ -L /var/service/dbus ]; then
		echo -n "$green"
		echo "Service dbus already exist. Continue."
		echo -n "$none"
	else
		sudo ln -s /etc/sv/dbus /var/service
		echo -n "$green"
		echo "Done"
		echo -n "$none"
	fi
		echo -n "$blue"
		echo "Enable elogind..."
		echo -n "$none"
	sudo xbps-install -y elogind

	if [ -L /var/service/elogind ]; then
		echo -n "$green"
		echo "Service elogind already exist. Continue."
		echo -n "$none"
	else
		sudo ln -s /etc/sv/elogind /var/service
		echo -n "$green"
		echo "Done"
		echo -n "$none"
	fi
		echo -n "$blue"
		echo "Enable Polkit..."
		echo -n "$none"
	if [ -L /var/service/polkitd ]; then
		echo -n "$green"
		echo "Service polkitd already exist. Continue."
		echo -n "$none"
	else
		sudo ln -s /etc/sv/polkitd /var/service
		echo -n "$green"
		echo "Done"
		echo -n "$none"
	fi

	;;

	n )

	;;
esac

# Configure Cron

echo -n "$blue"
echo "Configure Cron..."
echo -n "$green"
echo "Install cronie..."

sudo xbps-install -y cronie

echo -n "$blue"
echo "Enable cronie service..."
echo -n "$none"
if [ -L /var/service/cronie ]; then
	echo -n "$green"
	echo "Service cronie already exist. Continue."
	echo -n "$none"
else
	sudo ln -sv /etc/sv/cronie /var/service
	echo -n "$green"
	echo "Done"
	echo -n "$none"
fi

# Configure Audio

read -p "Do you want to install PulseAudio for audio? (y/N) " pulseaudio
case $pulseaudio in
	y )
	echo -n "$blue"
	echo "Install PulseAudio..."
	echo -n "$none"
	sudo xbps-install pulseaudio pulseaudio-utils pulsemixer alsa-plugins-pulseaudio \
		pavucontrol

		echo -n "$green"
		echo "Done"
		echo -n "$none"
	;;

	n )

	;;
esac

# Configure Network Management

echo -n "$blue"
echo "Configure Network Management..."
echo -n "$none"
printf "\nPossible (type in number): \n
- 1 Network Manager
- 2 Connman
- 0 None\n"

read -p "Which Network Management tool do you want to use? " netmngt
case $netmngt in
	1 )
	echo -n "$blue"
	echo "Install Network Manager..."
	echo -n "$none"
	sudo xbps-install NetworkManager NetworkManager-openvpn NetworkManager-openconnect \
			NetworkManager-vpnc NetworkManager-l2tp

	read -p "Do you want to integrate Network Manager into a graphical environment? (y/N) " nmapplet
	case $nmapplet in
			y ) 

			echo -n "$blue"
			echo "Service Install Network Manager applet..."
			echo -n "$none"
			sudo xbps-install network-manager-applet
					
			;;

			n )

			;;
	esac
	echo -n "$blue"
	echo "Enable Network Manager service..."
	echo -n "$none"
	if [ -L /var/service/NetworkManager ]; then
		echo -n "$green"
		echo "Service NetworkManager already exist. Continue."
		echo -n "$none"
	else
		sudo ln -sv /etc/sv/NetworkManager /var/service
		echo -n "$green"
		echo "Done"
		echo -n "$none"
	fi

	;;

	2 )
	
	echo -n "$blue"
	echo "Install Connman..."
	echo -n "$none"
	sudo xbps-install connman connman-ncurses
	
	echo -n "$blue"
	echo "Enable Connman service..."
	echo -n "$none"
	if [ -L /var/service/connmand ]; then
		echo -n "$green"
		echo "Service connmand already exist. Continue."
		echo -n "$none"
	else
		sudo ln -sv /etc/sv/connmand /var/service
		echo -n "$green"
		echo "Done"
		echo -n "$none"
	fi

	;;

	0 )

	;;
esac

# Configure Bluetooth

read -p "Do you want to use Bluetooth? (y/N) " bluetooth
case $bluetooth in
	y )
	echo -n "$blue"
	echo "Install BlueZ..."
	echo -n "$none"
	sudo xbps-install bluez

	printf "\n"

	read -p "Do you want to integrate Bluetooth into a graphical environment? (y/N) " blueman
	case $blueman in
			y )

			echo -n "$blue"
            echo "Install Blueman..."
			echo -n "$none"
			sudo xbps-install blueman

			;;

			n )

			;;
	esac
	echo -n "$blue"
	echo "Enable Bluetooth service..."
	echo -n "$none"
	if [ -L /var/service/bluetoothd ]; then
		
		echo -n "$green"
		echo "Service bluetoothd already exist. Continue."
		echo -n "$none"
	else
		sudo ln -sv /etc/sv/bluetoothd /var/service
		echo -n "$green"
		echo "Done"
		echo -n "$none"
	fi

	;;

	n )

	;;
esac

# Configure Printing support

read -p "Do you want to use printers? (y/N) " printer
case $printer in
	y )
	echo -n "$blue"
	echo "Install CUPS and Tools..."
	echo -n "$none"
	sudo xbps-install cups cups-pk-helper cups-filters foomatic-db foomatic-db-engine

	read -p "Do you want to install a graphical printer program? (y/N) " printergui
	case $printergui in
			y )

			echo -n "$blue"
			echo "Install system-config-printer..."
			echo -n "$none"
			sudo xbps-install system-config-printer

			;;

			n )

			;;
	esac
	echo -n "$blue"
	echo "Enable CUPS service..."
	echo -n "$none"
	if [ -L /var/service/cupsd ]; then
		echo -n "$green"
		echo "ervice cupsd already exist. Continue."
		echo -n "$none"
	else
		sudo ln -sv /etc/sv/cupsd /var/service
		echo -n "$green"
		echo "Done"
		echo -n "$none"
	fi

	;;

	n )

	;;
esac

# Configure Notebook Power Saving

read -p "Do you want to install TLP for power saving (Notebooks only)? (y/N) " nb_power
case $nb_power in
	y )
	echo -n "$blue"
	echo "Install TLP and PowerTop..."
	echo -n "$none"

	sudo xbps-install tlp tlp-rdw powertop
	
	echo -n "$blue"
	echo "Enable TLP service..."
	echo -n "$none"
	
	if [ -L /var/service/tlp ]; then
		echo -n "$green"
		echo "Service tlp already exist. Continue."
		echo -n "$none"
	else
			sudo ln -sv /etc/sv/tlp /var/service
		echo -n "$green"
		echo "Done"
		echo -n "$none"
	fi

	;;

	n )

	;;
esac

# Configure the Display manager

read -p "Check if a display manager exist. If yes, enable it? (y/N) " dmenable
case $dmenable in
	y )

	if [ -f /usr/bin/lightdm ]; then
		sudo ln -sv /etc/sv/lightdm /var/service
	elif [ -f /usr/bin/sddm ]; then
		sudo ln -sv /etc/sv/sddm /var/service
	elif [ -f /usr/bin/gdm ]; then
		sudo ln -sv /etc/sv/gdm /var/service
	elif [ -f /usr/bin/slim ]; then
		sudo ln -sv /etc/sv/slim /var/service
	elif [ -f /usr/bin/emptty ]; then
		sudo ln -sv /etc/sv/emptty /var/service
	fi

	;;

	n )

	;;
esac

echo -n "$red"
echo "Finished."
echo -n "$none"
