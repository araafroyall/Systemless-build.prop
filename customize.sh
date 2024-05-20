#!/system/bin/sh
# Script by AraafRoyall
# Do not modify a single word from this script!
# The developer is not responsible for any damage caused by using this module
# •••••••••••••••••••••••••••••••••••••••

ui_print "[*] Initializing Setup...."

ui_print "[*] Backing up build.prop file to Internal Storage"

# backup build.prop

if command -v cp >/dev/null 2>&1; then
  cp /system/build.prop /sdcard/
else
  ui_print "Trying Alternative Method" 

if command -v cat >/dev/null 2>&1; then
  cat /system/build.prop > /sdcard/build.prop
else
  ui_print "Trying Alternative Method"
if command -v dd >/dev/null 2>&1; then
  dd if=/system/build.prop of=/sdcard/build.prop
else
  ui_print "Unable to backup by any Method"
fi
fi
fi






# verify the backup was created
if [ -f "/sdcard/build.prop" ]; then
    ui_print "[*] Backup completed"
else
    abort "[!] Backup failed, exiting..."
fi


ui_print "[*] Making Temporary Changes"
mkdir -p /$MODPATH/system
rm -rf /$MODPATH/system/tmp.file



# main part of the script
ui_print "[*] Creating systemless build.prop"
cp /system/build.prop /$MODPATH/system/
ui_print "[*] Systemless build.prop created"

ui_print "[*] Checking installation..."
if [ -f "$MODPATH/system/build.prop" ]; then
    ui_print "[*] Reboot to apply the changes"
    ui_print "[*] All edits to build.prop will be systemlessly performed"
    ui_print "[*] If there is an issue, just disable or uninstall this module and the changes will be reverted"
else
    abort "[!] Something went wrong, exiting..."
fi

ui_print "[*] Sucessfully installed"
