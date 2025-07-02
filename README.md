# endeavouros-xfce4-theming

![XFCE4 Screenshot](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/xfce4-screenshot-galileo.png "XFCE4 Screenshot")
The classic EndeavourOS XFCE4 Theming.


## EndeavourOS Theme for XFCE4 Installation:

### Quick Install
If you are really lazy, use the script:

(this will overwrite existing setup for the current user)

`wget https://raw.githubusercontent.com/EndeavourOS-Community-Editions/endeavouros-xfce4-theming/master/xfce.sh`

`sh ./xfce.sh`

### Installing Manually

(this will overwrite existing setup for the current user)

`git clone https://github.com/EndeavourOS-Community-Editions/endeavouros-xfce4-theming`

`cd endeavouros-xfce4-theming/etc/skel/`

`rm -rf ~/.config/xfce4 ~/.cache`

`cp .Xresources ~/.Xresources`

`cp .face ~/.face`

`cp -R .config/ ~/`

`sudo systemctl reboot`
