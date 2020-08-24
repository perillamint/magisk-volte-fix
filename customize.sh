SKIPUNZIP=1

unzip -o "$ZIPFILE" -x 'META-INF/*' -x 'system32/*' -x 'system64/*' -d "$MODPATH" >&2

ARCHFILE="system32"

if [ "$IS64BIT" == "true" ]; then
    ARCHFILE="system64"
fi

ui_print "Installing $ARCHFILE"

unzip -o "$ZIPFILE" "$ARCHFILE/*" -d "$TMPDIR"
cp -r "$TMPDIR/$ARCHFILE/"* "$MODPATH/system/"

ui_print "Installation successful!"
