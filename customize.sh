SKIPUNZIP=1

unzip -o "$ZIPFILE" -x 'META-INF/*' -x 'system32/*' -x 'system64/*' -x 'system-lmi/*' -d "$MODPATH" >&2

ARCHFILE="system32"

if [ "$IS64BIT" == "true" ]; then
    ARCHFILE="system64"
fi

ui_print "Installing $ARCHFILE"

unzip -o "$ZIPFILE" "$ARCHFILE/*" -d "$TMPDIR"
cp -r "$TMPDIR/$ARCHFILE/"* "$MODPATH/system/"

set_perm_recursive $MODPATH 0 0 0755 0644 u:object_r:system_file:s0

ui_print "Installation successful!"
