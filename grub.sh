#!/usr/bin/env bash
#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2020                                            //
#//  Created: 01, November, 2020                             //
#//  Modified: 16, August, 2021                              //
#//  file: -                                                 //
#//  -                                                       //
#//  Source:                                                 //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

if [ "$UID" != "0" ]; then
	echo "Please run this script with ROOT user."
	exit 2
fi

mkdir -p /lib/firmware/edid
echo "AP///////wAJ5QMAAwAAAAEdAQOACxF4LwAAoFdJmyYQSE8AAAABAQEBAQEBAQEBAQEBAQEBwhogUDAAEFAQEDIAbKwAAAAYAAAA/ABUVjA4MFdVTS1OTDAKAAAA/QA8PBAQBwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMM=" | base64 --decode > gpdwinmax.bin
echo "12387d0061c5e778812f402452174f8174d4014216769dacac4e4daaaa6fcd6d gpdwinmax.bin" | sha256sum -c
cp gpdwinmax.bin /lib/firmware/edid/gpdwinmax.bin
rm gpdwinmax.bin
echo 'GRUB_CMDLINE_LINUX="${GRUB_CMDLINE_LINUX} video=eDP-1:800x1280 drm.edid_firmware=eDP-1:edid/gpdwinmax.bin fbcon=rotate:1"' >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
