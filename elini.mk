$(call inherit-product, $(SRC_TARGET_DIR)/product/small_base.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/elini/overlay
PRODUCT_LOCALES += ja_JP
 
$(call inherit-product-if-exists, vendor/lge/elini/elini-vendor.mk)

PRODUCT_PACKAGES += \
    librs_jni \
    libaudio \
    libcamera \
    lights.elini \
    copybit.elini \
    libmm-omxcore \
    libOmxCore \
    libOmxVidEnc \
    com.android.future.usb.accessory \
    LiveWallpapers \
    LiveWallpapersPicker \
    OpenWnn \
    VoiceDialer \
    libWnnEngDic \
    libWnnJpnDic \
    libwnndict \

#    gralloc.elini \

DISABLE_DEXPREOPT := false

# Motoya Font
PRODUCT_COPY_FILES += \
    frameworks/base/data/fonts/MTLc3m.ttf:system/fonts/MTLc3m.ttf \

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml \

# Qwerty
PRODUCT_COPY_FILES += \
    device/lge/elini/files/elini_keypad.kl:system/usr/keylayout/elini_keypad.kl \
    device/lge/elini/files/elini_keypad.kcm.bin:system/usr/keychars/elini_keypad.kcm.bin \

# Board-specific init
PRODUCT_COPY_FILES += \
    device/lge/elini/files/init.elini.rc:root/init.elini.rc \
    device/lge/elini/files/ueventd.elini.rc:root/ueventd.elini.rc \
    device/lge/elini/files/init.lge.hidden_reset.sh:root/init.lge.hidden_reset.sh \
    device/lge/elini/files/init.qcom.post_boot.sh:root/init.qcom.post_boot.sh \
    device/lge/elini/files/init.qcom.rc:root/init.qcom.rc \
    device/lge/elini/files/initlogo.rle:root/initlogo.rle \

#GPS
#FIXME: remove blob, we should build some how
PRODUCT_COPY_FILES += \
    device/lge/elini/prebuilt/gps.default.so:system/lib/hw/gps.default.so \

#BT init
#FIXME: BT init workaround
PRODUCT_COPY_FILES += \
    device/lge/elini/files/etc/init.d/30initbt:system/etc/init.d/30initbt \

# VPN
PRODUCT_COPY_FILES += \
    device/lge/elini/prebuilt/tun.ko:system/lib/modules/tun.ko \

# Camera (from thunderg)
PRODUCT_COPY_FILES += \
    device/lge/elini/prebuilt/liboemcamera.so:system/lib/liboemcamera.so \

# Wifi
PRODUCT_COPY_FILES += \
    device/lge/elini/prebuilt/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/elini/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/lge/elini/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \

# SD Card
PRODUCT_COPY_FILES += \
    device/lge/elini/files/etc/vold.fstab:system/etc/vold.fstab \

# Audio
PRODUCT_COPY_FILES += \
    device/lge/elini/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/lge/elini/files/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/lge/elini/files/etc/media_profiles.xml:system/etc/media_profiles.xml \

# Device permissions
PRODUCT_COPY_FILES += \
    device/lge/elini/files/etc/permissions/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    device/lge/elini/files/etc/permissions/android.hardware.location.network.xml:system/etc/permissions/android.hardware.location.network.xml \
    device/lge/elini/files/etc/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    device/lge/elini/files/etc/permissions/android.hardware.telephony.xml:system/etc/permissions/android.hardware.telephony.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/elini/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_LOCALES += mdpi

$(call inherit-product, build/target/product/full.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := lge_elini
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := elini
PRODUCT_MODEL := L-04C
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=elini
