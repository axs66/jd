THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 2222
ARCHS = arm64
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = jdTweak
JD_FILE = script.js  # QX 插件的 JavaScript 文件

# 定义 QX 插件的目标路径
PACKAGE_PATH = /var/jb/Library/Application\ Support/jdTweak

# 确保安装所需的资源文件
after-install::
    install.exec "mkdir -p $(PACKAGE_PATH)"
    install.exec "cp $(SRCROOT)/$(JD_FILE) $(PACKAGE_PATH)/$(JD_FILE)"

# 不依赖 Tweak.xm，因为我们只关心资源文件
include $(THEOS_MAKE_PATH)/aggregate.mk
