#!/system/bin/sh
# Script by AraafRoyall
# Do not modify a single word from this script!
# The developer is not responsible for any damage caused by using this module
# •••••••••••••••••••••••••••••••••••••••

ui_print "[*] Initializing Setup...."

# Basic Script

rm -rf /$MODPATH/{README.md,LICENSE,update.json,changelog.md,system/vendor/tmp} || ui_print "Failed to remove unwanted files. Skipping..."


if [ ! -d "$MODPATH/system" ]; then
if ! { mkdir -p "$MODPATH/system" || install -d "$MODPATH/system"; }; then
  abort "Failed to create directory: $MODPATH/system/vendor"
fi
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



if [ ! -d "$MODPATH/system/vendor" ]; then
if ! { mkdir -p "$MODPATH/system/vendor" || install -d "$MODPATH/system/vendor"; }; then
  abort "Failed to create directory: $MODPATH/system/vendor"
fi
fi


  

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



ui_print "[*] Additionally providing permissions to make editable by any method"

if command -v chmod > /dev/null 2>&1; then
  chmod 777 /$MODPATH/system/build.prop
chmod 777 /$MODPATH/system/vendor/build.prop
else
  ui_print "Failed to Grant Permission, Skipping..."
fi




ui_print "[*] All Done."
    ui_print "[*] Reboot to apply the changes"
    ui_print "[*] All edits to build.prop will be systemlessly performed"
    ui_print "[*] If there is an issue, just disable or uninstall this module and the changes will be reverted"



ui_print "[*] Sucessfully installed"
