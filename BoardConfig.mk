# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from common msm7x30
-include device/htc/msm7x30-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/htc/primoc/include

# inherit from the proprietary version
-include vendor/htc/primoc/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := primoc

#GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := primoc

BOARD_BOOTIMAGE_PARTITION_SIZE := 4194304
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 836763136
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1023409664
BOARD_FLASH_BLOCK_SIZE := 4096

# TARGET_SPECIFIC_HEADER_PATH := device/htc/primoc/include
TARGET_SPECIFIC_HEADER_PATH := device/htc/msm7x30-common/include

BOARD_UMS_LUNFILE := /sys/devices/platform/msm_otg/msm_hsusb/gadget/lun0/file

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=primoc
BOARD_KERNEL_BASE := 0x14300000
BOARD_KERNEL_PAGESIZE := 2048

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4330_b1
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcm4330_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcm4330_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/wifi/bcm4330_p2p.bin"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/wifi/bcm4330_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                        := 802_11_ABG

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_USES_MMCUTILS := false

persist.service.adb.enable=1
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

## TESTING
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_USES_OVERLAY := true
TARGET_QCOM_HDMI_OUT := true
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_GENLOCK := true
TARGET_FORCE_CPU_UPLOAD := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_QCOM_HARDWARE := true
TARGET_PROVIDES_LIBAUDIO := true
TARGET_PROVIDES_LIBLIGHTS := true