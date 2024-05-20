#!/system/bin/sh
# Script by AraafRoyall
# Do not modify a single word from this script!
# The developer is not responsible for any damage caused by using this module
# •••••••••••••••••••••••••••••••••••••••

ui_print "[*] Initializing Setup...."

ui_print "[*] Backing up build.prop file to Internal Storage"

# backup build.prop

if ! { cp /system/build.prop /sdcard/ || cat /system/build.prop > /sdcard/build.prop || dd if=/system/build.prop of=/sdcard/build.prop; }; then
  ui_print "Unable to backup by any method"
else
  ui_print "[*] Backup Done"
fi




# verify the backup was created
if [ -f "/sdcard/build.prop" ]; then
    ui_print "[*] Backup Found"
else
    ui_print "[!] Backup failed & No Need to exiting..."
fi


ui_print "[*] Making Temporary Changes"

if command -v mkdir >/dev/null 2>&1; then
  mkdir -p /$MODPATH/system
  ui_print "[*] Successfully Created Directory"
else
  ui_print "Trying Alternative Method"

if command -v install >/dev/null 2>&1; then
  install -d /$MODPATH/system
  ui_print "Successfully Created Directory"
else
  ui_print "Failed to Create Directory"
fi

fi


rm -rf /$MODPATH/README.md
rm -rf /$MODPATH/system/tmp.file

############################################



# main part of the script
ui_print "[*] Creating systemless build.prop"


if ! { cp /system/build.prop /$MODPATH/system/ || cat /system/build.prop > /$MODPATH/system/build.prop || dd if=/system/build.prop of=/$MODPATH/system/build.prop; }; then
  ui_print "Unable to create systemless build.prop by any method"
else
  ui_print "[*] Systemless build.prop created"
fi


ui_print "[*] Checking installation..."
if [ -f "$MODPATH/system/build.prop" ]; then
    ui_print "[*] Reboot to apply the changes"
    ui_print "[*] All edits to build.prop will be systemlessly performed"
    ui_print "[*] If there is an issue, just disable or uninstall this module and the changes will be reverted"
else
    abort "[!] Something went wrong, exiting..."
fi

ui_print "[*] Sucessfully installed"
