#!/bin/bash

#
# - Install recommended packages
# - Install development packages
# - Install the X Window System (1/9)
# - Install a Desktop environment (2/9)
# - Install a Window manager (3/9)
# - Install fonts (4/9)
# - Install an internet browser (5/9)
# - Install LibreOffice (6/9)
# - Install GIMP + Inkscape (7/9)
# - Install QEMU + Virt Manager (8/9)
# - Enable required services (9/9)
# - Configure Cron
# - Configure Network Manager
# - Configure Bluetooth
# - Configure Printing support
# - Configure Notebook Power Options
# - Configure the Display manager
#

# Color definitions

BLUE='\033[01;34m'
GREEN='\033[01;32m'
RED='\033[01;31m'
DEFAULT='\033[00m'

# Install recommended packages

echo "\n${BLUE}Install recommended packages...${DEFAULT}\n"

xbps-install -S curl wget unzip zip nano vim gptfdisk mtools mlocate \
	ntfs-3g fuse-exfat

echo "\n${GREEN}Done${DEFAULT}\n"

sleep 1

# Install development packages

echo "\n${BLUE}Install development packages...${DEFAULT}\n"

xbps-install -S autoconf automake bison m4 make libtool flex meson ninja

echo "\n${GREEN}Done${DEFAULT}\n"

sleep 1

# Install the X Window System

read -p "Do you want to use a graphical environment? (yes/no) " xwinsys
case $xwinsys in
	yes )

	echo "\n${BLUE}Install the X Window System...${DEFAULT}\n"

	xbps-install -S xorg-server xorg-server-xwayland xorg-video-drivers xorg-input-drivers \
		xinit xauth xrandr xrdb xwininfo xdpyinfo xsetroot

	echo "\n${BLUE}Copy configurations...${DEFAULT}\n"

	if [ ! -d /etc/X11/xorg.conf.d ]; then
		mkdir -p /etc/X11/xorg.conf.d
	fi

	cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/
	cp -r 20-libinput.conf /etc/X11/xorg.conf.d/

	echo "\n${GREEN}Done${DEFAULT}\n"

	sleep 1

	# Install a Desktop environment

	echo "\n${BLUE}Install a Desktop environment...${DEFAULT}\n"
	echo "Possible (type in number): \n
	- 1 Xfce
	- 2 MATE
	- 3 GNOME
	- 4 KDE Plasma
	- 5 Budgie
	- 6 Cinnamon
	- 7 LXQt
	- 8 Enlightenment
	- 9 LXDE
	- 0 none\n"

	read -p "Which Desktop environment do you want? " desktop
	case $desktop in
		1 ) 

		echo "\n${BLUE}Install Xfce...${DEFAULT}\n"

		xbps-install -S xfce4-appfinder xfce4-battery-plugin xfce4-clipman-plugin xfce4-cpufreq-plugin \
			xfce4-cpugraph-plugin xfce4-dict xfce4-diskperf-plugin xfce4-fsguard-plugin \
			xfce4-genmon-plugin xfce4-mailwatch-plugin xfce4-mpc-plugin xfce4-netload-plugin \
			xfce4-notifyd xfce4-panel xfce4-panel-appmenu xfce4-places-plugin xfce4-power-manager \
			xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-sensors-plugin \
			xfce4-session xfce4-settings xfce4-systemload-plugin xfce4-taskmanager xfce4-terminal \
			xfce4-timer-plugin xfce4-verve-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin \
			Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin ristretto parole \
			xarchiver mousepad xfwm4 xfdesktop lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings \
			zathura zathura-pdf-poppler gvfs gvfs-mtp gvfs-gphoto2 xfce-polkit

		echo "\n${GREEN}Done${DEFAULT}\n"
			
		;;
		
		2 ) 

		echo "\n${BLUE}Install MATE...${DEFAULT}\n"

		xbps-install -S mate-applets mate-backgrounds mate-calc mate-control-center mate-desktop \
			mate-icon-theme mate-indicator-applet mate-media mate-menus mate-notification-daemon \
			mate-panel mate-panel-appmenu mate-screensaver mate-sensors-applet mate-session-manager \
			mate-settings-daemon mate-system-monitor mate-terminal mate-themes mate-tweak mate-utils \
			mozo pluma parole caja caja-image-converter caja-sendto caja-open-terminal caja-wallpaper \
			caja-xattr-tags eom atril lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings \
			gvfs gvfs-mtp gvfs-gphoto2 engrampa
		
		echo "\n${GREEN}Done${DEFAULT}\n"
			
		;;
		
		3 )

		echo "\n${BLUE}Install GNOME...${DEFAULT}\n"

		xbps-install -S gnome-shell gnome-control-center gnome-tweaks gnome-system-monitor gnome-terminal gdm \
			gnome-disk-utility nautilus nautilus-sendto gvfs gvfs-mtp gvfs-gphoto2 totem eog eog-plugins \
			evince gedit gedit-plugins gnome-video-effects gnome-themes-extra gnome-session gnome-screenshot \
			gnome-shell-extensions gnome-icon-theme gnome-icon-theme-extras gnome-icon-theme-symbolic \
			gnome-backgrounds file-roller
					
		echo "\n${BLUE}GNOME Applications${DEFAULT}\n"
		echo "Includes: GNOME Calendar, GNOME Clocks, GNOME Weather, Evolution, GNOME Font Viewer,"
		echo "GNOME Calculator, GNOME Characters, GNOME Contacts, GNOME Documents, GNOME Maps\n"

		read -p "Do you want to install GNOME applications? (yes/no) " gnomeapps
		case $gnomeapps in
			yes )

			echo "\n${BLUE}Install GNOME applications...${DEFAULT}\n"

			xbps-install -S gnome-calendar gnome-clocks gnome-weather evolution gnome-font-viewer \
				gnome-calculator gnome-characters gnome-contacts gnome-documents gnome-maps

			;;
		
			no )

			continue

			;;
		esac
		
		echo "\n${GREEN}Done${DEFAULT}\n"

		;;
		
		4 )

		echo "\n${BLUE}Install KDE Plasma...${DEFAULT}\n"

		xbps-install -S plasma-desktop plasma-disks plasma-thunderbolt plasma-systemmonitor plasma-pa plasma-nm \
			plasma-firewall plasma-browser-integration plasma-vault latte-dock oxygen kdegraphics-thumbnailers \
			dolphin dolphin-plugins kate5 konsole okular gwenview ark sddm sddm-kcm yakuake spectacle \
			partitionmanager ffmpegthumbs

		echo "\n${BLUE}KDE Applications${DEFAULT}\n"
		echo "Includes: KMail, Kontact, KOrganizer, KAddressbook, Akregator, Konversation, KCalc, KCharSelect\n"

		read -p "Do you want to install KDE applications? (yes/no) " kdeapps
		case $kdeapps in
			yes )

			echo "\n${BLUE}Install KDE applications...${DEFAULT}\n"

			xbps-install -S kmail kontact korganizer kaddressbook akregator konversation kcalc kcharselect

			;;

			no )

			continue

			;;
		esac

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		5 )

		echo "\n${BLUE}Install Budgie...${DEFAULT}\n"

		xbps-install -S budgie-desktop gnome-control-center gnome-system-monitor gnome-terminal nautilus \
			nautilus-sendto gnome-keyring lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings \
			evince gedit gedit-plugins eog eog-plugins parole gnome-screenshot gnome-disk-utility \
			gvfs gvfs-mtp gvfs-gphoto2 file-roller

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		6 )

		echo "\n${BLUE}Install Cinnamon...${DEFAULT}\n"

		xbps-install -S cinnamon gnome-system-monitor gnome-terminal gnome-screenshot gnome-disk-utility \
			gnome-keyring gedit gedit-plugins evince gvfs gvfs-mtp gvfs-gphoto2 parole lightdm lightdm-gtk3-greeter \
			lightdm-gtk-greeter-settings eog eog-plugins file-roller
		
		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		7 )

		echo "\n${BLUE}Install LXQt...${DEFAULT}\n"

		xbps-install -S lxqt-about lxqt-admin lxqt-archiver lxqt-build-tools lxqt-config lxqt-globalkeys lxqt-notificationd \
			lxqt-openssh-askpass lxqt-panel lxqt-policykit lxqt-powermanagement lxqt-qtplugin lxqt-runner lxqt-session \
			lxqt-sudo lxqt-themes obconf-qt openbox pcmanfm-qt lximage-qt FeatherPad qlipper sddm

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		8 )

		echo "\n${BLUE}Install Enlightenment...${DEFAULT}\n"

		xbps-install -S enlightenment terminology mousepad gvfs gvfs-mtp gvfs-gphoto2 parole zathura zathura-pdf-poppler \
			Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin lightdm lightdm-gtk3-greeter \
			lightdm-gtk-greeter-settings

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		9 )

		echo "\n${BLUE}Install LXDE...${DEFAULT}\n"

		xbps-install -S lxde-common lxde-icon-theme lxappearance lxinput lxpanel lxrandr lxsession lxtask \
			lxterminal pcmanfm gvfs gvfs-mtp gvfs-gphoto2 viewnior lightdm lightdm-gtk3-greeter \
			lightdm-gtk-greeter-settings mousepad parole zathura zathura-pdf-poppler openbox obconf \
			lxappearance-obconf

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;
		
		0 ) 

		continue
			
		;;
	esac

	sleep 1

	# Install a Window manager
	
	echo "\n${BLUE}Install a Window Manager...${DEFAULT}\n"
	echo "Possible (type in number): \n
	- 1 i3wm
	- 2 Openbox
	- 3 Fluxbox
	- 4 bspwm
	- 5 herbstluftwm
	- 6 IceWM
	- 7 jwm
	- 8 dwm
	- 0 none\n"

	read -p "Which Window manager do you want? " windowmanager
	case $windowmanager in
		1 ) 

		echo "\n${BLUE}Install i3...${DEFAULT}\n"

		xbps-install -S i3-gaps i3lock i3status i3blocks dunst dmenu feh Thunar \
			thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver \
			lm_sensors acpi playerctl scrot htop xfce4-terminal arandr gvfs gvfs-mtp \
			gvfs-gphoto2 mousepad xfce4-taskmanager lightdm lightdm-gtk3-greeter \
			lightdm-gtk-greeter-settings viewnior

		echo "\n${GREEN}Done${DEFAULT}\n"
			
		;;

		2 )

		echo "\n${BLUE}Install Openbox...${DEFAULT}\n"

		xbps-install -S openbox obconf lxappearance lxappearance-obconf jgmenu dunst \
			feh lxterminal lxrandr lxinput pcmanfm gvfs gvfs-mtp gvfs-gphoto2 \
			mousepad lxtask scrot htop xarchiver lightdm lightdm-gtk3-greeter \
			lightdm-gtk-greeter-settings viewnior
		
		echo "\n${GREEN}Done${DEFAULT}\n"

		;;
		
		3 )

		echo "\n${BLUE}Install Fluxbox...${DEFAULT}\n"

		xbps-install -S fluxbox dunst feh xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad xfce4-terminal scrot htop xarchiver \
		        lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings viewnior

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		4 )

		echo "\n${BLUE}Install Bspwm...${DEFAULT}\n"

		xbps-install -S bspwm sxhkd dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver lightdm \
			lightdm-gtk3-greeter lightdm-gtk-greeter-settings viewnior

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		5 )

		echo "\n${BLUE}Install herbstluftwm...${DEFAULT}\n"

		xbps-install -S herbstluftwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver lightdm \
			lightdm-gtk3-greeter lightdm-gtk-greeter-settings viewnior

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		6 )

		echo "\n${BLUE}Install IceWM...${DEFAULT}\n"

		xbps-install -S icewm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver lightdm \
			lightdm-gtk3-greeter lightdm-gtk-greeter-settings viewnior

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		7 )

		echo "\n${BLUE}Install jwm...${DEFAULT}\n"

		xbps-install -S jwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver lightdm \
			lightdm-gtk3-greeter lightdm-gtk-greeter-settings viewnior

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		8 )

		echo "\n${BLUE}Install dwm...${DEFAULT}\n"

		xbps-install -S dwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver lightdm \
			lightdm-gtk3-greeter lightdm-gtk-greeter-settings viewnior

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		0 ) 

		continue
			
		;;
	esac

	sleep 1

	# Install fonts

	read -p "Do you want to install some fonts? (yes/no) " fonts
	case $fonts in
		yes ) 

		echo "\n${BLUE}Install fonts...${DEFAULT}\n"

		xbps-install -S liberation-fonts-ttf dejavu-fonts-ttf \
			ttf-ubuntu-font-family fonts-roboto-ttf

		echo "\n${GREEN}Done${DEFAULT}\n"
			
		;;
		
		no ) 

		continue
			
		;;
	esac

	sleep 1

	# Install an Internet browser

	echo "\n${BLUE}Install an Internet browser...${DEFAULT}\n"
	echo "Possible (type in number): \n
	- 1 Firefox
	- 2 Firefox-ESR
	- 3 Chromium
	- 4 qutebrowser
	- 5 Falkon
	- 0 None\n"

	read -p "Which browser do you want? " browser
	case $browser in
		1 )

		echo "\n${BLUE}Install Firefox...${DEFAULT}\n"

		xbps-install -S firefox firefox-i18n-en-US

		echo "\n${GREEN}Done${DEFAULT}\n"
			
		;;

		2 ) 

		echo "\n${BLUE}Install Firefox Extended Support Release...${DEFAULT}\n"

		xbps-install -S firefox-esr firefox-esr-i18n-en-US

		echo "\n${GREEN}Done${DEFAULT}\n"
			
		;;

		3 ) 

		echo "\n${BLUE}Install Chromium...${DEFAULT}\n"

		xbps-install -S chromium

		echo "\n${GREEN}Done${DEFAULT}\n"
			
		;;

		4 )

		echo "\n${BLUE}Install qutebrowser...${DEFAULT}\n"

		xbps-install -S qutebrowser

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		5 )

		echo "\n${BLUE}Install Falkon...${DEFAULT}\n"

		xbps-install -S falkon

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;
		
		0 ) 

		continue
			
		;;
	esac

	sleep 1

	# Install LibreOffice

	read -p "Do you want to install LibreOffice? (yes/no) " libreoffice
	case $libreoffice in
		yes )

		echo "\n${BLUE}Install LibreOffice...${DEFAULT}\n"

		xbps-install -S libreoffice-writer libreoffice-calc libreoffice-impress \
			libreoffice-draw libreoffice-math libreoffice-base libreoffice-gnome

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		no )

		continue

		;;
	esac

	sleep 1

	# Install GIMP + Inkscape

	read -p "Do you want to install GIMP and Inkscape? (yes/no) " gimpinkscape
	case $gimpinkscape in
		yes )

		echo "\n${BLUE}Install GIMP and Inkscape...${DEFAULT}\n"

		xbps-install -S inkscape gimp

		echo "\n${GREEN}Done${DEFAULT}\n"

		;;

		no )

		continue

		;;
	esac

	sleep 1

	# Install QEMU + Virt Manager

	read -p "Do you want to install QEMU and Virt Manager? (yes/no) " qemuvirt
	case $qemuvirt in
		yes )

		echo "\n${BLUE}Install QEMU and Virt Manager...${DEFAULT}\n"

		xbps-install -S qemu virt-manager libvirt

		echo "\n${BLUE}Enable libvirtd service...${DEFAULT}\n"

		if [ -L /var/service/libvirtd ]; then
			echo "Service ${GREEN}libvirtd ${DEFAULT}already exist. Continue.\n"
		else
			ln -sv /etc/sv/libvirtd /var/service
			echo "\n${GREEN}Done${DEFAULT}\n"
		fi

		;;

		no )

		continue

		;;
	esac

	sleep 1

	# Enable required services

	echo "\n${BLUE}Enable required services...${DEFAULT}\n"

	xbps-install -S dbus

	if [ -L /var/service/dbus ]; then
		echo "Service ${GREEN}dbus ${DEFAULT}already exist. Continue.\n"
	else
		ln -sv /etc/sv/dbus /var/service
		echo "\n${GREEN}Done${DEFAULT}\n"
	fi

	xbps-install -S elogind

	if [ -L /var/service/elogind ]; then
		echo "Service ${GREEN}elogind ${DEFAULT}already exist. Continue.\n"
	else
		ln -sv /etc/sv/elogind /var/service
		echo "\n${GREEN}Done${DEFAULT}\n"
	fi
	
	if [ -L /var/service/polkitd ]; then
		echo "Service ${GREEN}polkitd ${DEFAULT}already exist. Continue.\n"
	else
		ln -sv /etc/sv/polkitd /var/service
		echo "\n${GREEN}Done${DEFAULT}\n"
	fi

	;;

	no )

	continue

	;;
esac

sleep 1

# Configure Cron

echo "\n${BLUE}Configure Cron...${DEFAULT}\n"
echo "\nInstall cronie...\n"

xbps-install -S cronie

echo "\n${BLUE}Enable cronie service...${DEFAULT}\n"

if [ -L /var/service/cronie ]; then
	echo "Service ${GREEN}cronie ${DEFAULT}already exist. Continue.\n"
else
	ln -sv /etc/sv/cronie /var/service
	echo "\n${GREEN}Done${DEFAULT}\n"
fi

sleep 1

# Configure Network Management

echo "\n${BLUE}Configure Network Management...${DEFAULT}\n"
echo "\nPossible (type in number): \n
- 1 Network Manager
- 2 Connman
- 0 None\n"

read -p "Which Network Management tool do you want to use? " netmngt
case $netmngt in
	1 )

	echo "\n${BLUE}Install Network Manager...${DEFAULT}\n"

	xbps-install -S NetworkManager NetworkManager-openvpn NetworkManager-openconnect \
		network-manager-applet

	echo "\n${BLUE}Enable Network Manager service...${DEFAULT}\n"

	if [ -L /var/service/NetworkManager ]; then
		echo "Service ${GREEN}NetworkManager ${DEFAULT}already exist. Continue.\n"
	else
		ln -sv /etc/sv/NetworkManager /var/service
		echo "\n${GREEN}Done${DEFAULT}\n"
	fi

	;;

	2 )

	echo "\n${BLUE}Install Connman...${DEFAULT}\n"

	xbps-install -S connman connman-ncurses

	echo "\n${BLUE}Enable Connman service...${DEFAULT}\n"

	if [ -L /var/service/connmand ]; then
		echo "Service ${GREEN}connmand ${DEFAULT}already exist. Continue.\n"
	else
		ln -sv /etc/sv/connmand /var/service
		echo "\n${GREEN}Done${DEFAULT}\n"
	fi

	;;

	0 )

	continue

	;;
esac

sleep 1

# Configure Bluetooth

read -p "Do you want to use Bluetooth? (yes/no) " bluetooth
case $bluetooth in
	yes )

	echo "\n${BLUE}Install BlueZ and Blueman...${DEFAULT}\n"

	xbps-install -S bluez blueman

	echo "\n${BLUE}Enable Bluetooth service...${DEFAULT}\n"

	if [ -L /var/service/bluetoothd ]; then
		echo "Service ${GREEN}bluetoothd ${DEFAULT}already exist. Continue.\n"
	else
		ln -sv /etc/sv/bluetoothd /var/service
		echo "\n${GREEN}Done${DEFAULT}\n"
	fi

	;;

	no )

	continue

	;;
esac

sleep 1

# Configure Printing support

read -p "Do you want to use printers? (yes/no) " printer
case $printer in
	yes )

	echo "\n${BLUE}Install CUPS and Tools...${DEFAULT}\n"

	xbps-install -S cups cups-pk-helper cups-filters system-config-printer \
		foomatic-db foomatic-db-engine

	echo "\n${BLUE}Enable CUPS service...${DEFAULT}\n"

	if [ -L /var/service/cupsd ]; then
		echo "Service ${GREEN}cupsd ${DEFAULT}already exist. Continue.\n"
	else
		ln -sv /etc/sv/cupsd /var/service
		echo "\n${GREEN}Done${DEFAULT}\n"
	fi

	;;

	no )

	continue

	;;
esac

sleep 1

# Configure Notebook Power Saving

read -p "Do you want to configure TLP for power saving (Notebooks only)? (yes/no) " nb_power
case $nb_power in
	yes )

	echo "\n${BLUE}Install TLP and PowerTop...${DEFAULT}\n"

	xbps-install -S tlp tlp-rdw powertop

	echo "\n${BLUE}Enable TLP service...${DEFAULT}\n"

	if [ -L /var/service/tlp ]; then
		echo "Service ${GREEN}tlp ${DEFAULT}already exist. Continue.\n"
	else
		ln -sv /etc/sv/tlp /var/service
		echo "\n${GREEN}Done${DEFAULT}\n"
	fi

	;;

	no )

	continue

	;;
esac

sleep 1

# Configure the Display manager

echo "\n${BLUE}Check if a display manager exist. If yes, enable it.${DEFAULT}\n"

if [ -f /usr/bin/lightdm ]; then
	ln -sv /etc/sv/lightdm /var/service
elif [ -f /usr/bin/sddm ]; then
	ln -sv /etc/sv/sddm /var/service
elif [ -f /usr/bin/gdm ]; then
	ln -sv /etc/sv/gdm /var/service
fi

echo "\n${BLUE}Finished.${DEFAULT}\n"
