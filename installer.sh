#!/bin/sh

pkg install awesome

if [ -f /root/.xinitrc ]
then
    # Если файл уже существует, заменяем его содержимое
    echo "exec awesome" > /root/.xinitrc
else
    # Если файла нет, создаем его со значением "exec awesome"
    touch /root/.xinitrc
    echo "exec awesome" > /root/.xinitrc
fi

echo "hostname=\"pc\"
ifconfig_re0=\"DHCP\"
sshd_enable=\"YES\"
moused_enable=\"YES\"
dbus_enable=\"YES\"
hald_enable=\"YES\"
slim_enable=\"YES\"
dumpdev=\"AUTO\"" > /etc/rc.conf

read -p "Reboot? (y/n): " answer
if [ "$answer" = "y" ]
then
    reboot
fi
