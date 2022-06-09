#!/bin/bash
set -e
# REAPER
REAPER_VER="$(wget -qO-\
    http://reaper.fm|\
    grep VERSION|cut -d '>' -f2|cut -d ':' -f1|sed 's/VERSION //g')"
mkdir -p\
    cockos-reaper/DEBIAN
cat <<EOF |tee cockos-reaper/DEBIAN/control>/dev/null
Package: cockos-reaper
Version: $REAPER_VER
Architecture: amd64
Maintainer: Justin Frankel <justinfrankel@reaper.fm>
Pre-depends: aria2, wget
Depends: cadence|studio-controls|qjackctl, tar
Recommends: q4wine, yabridge
Section: audio
Priority: optional
Homepage: https://reaper.fm
Description: REAPER is a complete digital audio production application for Windows and OS X, offering a full multitrack audio and MIDI recording, editing, processing, mixing and mastering toolset, REAPER supports a vast range of hardware, digital formats and plugins, and can be comprehensively extended, scripted and modified.
EOF
cat <<EOF |tee cockos-reaper/DEBIAN/preinst>/dev/null
cd /tmp
rm -rf\
    /tmp/*reaper*\
    /tmp/*libSwell*
aria2c --console-log-level=error --summary-interval=0\
    http://reaper.fm/"\$(wget -qO-\
        http://reaper.fm/download.php|\
        grep _linux_x86_64.tar.xz|cut -d '"' -f2)"
tar fx\
    reaper*_linux_x86_64.tar.xz\
    -C /tmp
sed -i\
    's/rmdir --/rm -rf --/g'\
    /tmp/reaper*/install-reaper.sh
/tmp/reaper*/install-reaper.sh\
    --install /opt\
    --integrate-desktop\
    --quiet\
    --integrate-sys-desktop
wget -qO\
    libSwell.colortheme\
    https://stash.reaper.fm/41334/libSwell.colortheme
mv libSwell.colortheme /opt/REAPER/libSwell.colortheme
echo "
Actions=NewProject;ShowAudioConfig;ReaMote;WhatsNew;License;
[Desktop Action NewProject]
Name=REAPER (create new project)
Name[pt_BR]=REAPER (criar novo projeto)
Exec=/opt/REAPER/reaper -new
Icon=cockos-reaper
[Desktop Action ShowAudioConfig]
Name=REAPER (show audio configuration on startup)
Name[pt_BR]=REAPER (mostrar configurações de áudio ao iniciar)
Exec=/opt/REAPER/reaper -audiocfg
Icon=cockos-reaper
[Desktop Action ReaMote]
Name=ReaMote
Exec=/opt/REAPER/reamote-server
Icon=folder-remote
[Desktop Action WhatsNew]
Name=What's new
Name[pt_BR]=O que há de novo?
Exec=xdg-open /opt/REAPER/whatsnew.txt
Icon=text-x-plain
[Desktop Action License]
Name=License and User Agreement
Name[pt_BR]=Licença e contrato de usuário
Exec=xdg-open /opt/REAPER/EULA.txt
Icon=text-x-plain">>/usr/share/applications/cockos-reaper.desktop
EOF
chmod +x\
    cockos-reaper/DEBIAN/preinst
cat <<EOF |tee cockos-reaper/DEBIAN/prerm>/dev/null
rm -rf /opt/REAPER /usr/share/applications/cockos-reaper*
find /usr/share/applications -name *cockos-reaper* -delete
find /usr/share/icons/hicolor -name *cockos-reaper* -delete
find /usr/share/ -name *x-reaper* -delete
EOF
chmod +x\
    cockos-reaper/DEBIAN/prerm
dpkg-deb -b cockos-reaper .
mv cockos-reaper*.deb assets/packages
rm -rf cockos-reaper*