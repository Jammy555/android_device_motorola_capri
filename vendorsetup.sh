#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Lunch combos are now defined in AndroidProducts.mk
# add_lunch_combo calls are obsolete

# TWRP Configuration for Motorola Capri (Moto G(10))
# Device-specific environment variables for TWRP build

# Device Information
export DEVICE_NAME="capri"
export DEVICE_MANUFACTURER="motorola"
export DEVICE_MODEL="Moto G(10)"

# Build Configuration
export ALLOW_MISSING_DEPENDENCIES=true
export BUILD_BROKEN_DUP_RULES=true
export BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES=true

# TWRP Specific Configuration
export TW_THEME="portrait_hdpi"
export TW_EXTRA_LANGUAGES=true
export TW_SCREEN_BLANK_ON_BOOT=true
export TW_INPUT_BLACKLIST="hbtp_vm"
export TW_USE_TOOLBOX=true
export TW_INCLUDE_REPACKTOOLS=true

# TWRP Build Flags
export TARGET_RECOVERY_QCOM_RTC_FIX=true
export TW_BACKUP_EXCLUSIONS="/data/fonts/files"
export TW_CUSTOM_CPU_TEMP_PATH="/sys/devices/virtual/thermal/thermal_zone34/temp"
export TW_BRIGHTNESS_PATH="/sys/class/backlight/panel0-backlight/brightness"
export TW_DEFAULT_BRIGHTNESS=547
export TW_MAX_BRIGHTNESS=2047
export TW_QCOM_ATS_OFFSET=1666528204500
export TW_EXCLUDE_APEX=true
export TW_EXCLUDE_DEFAULT_USB_INIT=true
export TW_FRAMERATE=60
export TW_INCLUDE_CRYPTO=true
export TW_NO_EXFAT_FUSE=true
export TW_INCLUDE_RESETPROP=true
export TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID=true

# Additional TWRP flags
export TW_NO_REBOOT_BOOTLOADER=true
export TW_HAS_DOWNLOAD_MODE=true
export TW_INCLUDE_NTFS_3G=true
export TW_EXCLUDE_SUPERSU=true
export TW_USE_NEW_MINADBD=true
export LZMA_RAMDISK_TARGETS=recovery

# Device-specific overrides
export TW_OVERRIDE_SYSTEM_PROPS="ro.build.date.utc;ro.bootimage.build.date.utc=ro.build.date.utc;ro.odm.build.date.utc=ro.build.date.utc;ro.product.build.date.utc=ro.build.date.utc;ro.system.build.date.utc=ro.build.date.utc;ro.system_ext.build.date.utc=ro.build.date.utc;ro.vendor.build.date.utc=ro.build.date.utc"

# Debug and Logging
export TARGET_USES_LOGD=true
export TWRP_INCLUDE_LOGCAT=true
