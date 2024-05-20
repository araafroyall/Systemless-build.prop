#!/system/bin/sh
# Script by AraafRoyall
# Do not modify a single word from this script!
# The developer is not responsible for any damage caused by using this module
# •••••••••••••••••••••••••••••••••••••••

ui_print "[*] Initializing Setup...."

# Basic Script

rm -rf /$MODPATH/README.md /$MODPATH/system/vendor/LICENSE



if ! { mkdir -p "$MODPATH/system" || install -d "$MODPATH/system/vendor"; }; then
  echo "Failed to create directory: $MODPATH/system/vendor"
else
  ui_print " "
fi


if ! { mkdir -p "$MODPATH/system/vendor" || install -d "$MODPATH/system/vendor"; }; then
  echo "Failed to create directory: $MODPATH/system/vendor"
else
  ui_print " "
fi


# •••••••••••• Basic Script End ••••••••••••••





# Check if /system/build.prop exists
if [ ! -f "/system/build.prop" ]; then
  ui_print "[!] /system/build.prop not found on your Device ,Exiting..."
  exit 1
fi


# main part of the script
ui_print "[*] Creating systemless build.prop"


if ! { cp /system/build.prop /$MODPATH/system/ || cat /system/build.prop > /$MODPATH/system/build.prop || dd if=/system/build.prop of=/$MODPATH/system/build.prop; }; then
  ui_print "Unable to create systemless build.prop by any method"
abort "[!] Something went wrong, exiting..."
else
  
ui_print "[*] Checking installation..."
if [ -f "$MODPATH/system/build.prop" ]; then
    ui_print "[*] Systemless build.prop created"
else
    abort "[!] Something went wrong, exiting..."
fi
fi



# PART 2 For Vendor Props
###############################################
###############################################
###############################################
###############################################

# Check if /system/vendor/build.prop exists
if [ -f "/system/vendor/build.prop" ]; then
  

# main part of the script
ui_print "[*] Creating systemless Vendor build.prop"

if ! { cp /system/vendor/build.prop /$MODPATH/system/vendor/ || \
       cat /system/vendor/build.prop > /$MODPATH/system/vendor/build.prop || \
       dd if=/system/vendor/build.prop of=/$MODPATH/system/vendor/build.prop; }; then
  ui_print "Unable to create systemless vendor build.prop by any method"
  ui_print "[!] Something went wrong, Skipping..."
else
  ui_print "[*] Checking installation..."
  if [ -f "$MODPATH/system/vendor/build.prop" ]; then
    ui_print "[*] Systemless vendor build.prop created"
  else
    ui_print "[!] Something went wrong, Unable to create systemless vendor build.prop by any method.. skipping..."
  fi
fi






else
  ui_print "[!] /system/vendor/build.prop not found on your Device, Skipping..."
fi





ui_print "[*] All Done."
    ui_print "[*] Reboot to apply the changes"
    ui_print "[*] All edits to build.prop will be systemlessly performed"
    ui_print "[*] If there is an issue, just disable or uninstall this module and the changes will be reverted"



ui_print "[*] Sucessfully installed"
