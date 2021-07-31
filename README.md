# void.sh

void-sh is a program written in Bash that configures Void Linux.

### Content

- Install recommended packages
- Install development packages
- Install the X Window System (1/10) (optional)
- Install a Desktop environment (2/10) (optional)
    - Xfce, MATE, GNOME, KDE Plasma, Budgie, Cinnamon, LXQt, Enlightenment, LXDE
- Install a Window manager (3/10) (optional)
    - i3wm, Openbox, Fluxbox, bspwm, herbstluftwm, IceWM, jwm, dwm, FVWM3
- Install fonts (4/10) (optional)
- Install an Internet browser (5/10) (optional)
- Install LibreOffice (6/10) (optional)
- Install GIMP + Inkscape (7/10) (optional)
- Install QEMU + Virt Manager (8/10) (optional)
- Install a Terminal emulator (9/10) (optional)
- Enable required services (10/10)
- Configure Cron
- Configure Audio (optional)
- Configure Network Management (optional)
- Configure Bluetooth (optional)
- Configure Printing support (optional)
- Configure TLP for notebook power saving (optional)
- Configure the Display manager (REQUIRES STEP 2/3)

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
