SKYNET_ROOT ?= ../skynet
include $(SKYNET_ROOT)/platform.mk

PLAT ?= none

TARGET = ./yyjson.so

YYJSON_INC ?= ../yyjson/
YYJSON_SRC ?= ./yyjson/

CXX=g++

ifeq ($(PLAT), macosx)
	CXXFLAGS = -g -O2 -pedantic -bundle -undefined dynamic_lookup -std=c++17
else
ifeq ($(PLAT), linux)
	CXXFLAGS = -g -O2 -shared -fPIC -std=c++17
endif
endif

LUA_LIB ?= $(SKYNET_ROOT)/3rd/lua/
LUA_INC ?= $(SKYNET_ROOT)/3rd/lua/

SRC = .

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(foreach dir, $(SRC), $(wildcard $(dir)/*.cpp)) \
			$(foreach dir, $(YYJSON_SRC), $(wildcard $(dir)/*.c))
			
	$(CXX) $(CXXFLAGS) -o $@ $^ -I$(YYJSON_INC) -I$(LUA_INC)


clean:
	rm -f *.o $(TARGET) && \
	rm -rf *.dSYM