THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 2222
ARCHS = arm64
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = jdTweak
jdTweak_FILES = 
jdTweak_FRAMEWORKS = UIKit

# 添加额外资源文件
after-install::
	install.exec "mkdir -p /var/jb/Library/Application\ Support/jdTweak"
	install.exec "cp $(SRCROOT)/script.js /var/jb/Library/Application\ Support/jdTweak/script.js"

include $(THEOS_MAKE_PATH)/package.mk
