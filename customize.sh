#!/system/bin/sh
# Script by AraafRoyall
# Do not modify a single word from this script!
# The developer is not responsible for any damage caused by using this module
# •••••••••••••••••••••••••••••••••••••••

ui_print "[*] Initializing Setup...."

ui_print "[*] Backing up build.prop file to Internal Storage"

# backup build.prop
cp /system/build.prop /sdcard/

# verify the backup was created
if [ -f "/sdcard/build.prop" ]; then
    ui_print "[*] Backup completed"
else
    abort "[!] Backup failed, exiting..."
fi


ui_print "[*] Making Directories"
mkdir -p /$MODPATH/system

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
