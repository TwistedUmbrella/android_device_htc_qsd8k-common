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

# inherit from common qsd8k Recovery
-include device/htc/qsd8k-recovery/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/htc/qsd8k-common/include

TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

# Wifi related defines
WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WLAN_DEVICE                := bcm4329
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcm4329/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"

# Hardware rendering
BOARD_EGL_CFG           := device/htc/supersonic/prebuilt/lib/egl/egl.cfg
USE_OPENGL_RENDERER     := true
TARGET_USES_GENLOCK     := true
# Unneccesary with new egl libs
#COMMON_GLOBAL_CFLAGS   += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12
# We only have 2 buffers so still neccesary to hack it.
COMMON_GLOBAL_CFLAGS    += -DMISSING_GRALLOC_BUFFERS #-DFORCE_EGL_CONFIG=0x9
# Unneccesary. Just a safety measure to make sure its all included
COMMON_GLOBAL_CFLAGS    += -DQCOM_HARDWARE
# Force refresh rate since fps calc is broke and reports 0
COMMON_GLOBAL_CFLAGS    += -DREFRESH_RATE=60
# qsd dont have overlay
TARGET_USE_OVERLAY      := false
# qsd dont have bypass
TARGET_HAVE_BYPASS      := false
# qsd dont support c2d
TARGET_USES_C2D_COMPOSITION := false

# Debuging egl
COMMON_GLOBAL_CFLAGS += -DEGL_TRACE #-DDEBUG_CALC_FPS

BOARD_USES_HTC_CAMERA := true
TARGET_USE_CAF_PARAMS := true
CAMERA_CONVERT_COLORS := true
COMMON_GLOBAL_CFLAGS += -DBYPASS_OFFSET

COMMON_GLOBAL_CFLAGS += -DMISSING_CAM_EXTERNAL_IMAGE
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_PIXEL_FORMAT_YV12

TARGET_FORCE_CPU_UPLOAD  := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LEGACY := true

BOARD_VENDOR_USE_AKMD := akm8973

BOARD_USE_OPENSSL_ENGINE := true

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
