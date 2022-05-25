## Script that downloads the dependencies for P4VASP   ##
## 		and compile p4vasp global	       ##
## Roman Pico 25/05/2022			       ##
#########################################################
##P4vasp was taken out of the debian repository for debian 11 (also for ubuntu 20.04). Thus, we can't use sudo apt-get install p4vasp
##Some dependencies, like Gtk2 (needed for python-glade2), Python Glade 2, Epydoc are also missing in the repositories. We need to manually download them. 
##Finally, it seems that the folder fltk-1.3.0 is also missing, so we are downloading it.
## If you can't use this script for automatically installing p4vasp global, try to download the dependencies mentioned here and manually install them
## and finally follow the guide at https://github.com/orest-d/p4vasp
## Special thanks to Ioritz Paulis for actually finding how to solve this problem.
##
##We believe this solution works for the common debian like OS (Debian, Ubuntu, Linux Mint)

#!/bin/bash
wget http://prdownloads.sourceforge.net/epydoc/epydoc-3.0.1.tar.gz 
wget http://ftp.de.debian.org/debian/pool/main/p/pygtk/python-gtk2_2.24.0-5.1+b1_amd64.deb
wget http://ftp.de.debian.org/debian/pool/main/p/pygtk/python-glade2_2.24.0-5.1+b1_amd64.deb
wget https://www.fltk.org/pub/fltk/1.3.0/fltk-1.3.0-source.tar.gz
tar -xf fltk-1.3.0-source.tar.gz
tar -xf epydoc-3.0.1.tar.gz

sudo apt-get install python-dev g++ libx11-dev mesa-common-dev libglu1-mesa-dev python-opengl python-numpy 
# For documentation:
sudo apt-get install  doxygen
sudo dpkg -i python-gtk2_2.24.0-5.1+b1_amd64.deb
sudo dpkg -i python-glade2_2.24.0-5.1+b1_amd64.deb
cd epydoc-3.0.1
sudo make install
cd ../
cp -r fltk-1.3.0/ ext/
sudo make config
sudo make install

