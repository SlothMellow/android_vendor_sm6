# Inherit common stuff
$(call inherit-product, vendor/sm6/config/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/sm6/overlay/tablet

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf
