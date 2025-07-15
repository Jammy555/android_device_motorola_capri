#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/capri

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.bengal

# Boot control HAL - using shared library instead of static
PRODUCT_PACKAGES += \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += fastbootd

# qcom decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Platform
QCOM_BOARD_PLATFORMS += $(PRODUCT_PLATFORM)
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_BOARD_PLATFORM)

BUILD_BROKEN_DUP_RULES := true

RELAX_USES_LIBRARY_CHECK := true

# A/B support
AB_OTA_UPDATER := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B updater updatable partitions list for Capri
AB_OTA_PARTITIONS ?= system system_ext vendor product

# f2fs utilities
PRODUCT_PACKAGES += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

# Userdata checkpoint
PRODUCT_PACKAGES += \
    checkpoint_gc

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# Set GRF/Vendor freeze properties
BOARD_SHIPPING_API_LEVEL := 31
BOARD_API_LEVEL := 31
SHIPPING_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 31

#Support to compile recovery without msm headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# Add default implementation of fastboot HAL.
PRODUCT_PACKAGES += android.hardware.fastboot@1.1-impl-mock

#namespace definition for librecovery_updater
#differentiate legacy 'sg' or 'bsg' framework
SOONG_CONFIG_NAMESPACES += ufsbsg
SOONG_CONFIG_ufsbsg += ufsframework
SOONG_CONFIG_ufsbsg_ufsframework := bsg

# Enable Fuse Passthrough
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

#system avb
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Vendor Dependencies from recovery/root/vendor
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root/vendor/etc,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root/vendor/lib64,$(TARGET_COPY_OUT_VENDOR)/lib64)

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root/vendor/firmware,$(TARGET_COPY_OUT_VENDOR)/firmware)

# System Dependencies from recovery/root/system
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root/system/bin,$(TARGET_COPY_OUT_SYSTEM)/bin)

# Only copy non-vintf files from system/etc
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root/system/etc,$(TARGET_COPY_OUT_SYSTEM)/etc)
# Remove manifest.xml or any VINTF XMLs from the above if present (handled by PRODUCT_VINTF_FRAGMENTS)

# VINTF fragments for system
PRODUCT_VINTF_FRAGMENTS += \
    $(DEVICE_PATH)/recovery/root/system/etc/vintf/manifest.xml

# Recovery init files
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/android.hardware.boot-service.qti.recovery.rc:$(TARGET_COPY_OUT_RECOVERY)/root/android.hardware.boot-service.qti.recovery.rc \
    $(DEVICE_PATH)/recovery/root/init.qcom.recovery.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.qcom.recovery.rc \
    $(DEVICE_PATH)/recovery/root/init.recovery.usb.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.usb.rc \
    $(DEVICE_PATH)/recovery/root/servicemanager.recovery.rc:$(TARGET_COPY_OUT_RECOVERY)/root/servicemanager.recovery.rc

# Recovery wipe configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery.wipe:$(TARGET_COPY_OUT_RECOVERY)/root/etc/recovery.wipe
