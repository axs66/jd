# 定义 Theos 安装路径
THEOS=/opt/theos
SDKVERSION=12.2
ARCHS=arm64
TARGET=iphone:clang:latest:7.0

# 引入 Theos 标准 makefile
include $(THEOS)/makefiles/common.mk

# 插件名称
TWEAK_NAME = jdTweak

# 你的插件 JavaScript 脚本
jdTweak_FILES = script.js

# 插件安装路径
jdTweak_INSTALL_PATH = /Library/Application Support/jdTweak

# 引入 tweak.mk，确保路径正确
include $(THEOS_MAKE_PATH)/tweak.mk
