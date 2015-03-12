XBMC for Mac (http://xbmc.org)] depends on [MacPorts](http://www.macports.org/) for numerous open source tools and libraries which are not present in the native Mac OSX environment. This project preserves and simplifies the build, install and deploy environment for XBMC for Mac.

This fork is from MacPorts 1.7.1 as it is the last version that allows the targeting of specific OSX SDK versions. This ability enabled the build and deployment of an OSX application that can run on several version of Apple's Mac OSX operation system. Unfortunately, this ability has been removed from the current version (1.8.0) as it was seen as "never been a supported option" and it's use as MacPorts "being abused".

This fork also includes a fork of the portfiles as these are used to instruct and guide the building of tools and libraries. These portfiles are common among all MacPorts versions and the recent changes with MacPorts with respect to new versions have rendered the existing portfiles forever incompatible with previous MacPorts versions.

Other OSX Application developers are welcome use this fork for building their multi-version compatible OSX applications. In addition, developers can now ensure their GPL responsibilities by enabling users to build the exact same binary tools and libraries that might be bundled with their distributions.

You must already have Xcode 3.x and 10.4 SDK installed. The 10.4 SDK is not defaulted so you will have to select it when installing Xcode.


Thanks to [DamianXD](http://xbmc.org/forum/showpost.php?p=428884&postcount=5) on the XBMC forums for the following method to install the macports 1.7.

1.- Remove any previous installation of macports from your mac with this console command:
```
sudo rm -rf \
    /opt/local \
    /etc/manpaths.d/macports \
    /etc/paths.d/macports \
    /Applications/DarwinPorts \
    /Applications/MacPorts \
    /Library/LaunchDaemons/zorg.macports.* \
    /Library/Receipts/DarwinPorts*.pkg \
    /Library/Receipts/MacPorts*.pkg \
    /Library/StartupItems/DarwinPortsStartup \
    /Library/Tcl/darwinports1.0 \
    /Library/Tcl/macports1.0
```

2.- SVN download the source from xbmc-port-depends with this command:
```
svn export http://xbmc-port-depends.googlecode.com/svn/trunk/ xbmc-port-depends-read-only
```

3.- Use the terminal and go inside the base folder and compile the program with the following commands:
```
cd xbmc-port-depends-read-only/base/base/
./configure
make
sudo make install
```

4.- Add MacPorts to your PATH environment variable. Edit or create a ".profile" file (watch that period in front of the name, this is a hidden file) in your login directory and add the following to it:
```
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
```

5.- If you are under 10.6 (Snow Leopard), remember to switch the default compilers to gcc-4.0. We do it this way because the macport and XBMC for Mac build system is complex and makes some silly assumptions. However, remember that macports itself needs to be built using the xxx-4.2 version or it will fail when doing "make install"
```
cd /usr/bin
sudo rm cc gcc c++ g++
sudo ln -s gcc-4.0 cc
sudo ln -s gcc-4.0 gcc
sudo ln -s c++-4.0 c++
sudo ln -s g++-4.0 g++
```

6.- Open the source.conf file using nano and point your dports folder (the other folder downloaded by the SVN of xbmc-port-depends) at the end of the file, after rsync://rsync.macports.org/release/ports/
```
sudo nano /opt/local/etc/macports/sources.conf
```
Add the path to the location of xbmc-port-depends-read-only/dports and comment out the rsync path.
```
#rsync://rsync.macports.org/release/ports/ [default]
file:///<path to>/xbmc-port-depends-read-only/dports/ [default]
```

7.- Finish the macport install by starting at step 3.1 in README.osx (the one included on the SVN of XBMC) and then you can start the build of XBMC depends and XBMC itself.
