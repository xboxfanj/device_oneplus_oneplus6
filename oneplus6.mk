#
# Copyright 2019 The Paranoid Android Project
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

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/oneplus/sdm845-common/sdm845-common-vendor.mk)

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vbmeta

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@5.0 \
    android.hardware.audio.common@5.0 \
    android.hardware.audio.common@5.0-util \
    android.hardware.audio.effect@5.0 \
    libaudio-resampler

# Bluetooth
PRODUCT_PACKAGES += \
    libbluetooth_qti \
    libbt-logClient.so

# Boot control
PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Common init scripts
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.post_boot.sh \
    ueventd.qcom.rc

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData.system

# Fingerprint
PRODUCT_COPY_FILES += \
    vendor/pa/config/permissions/vendor.pa.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.pa.biometrics.fingerprint.inscreen.xml

PRODUCT_PACKAGES += \
    pa.biometrics.fingerprint.inscreen@1.0-service.oneplus_fajita

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/gf_input.idc:system/usr/idc/gf_input.idc \
    $(LOCAL_PATH)/keylayout/gf_input.kl:system/usr/keylayout/gf_input.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.oneplus_sdm845

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0 \
    android.hardware.nfc@1.1 \
    android.hardware.nfc@1.2 \
    android.hardware.secure_element@1.0 \
    com.android.nfc_extras \
    Tag \
    vendor.nxp.nxpese@1.0 \
    vendor.nxp.nxpnfc@1.0

# NN
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-rtti

# Overlays
PRODUCT_PACKAGES += \
    OnePlus6FrameworksRes \
    OnePlus6SystemUI \
    OnePlus6TFrameworksRes \
    OnePlus6TSystemUI

# Power
PRODUCT_PACKAGES += \
    power.qcom

# QCOM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

# tri-state-key
PRODUCT_PACKAGES += \
    TriStateHandler \
    tri-state-key_daemon

# QTI common
-include vendor/qcom/common/av/qti-av.mk
-include vendor/qcom/common/bt/qti-bt.mk
-include vendor/qcom/common/perf/qti-perf.mk

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm845 \
    libcutils \
    librecovery_updater_msm \
    libz \

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# VNDK-SP
PRODUCT_PACKAGES += \
    vndk-sp

# WFD
PRODUCT_PACKAGES += \
    libnl \
    libwfdaac

PRODUCT_BOOT_JARS += \
    WfdCommon

PRODUCT_TARGET_VNDK_VERSION := 29

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:system/product/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/msm_irqbalance.conf \
    $(LOCAL_PATH)/configs/perfconfigstore.xml:system/product/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/perf/perfconfigstore.xml \
    $(LOCAL_PATH)/configs/android.hardware.graphics.composer@2.3-service.rc:system/product/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init/android.hardware.graphics.composer@2.3-service.rc

# RRO Overlays
PRODUCT_PACKAGES += \
    SDM845CommonBluetoothRes \
    SDM845CommonCarrierConfigRes \
    SDM845CommonFrameworkRes \
    SDM845CommonFrameworkPARes \
    SDM845CommonSystemUIPARes \
    SDM845CommonTelephonyRes

# ParanoidDoze
PRODUCT_PACKAGES += ParanoidDoze
