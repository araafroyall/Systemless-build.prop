#!/system/bin/sh
# Script by AraafRoyall
# Do not modify a single word from this script!
# The developer is not responsible for any damage caused by using this module
# •••••••••••••••••••••••••••••••••••••••

ui_print "[*] Initializing Setup...."

# Command Script


# ••••••••••••••••••••••••••••••••••••••••


# Define the directories to be created
directories=(
  "/$MODPATH/system"
  "/$MODPATH/system/vendor"
  "/data/media/0/BuildPropBackup"
  "/data/media/0/BuildPropBackup/system"
  "/data/media/0/BuildPropBackup/vendor"
)

# Attempt to create each directory
for dir in "${directories[@]}"; do
  if ! { mkdir -p "$dir" || install -d "$dir"; }; then
    ui_print "Failed to create directory: $dir"
  else
    ui_print "[*] Successfully created directory: $dir"
  fi
done


# ••••••••••••••••••••••••••••••••••••••••

rm -rf /$MODPATH/README.md /$MODPATH/system/vendor/tmp.file

# •••••••••••• Comman Script End ••••••••••••••





# Check if /system/build.prop exists
if [ ! -f "/system/build.prop" ]; then
  ui_print "[!] /system/build.prop not found on your Device ,Exiting..."
  exit 1
fi

ui_print "[*] Backing up System build.prop file to Internal Storage"

# backup system build.prop

if ! { cp /system/build.prop /data/media/0/BuildPropBackup/system/ || cat /system/build.prop > /data/media/0/BuildPropBackup/system/build.prop || dd if=/system/build.prop of=/data/media/0/BuildPropBackup/system/build.prop; }; then
  ui_print "[!] Unable to backup by any method , Skip..."
else
  if [ -f "/sdcard/build.prop" ]; then
    ui_print "[*] Backup Success to Internal Storage"
else
    ui_print "[!] Backup failed & Skip...."
fi
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
  

ui_print "[*] Backing Up Vendor Prop to Internal Storage"

if ! { cp /system/vendor/build.prop /data/media/0/BuildPropBackup/system/vendor/ || \
       cat /system/vendor/build.prop > /data/media/0/BuildPropBackup/system/vendor/build.prop || \
       dd if=/system/vendor/build.prop of=/data/media/0/BuildPropBackup/system/vendor/build.prop; }; then
  ui_print "[!] Unable to backup /system/vendor/build.prop by any method, skipping..."
else
  if [ -f "/data/media/0/BuildPropBackup/system/vendor/build.prop" ]; then
    ui_print "[*] Backup of /system/vendor/build.prop successful to internal storage"
  else
    ui_print "[!] Backup of /system/vendor/build.prop failed, skipping..."
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





ui_print "[*] All Done."
    ui_print "[*] Reboot to apply the changes"
    ui_print "[*] All edits to build.prop will be systemlessly performed"
    ui_print "[*] If there is an issue, just disable or uninstall this module and the changes will be reverted"



ui_print "[*] Sucessfully installed"
