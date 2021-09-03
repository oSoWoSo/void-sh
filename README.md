# void.sh

void-sh is a program written in Bash that configures Void Linux.

### Content

- Update the system
- Install recommended packages
- Install development packages
- Install the X Window System (1/11) (optional)
- Install a Desktop environment (2/11) (optional)
    - Xfce, MATE, GNOME, KDE Plasma, Budgie, Cinnamon, LXQt, Enlightenment, LXDE
- Install Display Manager (3/11) (optional)
    - LightDM, emptty, slim
- Install a Window manager (4/11) (optional)
    - i3wm, Openbox, Fluxbox, bspwm, herbstluftwm, IceWM, awesome, jwm, dwm, FVWM3
- Install fonts (5/11) (optional)
- Install an Internet browser (6/11) (optional)
- Install LibreOffice (7/11) (optional)
- Install GIMP + Inkscape (8/11) (optional)
- Install QEMU + Virt Manager (9/11) (optional)
- Install a Terminal emulator (10/11) (optional)
- Enable required services (11/11)
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
