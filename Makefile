export ARCHS = arm64 arm64e
export TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = jd
SwipeInputTweak_FILES = Tweak.x
SwipeInputTweak_FRAMEWORKS = UIKit
SwipeInputTweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
