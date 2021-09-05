# void.sh

void-sh is a program written in Bash that configures Void Linux.

Don't run as ROOT you will be asked for password if needed!

### Content

- Update the system
- Install recommended packages
- Install development packages (optional)
- Install a other Shell and make it default (optional)
    - Fish, Zsh
- Install the X Window System (optional)
- Install a Desktop environment (3/13) (optional)
	- Xfce, MATE, GNOME, KDE Plasma, Budgie, Cinnamon, LXQt, Enlightenment,
	- LXDE, Lumina
- Install Display Manager (optional)
    - LightDM, emptty, slim
- Install a Window manager (optional)
	- i3wm, Openbox, Fluxbox, bspwm, herbstluftwm, IceWM, awesome, jwm, dwm, FVWM3,
	- Wayfire, Sway
- Install fonts (optional)
- Install an Internet browser (optional)
	- Firefox, Firefox ESR, Chromium, Qutebrowser, Falkon, Badwolf
- Install LibreOffice (optional)
- Install GIMP + Inkscape (optional)
- Install QEMU + Virt Manager (optional)
- Install a Terminal emulator (optional)
	- Alacritty, Xterm, VXTerminal, Yakuake, Sakura, Kitty
- Install a Backup program (optional)
	- Borg, Deja-dup, Timeshift
- Install a Video player (optional)
	- mpv, VLC, Parole, Totem
- Enable required services 
- Configure Cron
- Configure PulseAudio (optional)
- Configure Network Management (optional)
	- Connman, Network Manager
- Configure Bluetooth (optional)
- Configure Printing support (optional)
- Configure TLP for notebook power saving (optional)
- Configure the Display manager (REQUIRES STEP 3/4)
- Start the Display manager (optional)
### How to use

Please make sure git is installed: <br><br>
`xbps-install -S git`

Then run: <br><br>
`git clone https://codeberg.org/fossraven/void-sh.git` <br>
`cd void-sh` <br>
`sh void.sh`

### Notes

- This program is not part of Void Linux.
- This program must be more tested for use on production systems.