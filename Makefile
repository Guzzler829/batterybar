THEOS_DEVICE_IP = 192.168.1.21

THEOS_MAKE_PATH=/home/guzzler/theos/makefiles/

ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = batterybar

batterybar_FILES = Tweak.x
batterybar_CFLAGS = -fobjc-arc
batterybar_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += batterybarprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
