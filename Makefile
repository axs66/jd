THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 22

export THEOS=/opt/theos
export SDKVERSION=12.2
export ARCHS = arm64
export TARGET = iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = jdTweak
jdTweak_FILES = Tweak.xm
jdTweak_FRAMEWORKS = UIKit Foundation

# 指定文件路径
jdTweak_INSTALL_PATH = /Library/Application Support/jdTweak
jdTweak_FILES = script.js  # 将 script.js 文件添加到插件中

include $(THEOS_MAKE_PATH)/tweak.mk
