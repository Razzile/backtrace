THEOS_DEVICE_IP = 192.168.0.5
GO_EASY_ON_ME = 1
target iphone:latest
include theos/makefiles/common.mk

TOOL_NAME = backtrace
backtrace_FILES = main.mm
backtrace_CFLAGS = -O0 -mno-thumb
include $(THEOS_MAKE_PATH)/tool.mk
