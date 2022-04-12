THEOS_DEVICE_IP=192.168.1.12
TARGET := iphone:clang:latest:13.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = batterybarprefs

batterybarprefs_FILES = BBPRootListController.m
batterybarprefs_FRAMEWORKS = UIKit
batterybarprefs_EXTRA_FRAMEWORKS += Cephei
batterybarprefs_PRIVATE_FRAMEWORKS = Preferences
batterybarprefs_INSTALL_PATH = /Library/PreferenceBundles
batterybarprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
