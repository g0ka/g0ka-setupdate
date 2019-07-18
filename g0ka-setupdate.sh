#!/bin/bash

rpath="/opt/resources"

SCRIPT="$(realpath $0)"
SCRIPTPATH="$(dirname $SCRIPT)"
fpath="${SCRIPTPATH}/files"

echo "installation..."
apt-get -y -q install golang

echo "configuration..."
cp -f "${fpath}/.vimrc" "${HOME}/.vimrc"
cp -f "${fpath}/.profile" "${HOME}/.profile"
cp -f "${fpath}/xfce4-keyboard-shortcuts.xml" "${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"

echo "${rpath} population..."
mkdir -p "${rpath}"
cd "${rpath}"
if [ -e "PayloadsAllTheThings" ]; then
	cd PayloadsAllTheThings
	git pull
else
	git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
	cd PayloadsAllTheThings
fi

mkdir -p "${rpath}/bin"
cd "${rpath}/bin"
wget -q "https://github.com/DominicBreuker/pspy/releases/download/v1.0.0/pspy32" -O "${rpath}/bin/pspy32"
wget -q "https://github.com/DominicBreuker/pspy/releases/download/v1.0.0/pspy64" -O "${rpath}/bin/pspy64"
wget -q "https://github.com/DominicBreuker/pspy/releases/download/v1.0.0/pspy32s" -O "${rpath}/bin/pspy32s"
wget -q "https://github.com/DominicBreuker/pspy/releases/download/v1.0.0/pspy64s" -O "${rpath}/bin/pspy64s"
wget -q "https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip" -O "aquatone.zip"
unzip -u "aquatone.zip" "aquatone"
rm -f "aquatone.zip"

chmod 750 *

cd "${SCRIPTPATH}"
