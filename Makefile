# 设置 Theos 安装路径，确保 THEOS 指向正确的安装路径
THEOS = /path/to/your/theos  # 例如：/home/runner/theos

# 插件名称
TWEAK_NAME = jdTweak

# 目标平台架构
ARCHS = arm64

# 设置安装路径，插件在设备上的安装路径
jdTweak_INSTALL_PATH = /Library/Application Support/jdTweak

# 设置目标设备
TARGET = iphone:clang:latest:7.0

# 指定插件文件
jdTweak_FILES = script.js

# 包的版本号，可以根据需要修改
PACKAGE_VERSION = 1.0

# 包的安装路径
FINAL_PACKAGE_PATH = output/jdTweak_$(PACKAGE_VERSION)_iphoneos-arm.deb

# 引入 Theos 的 makefiles，确保路径正确
include $(THEOS)/makefiles/common.mk
include $(THEOS)/makefiles/tweak.mk

# 目标定义
before-package::
	@echo "开始构建 jdTweak 插件..."

package::
	@echo "开始打包 jdTweak 插件..."
	@$(MAKE) package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless
