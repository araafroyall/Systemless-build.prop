#!/system/bin/sh
# Script by AraafRoyall
# Do not modify any single word from this script
# Developer is not responsible for any damage cause using this Module 
# •••••••••••••••••••••••••••••••••••••••

ui_print "[*] Initialising Setup...."

ui_print "[*] BackingUp Prop File to Internal Storage"

# Backup Code
cp /system/build.prop /sdcard/

# Backup Checker
if [ -f "/sdcard/build.prop" ]; then
    ui_print "Backup Done..."
else
    abort "Failed to Backup"
fi


# Main Part of the script

ui_print "[*] Making Systemless Build.prop In Module"

cp /system/build.prop /$MODPATH/system/
ui_print "[*] Done..."


ui_print "[*] Checking Installation..."
if [ -f "$MODPATH/system/build.prop" ]; then
    ui_print "Sucessfully Installed"
    ui_print "[*] Reboot to Use Systemless Build.prop"

ui_print "[*] All Edits to build.prop will be systemlessly perform , in case of issue just disable or Uninstall this Module"

ui_print "All Done.."
else
    abort "Something went wrong , Exiting..."
fi




ui_print "All Done.."
