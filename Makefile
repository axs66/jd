ARCHS = arm64
TARGET = iphone:clang:latest:14.0

THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 2222

THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

TWEAK_NAME = jdTweak
jdTweak_FILES = Tweak.xm
jdTweak_FRAMEWORKS = UIKit

# 指定过滤注入的目标
jdTweak_PRIVATE_FRAMEWORKS =

include $(THEOS_MAKE_PATH)/tweak.mk

# 安装额外资源文件
after-install::
	install.exec "mkdir -p /var/jb/Library/Application\ Support/jdTweak"
	install.exec "cp $(SRCROOT)/script.js /var/jb/Library/Application\ Support/jdTweak/script.js"
