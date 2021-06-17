#!/bin/bash -ex
if [ "$UID" != "0" ]; then
	echo "Please run this script with ROOT user."
	exit 2
fi 

mkdir -p /lib/firmware/edid
echo "AP///////wAJ5QMAAwAAAAEdAQOACxF4LwAAoFdJmyYQSE8AAAABAQEBAQEBAQEBAQEBAQEBwhogUDAAEFAQEDIAbKwAAAAYAAAA/ABUVjA4MFdVTS1OTDAKAAAA/QA8PBAQBwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMM=" | base64 --decode > /lib/firmware/edid/gpdwinmax.bin
echo 'GRUB_CMDLINE_LINUX="video=eDP-1:800x1280 drm.edid_firmware=eDP-1:edid/gpdwinmax.bin fbcon=rotate:1"' >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg