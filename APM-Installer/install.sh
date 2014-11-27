#!/bin/sh
#Copyright (c) 2014 David Dworken
cd ~/ #Change Directory to the home directory. 
mkdir apmInstaller #MaKe a new DIRectory called apminstaller, to store all temp files in. 
cd apmInstaller #Change Directory to the ampinstaller directory
wget -O apmplanner.deb https://github.com/rspandolfi/DaVinciChallenge/releases/download/v2.0.1/apm_planner_2.0.15-7-gd94637c_ubuntu_trusty64.deb
 #Download the APM Planner .deb from the daily build on 11/26/14. The newer version is needed because older versions had a hard dependency on libopenscenegraph80, which is not available on Ubuntu 14.04. The choice was to either compile libopenscenegraph80, or simply switch to a newer version of APM Planner. Since compiling libopenscenegraph80 would introduce unnecesary complexities, it was decided to use the newest version of APM Planner. 
apt-get update #Update sources and source lists. 
apt-get -y install libopenscenegraph-dev git qt5-qmake qt5-default qtscript5-dev libqt5webkit5-dev libqt5serialport5-dev libqt5svg5-dev libsdl1.2-dev  libsndfile-dev flite1-dev libssl-dev libudev-dev libsdl2-dev libopenthreads14 libphonon4 libqt4-declarative libqt4-network libqt4-opengl libqt4-script libqt4-sql libqt4-svg libqt4-test libqt4-xml libqtcore4 libqtgui4 libqtwebkit4 libflite1 libopenthreads14 libqt4-test libsdl1.2debian libflite1 libgles2-mesa libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5opengl5 libqt5positioning5 libqt5printsupport5 libqt5qml5 libqt5quick5 libqt5script5 libqt5sensors5 libqt5serialport5 libqt5sql5 libqt5sql5-sqlite libqt5svg5 libqt5test5 libqt5webkit5 libqt5widgets5 libsdl2-2.0-0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-xkb1 libxkbcommon-x11-0 qtdeclarative5-qtquick2-plugin #Install all dependencies. 
dpkg -i apmplanner.deb #Install the APM Planner deb we just downloaded. 
cd .. #Cd to the above directory
rm -r apmInstaller #Delete the apmInstaller folder (no longer needed)
ln -s /usr/bin/apmplanner2 ~/Desktop/APM\ Planner #Sym link /usr/bin/apmplanner2 to the desktop. This will add APM Planner to the desktop. 
#Commented out because it is part of the code copy and pasted into the terminal. 
  #wget https://raw.githubusercontent.com/rspandolfi/DaVinciChallenge/master/APM-Installer/install.sh  -Download this script from github
  #sudo chmod +x install.sh                                                                            -Enable execution of this script
  #sudo sh install.sh                                                                                  -Run this script
  #sudo adduser $(whoami) dialout                                                                      -Add the current user to the dialout group. This is needed to allow apm planner to access the arducopter's serial port. 
