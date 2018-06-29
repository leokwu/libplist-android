LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LIBCNARY_SOURCES := \
	libcnary/cnary.c \
	libcnary/iterator.c \
	libcnary/list.c \
	libcnary/node.c \
	libcnary/node_iterator.c \
	libcnary/node_list.c 

LIBPLIST_SOURCES := \
    Array.cpp \
    base64.c \
    Boolean.cpp \
    bplist.c \
    bytearray.c \
    Data.cpp \
    Date.cpp \
    Dictionary.cpp \
    hashtable.c \
    Integer.cpp \
    Key.cpp \
    Node.cpp \
    plist.c \
    ptrarray.c \
    Real.cpp \
    String.cpp \
    Structure.cpp \
    time64.c \
    Uid.cpp \
    xplist.c 

LOCAL_MODULE := plist

LOCAL_SRC_FILES := $(addprefix ../../, $(LIBCNARY_SOURCES)) \
                   $(addprefix ../../src/, $(LIBPLIST_SOURCES))

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../../src \
    $(LOCAL_PATH)/../../libcnary/ \
    $(LOCAL_PATH)/../../libcnary/include \
    $(LOCAL_PATH)/../../include

#ifeq ($(TARGET_ARCH), arm)
#    LOCAL_CFLAGS += -DARM
#else ifeq ($(TARGET_ARCH), mips)
#    LOCAL_CFLAGS += -DMIPS
#else 
#    LOCAL_CFLAGS += -DX86
#endif

LOCAL_CFLAGS += -g
LOCAL_LDFLAGS += -llog

include $(BUILD_STATIC_LIBRARY)
