# Copyright (C) 2012 The CyanogenMod Project
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


# Inherit msm7x30 Vendor Files
$(call inherit-product-if-exists, vendor/twisted/twisted-vendor.mk)
$(call inherit-product-if-exists, vendor/twisted/google-vendor.mk)

# Inherit Language Files
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# usb profiles
PRODUCT_COPY_FILES += \
    device/htc/qsd8k-common/prebuilt/init.qsd8k.usb.rc:root/init.qsd8k.usb.rc

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/qsd8k-common/prebuilt/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

#qsd8k common adreno libs
PRODUCT_COPY_FILES += \
    device/htc/qsd8k-common/prebuilt/etc/firmware/leia_pfp_470.fw:/system/etc/firmware/leia_pfp_470.fw \
    device/htc/qsd8k-common/prebuilt/etc/firmware/leia_pm4_470.fw:/system/etc/firmware/leia_pm4_470.fw \
    device/htc/qsd8k-common/prebuilt/etc/firmware/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \
    device/htc/qsd8k-common/prebuilt/etc/firmware/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw \
    device/htc/qsd8k-common/prebuilt/lib/egl/egl.cfg:/system/lib/egl/egl.cfg \
    device/htc/qsd8k-common/prebuilt/lib/egl/eglsubAndroid.so:/system/lib/egl/eglsubAndroid.so \
    device/htc/qsd8k-common/prebuilt/lib/egl/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/htc/qsd8k-common/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/qsd8k-common/prebuilt/lib/egl/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/htc/qsd8k-common/prebuilt/lib/egl/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
    device/htc/qsd8k-common/prebuilt/lib/libgsl.so:/system/lib/libgsl.so \
    device/htc/qsd8k-common/prebuilt/lib/libsc-a2xx.so:/system/lib/libsc-a2xx.so

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/qsd8k-common/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

DEVICE_PACKAGE_OVERLAYS += device/htc/qsd8k-common/prebuilt/overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cm/overlay/dictionaries

# GPU
PRODUCT_PACKAGES += \
    copybit.qsd8k \
    gralloc.qsd8k \
    hwcomposer.default \
    hwcomposer.qsd8k \
    libgenlock \
    libmemalloc \
    libtilerenderer \
    libQcomUI

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k

# Camera
PRODUCT_PACKAGES += \
    camera.qsd8k \
    Camera

# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVidEnc \
    libOmxVdec \
    libstagefrighthw

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    Basic \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    PhaseBeam \
    LiveWallpapers \
    VisualizationWallpapers

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
