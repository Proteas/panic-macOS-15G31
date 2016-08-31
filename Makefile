export DEVELOPER_DIR := $(shell xcode-select --print-path)

# OS X
SDK_OSX 		= $(shell xcodebuild -version -sdk macosx Path)
MIN_VER_OSX		= -mmacosx-version-min=10.10

ARCH_OSX		= -arch x86_64
CC_OSX			= $(shell xcrun --sdk macosx --find clang)

SDK_SETTINGS_OSX = -isysroot $(SDK_OSX) -I$(SDK_OSX)/usr/include -I$(SDK_OSX)/usr/local/include

COMPILE_OSX_BIN	= $(CC_OSX) $(ARCH_OSX) $(MIN_VER_OSX) $(SDK_SETTINGS_OSX)
# ================================================================================================= #

MAIN_FILE	= unserializer-vul-poc.m
FRMKFLAGS	= -framework Foundation -framework IOKit

all:
	$(COMPILE_OSX_BIN) $(FRMKFLAGS) $(MAIN_FILE) -o "poc"
	
clean:
	rm -rf poc *.dSYM
	