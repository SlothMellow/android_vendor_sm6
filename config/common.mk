
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \

# Extra Optional packages
PRODUCT_PACKAGES += \
    LatinIME \
    BluetoothExt \

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser
endif

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/sm6/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/sm6/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Versioning System
ANDROID_VERSION = 6.0
DU_VERSION = v1.0
ifndef SM6_BUILD_TYPE
    SM6_BUILD_TYPE := SLOTHY
    PLATFORM_VERSION_CODENAME := SLOTHY
endif

# Set all versions
SM6_VERSION := SM6_$(SM6_BUILD)_$(ANDROID_VERSION)_$(shell date -u +%Y%m%d-%H%M).$(SM6_VERSION)-$(SM6_BUILD_TYPE)
SM6_MOD_VERSION := SM6_$(SM6_BUILD)_$(ANDROID_VERSION)_$(shell date -u +%Y%m%d-%H%M).$(SM6_VERSION)-$(SM6_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.sm6.version=$(SM6_VERSION) \
    ro.mod.version=$(SM6_BUILD_TYPE)-v1.0 \
