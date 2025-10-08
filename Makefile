# ---- config ----
CC ?= cc
CFLAGS ?= -std=c17 -Wall -Wextra -Werror -O2 -Iinclude
LDFLAGS ?=
BUILD := build

APP := $(BUILD)/app
TEST := $(BUILD)/test

APP_SRCS := src/main.c src/hello.c
TEST_SRCS := tests/test_main.c src/hello.c

APP_OBJS := $(APP_SRCS:%.c=$(BUILD)/%.o)
TEST_OBJS := $(TEST_SRCS:%.c=$(BUILD)/%.o)

# ---- rules ----
.PHONY: all clean test

all: $(APP)

$(BUILD)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(APP): $(APP_OBJS)
	$(CC) $(APP_OBJS) $(LDFLAGS) -o $@

$(TEST): $(TEST_OBJS)
	$(CC) $(TEST_OBJS) $(LDFLAGS) -o $@

test: $(TEST)
	$(TEST)

clean:
	rm -rf $(BUILD)

