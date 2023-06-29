#!/system/bin/sh

# Script by AraafRoyall

# Do not modify any single word from this script
# Delevoper is not responsible for any damage cause using this Module 

ui_print "[*] Initialising Setup...."

ui_print "[*] Backing up Build.prop To /sdcard"

cp /system/build.prop /sdcard/

ui_print "[*] Backup Done..."

ui_print "[*] Making Systemless Build.prop In Module"

cp /system/build.prop /$MODPATH/system/

ui_print "[*] Done..."

ui_print "[*] Reboot to Use Systemless Build.prop"

ui_print "[*] All Edits to build.prop will be systemlessly perform , in case of issue just disable or Uninstall this Module"

#cmd here....

ui_print "[*] ........."

ui_print "[*] ........."

ui_print "[*] This Module made by AraafRoyall"
