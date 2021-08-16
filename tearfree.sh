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
#//  Script, 2021                                            //
#//  Created: 16, August, 2021                               //
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

echo 'Section "Device"
Identifier "Device"
Driver     "intel"
Option     "AccelMethod" "sna"
Option     "TearFree"    "true"
Option     "DRI"         "3"
EndSection' > /usr/share/X11/xorg.conf.d/20-intel.conf
