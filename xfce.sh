#bin/bash

echo "******* Installing EndeavourOS Theming for XFCE4*******" && sleep 5

echo "******* cloning dotfiles for EndeavourOS - XFCE4 Theming *******" && sleep 1
    git clone https://github.com/EndeavourOS-Community-Editions/endeavouros-xfce4-theming.git
    cd endeavouros-xfce4-theming
echo "******* Getting theme and packages installed now: *******" && sleep 1
    wget -q --timeout=10 https://raw.githubusercontent.com/endeavouros-team/EndeavourOS-packages-lists/master/xfce4
    sudo pacman -S --noconfirm --needed - < xfce4

echo "******* setting up theme for Light-DM: *******" && sleep 1
    wget -q --timeout=10 https://raw.githubusercontent.com/endeavouros-team/EndeavourOS-ISO/main/airootfs/etc/lightdm/slick-greeter.conf
    sudo cp  slick-greeter.conf /etc/lightdm/
    
echo "******* set lightdm.conf to logind-check-graphical=true ... enable slick greeter to be used *******" && sleep 1
    cp /etc/lightdm/lightdm.conf ~/endeavouros-xfce4-theming/
    sed -i 's?#logind-check-graphical=false?logind-check-graphical=true?' lightdm.conf
    sed -i 's?#greeter-session=example-gtk-gnome?greeter-session=lightdm-slick-greeter?' lightdm.conf
    sed -i 's?#allow-user-switching=true?allow-user-switching=true?' lightdm.conf
    sudo cp lightdm.conf /etc/lightdm/lightdm.conf

echo "******* enable lightdm to be used on boot *******" && sleep 1    
    sudo systemctl -f enable lightdm
      
echo "******* setting up xfce4 theme and settings: *******" && sleep 1
    cd "etc/skel/"
    rm -rf ~/.config/xfce4 ~/.cache
    cp .Xresources ~/.Xresources
    cp .face ~/.face
    cp -R .config/ ~/
    cd ..
    cd ..
    cd ..
    rm -rf endeavouros-xfce4-theming 

echo "******* All Done --- restarting System NOW! *******" && sleep 10
echo "******* Please login again and enjoy EndeavourOS Theming! *******" && sleep 1

    yad --title="Restarting System" \
        --text="All done --- please login again and enjoy XFCE4 with EndeavourOS Theming!" \
        --width=400 --height=100 \
        --button="Restart System":0

    sudo systemctl reboot

}

Main "$@"
