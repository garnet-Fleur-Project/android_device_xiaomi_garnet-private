LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES += \
    Jelly \
    Stk \
    Glimpse \
    Gallery2 \
    Music \
    Recorder \
    Etar \
    Contacts \
    DeskClock \
    Aperture \
    MatLog \
    Browser2 \
    Dialer \
    messaging \
    Twelve \
    GameSpace \
    ExactCalculator
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
