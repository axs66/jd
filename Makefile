TARGET = iphone:clang:latest:10.0
ARCHS = arm64
PACKAGE_VERSION = 1.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = jdTweak
jdTweak_FILES = Tweak.xm
jdTweak_STAGE_DIR = $(THEOS_STAGING_DIR)

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
