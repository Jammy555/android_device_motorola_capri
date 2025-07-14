#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
add_lunch_combo twrp_capri-user
add_lunch_combo twrp_capri-userdebug
add_lunch_combo twrp_capri-eng

export FOX_VIRTUAL_AB_DEVICE=1
export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1
export OF_FL_PATH1="/tmp/flashlight"
export OF_ADVANCED_SECURITY=1
export FOX_VARIANT="A14"

# Screen Settings for Capri (Motorola Moto G(10))
export OF_SCREEN_H=720
export OF_STATUS_H=100
export OF_STATUS_INDENT_LEFT=50
export OF_STATUS_INDENT_RIGHT=48
export OF_HIDE_NOTCH=1
export OF_CLOCK_POS=1
export OF_ALLOW_DISABLE_NAVBAR=0

export OF_USE_GREEN_LED=0
export OF_ENABLE_LPTOOLS=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_UNMOUNT_SDCARDS_BEFORE_REBOOT=1
export FOX_USE_UPDATED_MAGISKBOOT=1

export OF_QUICK_BACKUP_LIST="/boot"
export OF_DEFAULT_TIMEZONE="IST-5:30"  
export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1
export FOX_DELETE_AROMAFM=1

# Extras
export FOX_USE_BASH_SHELL=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_USE_ZSTD_BINARY=1
export FOX_ASH_IS_BASH=1
export ALLOW_MISSING_DEPENDENCIES=true
