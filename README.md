# void.sh

void-sh is a program written in Bash that configures Void Linux.

### Content

- Update the system
- Install recommended packages
- Install development packages
- Install the X Window System (1/13) (optional)
- Install a Desktop environment (2/13) (optional)
    - Xfce, MATE, GNOME, KDE Plasma, Budgie, Cinnamon, LXQt, Enlightenment,
	- LXDE, Lumina
- Install Display Manager (3/13) (optional)
    - LightDM, emptty, slim
- Install a Window manager (4/13) (optional)
    - i3wm, Openbox, Fluxbox, bspwm, herbstluftwm, IceWM, awesome, jwm, dwm, FVWM3,
	- Wayfire, Sway
- Install fonts (5/13) (optional)
- Install an Internet browser (6/13) (optional)
- Install LibreOffice (7/13) (optional)
- Install GIMP + Inkscape (8/13) (optional)
- Install QEMU + Virt Manager (9/13) (optional)
- Install a Terminal emulator (10/13) (optional)
- Install a Backup program (11/13)
- Install a Video player (12/13)
- Enable required services (13/13)
- Configure Cron
- Configure Audio (optional)
- Configure Network Management (optional)
- Configure Bluetooth (optional)
- Configure Printing support (optional)
- Configure TLP for notebook power saving (optional)
- Configure the Display manager (REQUIRES STEP 2/3/4)

### How to use

Please make sure git is installed: <br><br>
`xbps-install -S git`

Then run: <br><br>
`git clone https://codeberg.org/fossraven/void-sh.git` <br>
`cd void-sh` <br>
`sudo sh void.sh`

This script should be executed as root because it must execute the package manager
and copy some configuration files.

### Notes

- This program is not part of Void Linux.
- This program was successfully tested and can be used on production systems.
