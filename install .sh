#sudo transactional-update shell
# inside the transactional shell:
cp usbmount /usr/share/usbmount/usbmount
chmod 0755 /usr/share/usbmount/usbmount

mkdir -p /etc/usbmount
cp usbmount.conf /etc/usbmount/usbmount.conf

mkdir -p /etc/usbmount/mount.d   # instead of copying missing dir
# (leave it empty or add scripts later)

mkdir -p /etc/udev/rules.d
cp 90-usbmount.rules /etc/udev/rules.d/

mkdir -p /etc/systemd/system
cp usbmount@.service /etc/systemd/system/
