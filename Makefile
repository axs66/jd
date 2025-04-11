# 编译目标配置
VERSION := 1.3.2
NODE_VERSION := 18.x
BUILD_DIR := build
BIN_NAME := jd-price

# 主构建目标
.PHONY: all
all: clean deps build

# 清理构建产物
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	rm -f *.deb
	rm -rf node_modules

# 安装依赖
.PHONY: deps
deps:
	@if ! which node >/dev/null; then \
		echo "Installing Node.js..."; \
		curl -fsSL https://deb.nodesource.com/setup_$(NODE_VERSION) | sudo -E bash -; \
		sudo apt-get install -y nodejs; \
	fi
	npm install --omit=dev

# 构建可执行文件
.PHONY: build
build: deps
	mkdir -p $(BUILD_DIR)/usr/bin
	cp jd_price.js $(BUILD_DIR)/$(BIN_NAME)
	chmod +x $(BUILD_DIR)/$(BIN_NAME)

# 生成DEB安装包
.PHONY: deb
deb: build
	mkdir -p $(BUILD_DIR)/DEBIAN
	cp debian/control $(BUILD_DIR)/DEBIAN/
	echo "#!/bin/bash" > $(BUILD_DIR)/DEBIAN/postinst
	echo "systemctl daemon-reload" >> $(BUILD_DIR)/DEBIAN/postinst
	chmod 755 $(BUILD_DIR)/DEBIAN/postinst
	dpkg-deb --build $(BUILD_DIR) jd-price_$(VERSION)_all.deb

# 安装到系统
.PHONY: install
install: deb
	sudo dpkg -i jd-price_$(VERSION)_all.deb

# 运行测试
.PHONY: test
test: deps
	node --test jd_price.test.js

# 启动调试模式
.PHONY: debug
debug: deps
	NODE_OPTIONS='--inspect-brk' node jd_price.js
