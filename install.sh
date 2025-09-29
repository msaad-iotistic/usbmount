#sudo transactional-update shell
# inside the transactional shell:

# function to copy files to a directory, creating the directory if it doesn't exist
cp2dir() {
    src="$1"
    dst_dir="$2"

    mkdir -p "$dst_dir"
    cp "$src" "$dst_dir"

    if [ $? -ne 0 ]; then
        echo "Error copying $src to $dst_dir"
        exit 1
    fi
    echo "Copied $src to $dst_dir"
}

cp2dir "00_create_model_symlink" "/etc/usbmount/mount.d"
cp2dir "00_remove_model_symlink" "/etc/usbmount/umount.d"
cp2dir "usbmount" "/usr/share/usbmount"
chmod 0755 /usr/share/usbmount/usbmount

cp2dir "usbmount.conf" "/etc/usbmount"
cp2dir "90-usbmount.rules" "/lib/udev/rules.d"
cp2dir "usbmount@.service" "/lib/systemd/system"