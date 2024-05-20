#!/system/bin/sh
ui_print "[*] Initializing Setup..."
ui_print "[*] Backing up build.prop to Internal Storage"
for cmd in cp cat dd; do
  if command -v $cmd >/dev/null 2>&1; then
    $cmd /system/build.prop /sdcard/build.prop && break || ui_print "Trying Alternative Method"
  fi
done

[ -f "/sdcard/build.prop" ] && ui_print "[*] Backup completed" || abort "[!] Backup failed, exiting..."

ui_print "[*] Making Temporary Changes"
mkdir -p /$MODPATH/system 2>/dev/null || ui_print "Failed to Create Directory"

rm -rf /$MODPATH/README.md /$MODPATH/system/tmp.file

ui_print "[*] Creating systemless build.prop"
for cmd in cp cat dd; do
  if command -v $cmd >/dev/null 2>&1; then
    $cmd /system/build.prop /$MODPATH/system/build.prop && ui_print "[*] Systemless build.prop created" && break || ui_print "Trying Alternative Method"
  fi
done

if [ -f "$MODPATH/system/build.prop" ]; then
  ui_print "[*] Reboot to apply the changes"
  ui_print "[*] All edits to build.prop will be systemlessly performed"
  ui_print "[*] If there is an issue, just disable or uninstall this module and the changes will be reverted"
else
  abort "[!] Something went wrong, exiting..."
fi

ui_print "[*] Successfully installed"