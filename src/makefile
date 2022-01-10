all: bin/init

CC=clang-13

obj/%.i: %.c
	mkdir -p $(@D)
	$(CC) -std=c11 -nostdinc --sysroot $(ROOT) -isystem $(ROOT)/include -E $< -o $@

obj/%.o: obj/%.i
	mkdir -p $(@D)
	$(CC) -std=c11 -nostdinc -nodefaultlibs --sysroot $(ROOT) -c $< -o $@

CFILES = $(wildcard *.c)
OFILES = $(CFILES:%.c=obj/%.o)

bin/init: $(OFILES)
	mkdir -p $(@D)
	$(CC) $(ROOT)/lib/crt1.o $(OFILES) -nostdlib -static --sysroot $(ROOT) -L $(ROOT)/lib -lc -o bin/init

.PHONY: clean install

clean:
	rm -rf obj bin > /dev/null 2> /dev/null || true

install: bin/init
	cp bin/init $(PREFIX)/init
