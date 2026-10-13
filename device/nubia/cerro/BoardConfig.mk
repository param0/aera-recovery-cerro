DEVICE_PATH := device/nubia/cerro

# Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_BOARD_PLATFORM := pineapple
TARGET_BOOTLOADER_BOARD_NAME := pineapple
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := false
# real /vendor dir in the ramdisk (blobs live in recovery/root/vendor)
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
# no kernel build: recovery is ramdisk-only
TARGET_NO_KERNEL_OVERRIDE := true

# A/B + dynamic partitions
AB_OTA_UPDATER := true
BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_NO_RECOVERY := false

# Recovery image: ramdisk only (kernel comes from boot, like the stock layout)
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version 4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RAMDISK_USE_LZ4 := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USES_METADATA_PARTITION := true

# Version (any value; lets TWRP decrypt regardless of the running Android build)

# AVB: keep vbmeta untouched
BOARD_AVB_ENABLE := false

# Display / input
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1024
TW_NO_SCREEN_BLANK := true
TW_Y_OFFSET := 100
TW_H_OFFSET := -100
TW_EXTRA_LANGUAGES := true
TW_USE_TOOLBOX := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_EXCLUDE_APEX := true
TW_HAS_EDL_MODE := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := false

# Decryption: FBE v2 + wrapped keys + metadata encryption (matches the live fstab)
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true
TW_USE_FSCRYPT_POLICY := 2
TW_PREPARE_DATA_MEDIA_EARLY := true

# Libraries the recovery binary and the vendor HALs link against; without them
# /system/bin/recovery fails at load time (libsysutils) and the splash never goes away.
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsysutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libexpat.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libfmq.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcgrouprc.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libprocinfo.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtinyalsa.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.common-V2-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.common.fmq-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.health-V2-ndk.so
