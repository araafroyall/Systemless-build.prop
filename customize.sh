#!/system/bin/sh
# Script by AraafRoyall
# Do not modify a single word from this script!
# The developer is not responsible for any damage caused by using this module
# •••••••••••••••••••••••••••••••••••••••

ui_print "[*] Initializing Setup...."

# Check if /system/build.prop exists
if [ ! -f "/system/build.prop" ]; then
  ui_print "[!] /system/build.prop not found on your Device ,Exiting..."
  exit 1
fi

ui_print "[*] Backing up build.prop file to Internal Storage"

# backup build.prop

if ! { cp /system/build.prop /data/media/0/ || cat /system/build.prop > /data/media/0/build.prop || dd if=/system/build.prop of=/data/media/0/build.prop; }; then
  ui_print "[!] Unable to backup by any method , Skip..."
else
  if [ -f "/sdcard/build.prop" ]; then
    ui_print "[*] Backup Success to Internal Storage"
else
    ui_print "[!] Backup failed & Skip...."
fi
fi



# •••••••••••••••••••••••••••••••••••••••
ui_print "[*] Making Directory"

if ! { mkdir -p /$MODPATH/system || install -d /$MODPATH/system; }; then
  ui_print "Failed to Create Directory"
else
  ui_print "[*] Successfully Created Directory"
fi



# •••••••••••••••••••••••••••••••••••••••
rm -rf /$MODPATH/README.md /$MODPATH/system/vendor/tmp.file
# •••••••••••••••••••••••••••••••••••••••


# main part of the script
ui_print "[*] Creating systemless build.prop"


if ! { cp /system/build.prop /$MODPATH/system/ || cat /system/build.prop > /$MODPATH/system/build.prop || dd if=/system/build.prop of=/$MODPATH/system/build.prop; }; then
  ui_print "Unable to create systemless build.prop by any method"
abort "[!] Something went wrong, exiting..."
else
  ui_print "[*] Systemless build.prop created"
ui_print "[*] Checking installation..."
if [ -f "$MODPATH/system/build.prop" ]; then
    ui_print "[*] All Done."
    ui_print "[*] Reboot to apply the changes"
    ui_print "[*] All edits to build.prop will be systemlessly performed"
    ui_print "[*] If there is an issue, just disable or uninstall this module and the changes will be reverted"
else
    abort "[!] Something went wrong, exiting..."
fi
fi



ui_print "[*] Sucessfully installed"
