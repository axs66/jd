THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 2222
ARCHS = arm64
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

TWEAK_NAME = jdTweak
jdTweak_FILES = Tweak.xm
jdTweak_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

# 安装额外的资源文件
after-install::
	install.exec "mkdir -p /Library/Application\ Support/jdTweak"
	install.exec "cp $(SRCROOT)/script.js /Library/Application\ Support/jdTweak/script.js"
