TARGET = iphone:clang:latest:14.0
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

PACKAGE_NAME = jdTweak

INSTALL_TARGET_PROCESSES = none

# 这里没有 TWEAK_NAME

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "mkdir -p /var/jb/Library/Application\ Support/jdTweak"
	install.exec "cp $(SRCROOT)/script.js /var/jb/Library/Application\ Support/jdTweak/script.js"
