#!/bin/sh

rm -rf system system32 system64

wget https://github.com/KhushrajRathod/VoLTE-Fix/releases/download/v5/GSI-Qualcomm-VoLTE-Fix.zip -O volte-fix.zip
unzip volte-fix.zip 'system*/*' -d .
rm -f volte-fix.zip

zip -x 'createzip.sh' -x '*.zip' -x 'LICENSE' -x 'README.md' -r9 volte.zip *
