CC = gcc
CFLAGS = -std=c11 -Wall -I/usr/include/lua5.4
LDFLAGS = /usr/lib/x86_64-linux-gnu/liblua5.4.a -static -lm -ldl
OBJDIR = obj
SRCDIR = src
BINDIR = bin
TARGET = $(BINDIR)/pkg

all: dirs $(TARGET)

dirs:
	mkdir -p $(OBJDIR) $(BINDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJDIR)/main.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(OBJDIR)/*.o $(TARGET)

.PHONY: all clean dirs



