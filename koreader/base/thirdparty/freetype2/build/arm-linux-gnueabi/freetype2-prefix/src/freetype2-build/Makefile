TOP_DIR        := /root/koreader/base/thirdparty/freetype2/build/arm-linux-gnueabi/freetype2-prefix/src/freetype2
OBJ_DIR        := /root/koreader/base/thirdparty/freetype2/build/arm-linux-gnueabi/freetype2-prefix/src/freetype2-build
OBJ_BUILD      := $(OBJ_DIR)
DOC_DIR        := $(OBJ_DIR)/reference
FT_LIBTOOL_DIR := $(OBJ_DIR)
ifndef FT2DEMOS
  include $(TOP_DIR)/Makefile
else
  TOP_DIR_2 := $(TOP_DIR)/../ft2demos
  PROJECT   := freetype
  CONFIG_MK := $(OBJ_DIR)/config.mk
  include $(TOP_DIR_2)/Makefile
endif
