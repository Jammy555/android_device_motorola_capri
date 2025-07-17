# TWRP Device Tree for Motorola Moto G(10) (capri)

## Device Information

- **Device Name**: Motorola Moto G(10)
- **Device Codename**: capri
- **Manufacturer**: Motorola
- **Platform**: Qualcomm Snapdragon 460 (bengal)
- **Architecture**: ARM64
- **Android Version**: 12.1 (API 31)
- **Recovery**: TWRP (Team Win Recovery Project)

## Device Specifications

- **Screen**: 6.5" 1600x720 LCD
- **RAM**: 4GB
- **Storage**: 64GB/128GB
- **Battery**: 5000mAh
- **Camera**: 48MP + 8MP + 2MP + 2MP rear, 8MP front
- **Fingerprint**: Rear-mounted

## TWRP Features

- ✅ **A/B Partition Support**: Full support for A/B partition scheme
- ✅ **Decryption**: Support for FBE/FDE encryption
- ✅ **MTP**: USB Mass Storage support
- ✅ **ADB**: Android Debug Bridge support
- ✅ **Backup/Restore**: Full partition backup and restore
- ✅ **Install**: ROM, GApps, and Magisk installation
- ✅ **File Manager**: Built-in file manager
- ✅ **Terminal**: Built-in terminal
- ✅ **Multi-language**: Support for multiple languages

## Build Instructions

### Prerequisites

1. Set up TWRP build environment
2. Clone TWRP source code
3. Install required dependencies

### Building

```bash
# Clone the device tree
git clone https://github.com/your-username/android_device_motorola_capri.git device/motorola/capri

# Clone dependencies
git clone https://github.com/motorola/capri-kernel.git kernel/motorola/capri
git clone https://github.com/motorola/capri-vendor.git vendor/motorola/capri
git clone https://github.com/motorola/capri-common.git device/motorola/capri-common
git clone https://github.com/motorola/capri-hardware.git hardware/motorola/capri

# Build TWRP
source build/envsetup.sh
lunch twrp_capri-eng
mka recoveryimage
```

### Dependencies

The device tree requires the following dependencies:

- **Kernel**: motorola/capri-kernel (android-12.1 branch)
- **Vendor**: motorola/capri-vendor (android-12.1 branch)
- **Device Common**: motorola/capri-common (android-12.1 branch)
- **Hardware**: motorola/capri-hardware (android-12.1 branch)

## Installation

### Via Fastboot

```bash
# Boot into fastboot mode
adb reboot bootloader

# Flash recovery
fastboot flash recovery twrp-3.7.0_12-0-capri.img

# Boot to recovery
fastboot boot twrp-3.7.0_12-0-capri.img
```

### Via ADB

```bash
# Push recovery to device
adb push twrp-3.7.0_12-0-capri.img /sdcard/

# Flash via existing recovery
# Navigate to Install > Select Image > Choose twrp-3.7.0_12-0-capri.img > Flash to Recovery
```

## Known Issues

- None currently reported

## Changelog

### v3.7.0_12-0
- Initial TWRP 3.7.0 release
- Full A/B partition support
- FBE/FDE decryption support
- MTP and ADB support
- Multi-language support

## Credits

- **TWRP Team**: For the amazing recovery
- **Motorola**: For device specifications
- **Community**: For testing and feedback

## License

This project is licensed under the Apache License 2.0 - see the LICENSE file for details.

## Support

For support and bug reports, please create an issue on the GitHub repository.

---

**Note**: This is an unofficial TWRP build. Use at your own risk. The developers are not responsible for any damage to your device.
