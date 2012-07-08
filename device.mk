#
# Copyright (C) 2011 The CyanogenMod Project
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

# The GPS config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/gps.conf:system/etc/gps.conf
	
## (1) First, the most specific values, i.e. the aspects that are specific to CDMA
	
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/root/init.primoc.rc:root/init.primoc.rc \
    device/htc/primoc/prebuilt/root/init.msm7x30.usb.rc:root/init.msm7x30.usb.rc \
    device/htc/primoc/prebuilt/root/ueventd.primoc.rc:root/ueventd.primoc.rc
 
## (2) Also get non-open-source CDMA-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/primoc/primoc-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-CDMA-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

DEVICE_PACKAGE_OVERLAYS += device/htc/primoc/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml
	
# Misc
PRODUCT_PACKAGES += \
    lights.primoc \
    sensors.primoc \
    gps.primoc \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    audio.a2dp.default \
    libaudioutils \
    libtinyalsa \
    com.android.future.usb.accessory

# Video
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libmemalloc \
    libQcomUI \
    libtilerenderer \
    liboverlay


# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libOmxVdec

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    NoiseField \
    PhaseBeam \
    MagicSmoke \
    Galaxy4 \
    HoloSpiralWallpaper \
    librs_jni

# Temporary hack
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1 \
    persist.sys.root_access=3

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/usr/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    device/htc/primoc/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/primoc/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/primoc/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/primoc/prebuilt/usr/keylayout/primoc-keypad.kl:system/usr/keylayout/primoc-keypad.kl \
    device/htc/primoc/prebuilt/usr/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/htc/primoc/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Device specific firmware
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/firmware/BCM4330B1_002.001.003.0786.0822.hcd:system/vendor/firmware/BCM4330B1_002.001.003.0786.0822.hcd \
    device/htc/primoc/prebuilt/etc/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/primoc/prebuilt/etc/firmware/default_mfg.acdb:system/etc/firmware/default_mfg.acdb \
    device/htc/primoc/prebuilt/etc/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/primoc/prebuilt/etc/firmware/default_org_wb.acdb:system/etc/firmware/default_org_wb.acdb

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
	device/htc/primoc/prebuilt/etc/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
	device/htc/primoc/prebuilt/etc/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/primoc/prebuilt/etc/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/primoc/prebuilt/etc/AIC3254_REG_DualMic.txt:system/etc/AIC3254_REG_DualMic.txt \
    device/htc/primoc/prebuilt/etc/AIC3254_REG_DualMic_XB.csv:system/etc/AIC3254_REG_DualMic_XB.csv \
    device/htc/primoc/prebuilt/etc/AIC3254_REG_DualMic_XC.csv:system/etc/AIC3254_REG_DualMic_XC.csv \
    device/htc/primoc/prebuilt/etc/AudioBTID.csv:system/etc/AudioBTID.csv \
	device/htc/primoc/prebuilt/etc/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/primoc/prebuilt/etc/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt
	
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# primoc uses high-density artwork where available
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/htc/primoc/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml
	
TARGET_PREBUILT_KERNEL := device/htc/primoc/prebuilt/root/kernel

ifneq ($(TARGET_PREBUILT_KERNEL),)

# Local Kernel
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Kernel Modules
PRODUCT_COPY_FILES += $(shell \
    find device/htc/primoc/prebuilt/lib/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

endif

$(call inherit-product-if-exists, vendor/htc/primoc/primoc-vendor.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/primoc/prebuilt/root/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/init.d/100complete:system/etc/init.d/100complete
	
# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml
	
# Init post-boot script
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/primoc/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/primoc/media_htcaudio.mk)

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)