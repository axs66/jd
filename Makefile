PACKAGE_NAME = jdTweak
VERSION = 1.0
ARCH = iphoneos-arm
OUTPUT_DIR = output
DEB_NAME = $(PACKAGE_NAME)_$(VERSION)_$(ARCH).deb

all: package

package:
	mkdir -p $(OUTPUT_DIR)
	dpkg-deb -b . $(OUTPUT_DIR)/$(DEB_NAME)

clean:
	rm -rf $(OUTPUT_DIR)
