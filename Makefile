ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:latest
THEOS_DEVICE_IP = 192.168.1.100
THEOS_DEVICE_PORT = 22
THEOS = ~/theos

include $(THEOS)/makefiles/common.mk
include $(THEOS)/makefiles/tweak.mk
