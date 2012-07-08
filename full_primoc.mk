
# Camera
PRODUCT_PACKAGES := \
    Camera

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from maguro device
$(call inherit-product, device/htc/primoc/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := cm_primoc
PRODUCT_DEVICE := primoc
PRODUCT_BRAND := HTC
PRODUCT_MODEL := One V