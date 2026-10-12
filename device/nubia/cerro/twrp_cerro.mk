$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)

PRODUCT_DEVICE := cerro
PRODUCT_NAME := twrp_cerro
PRODUCT_BRAND := nubia
PRODUCT_MODEL := NX721J
PRODUCT_MANUFACTURER := nubia
PRODUCT_SHIPPING_API_LEVEL := 34

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/etc/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab

PRODUCT_PROPERTY_OVERRIDES += ro.bootimage.build.date.utc=0

