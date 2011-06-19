CC=clang
CFLAGS=-O0 -g -Wall -ftrapv -fcatch-undefined-behavior

# or, for gcc...
#CC=gcc
#CFLAGS=-O0 -g -Wall

LD=$(CC)
LDFLAGS=-g

test:	ringbuf-test
	./ringbuf-test

help:
	@echo "Targets:"
	@echo
	@echo "test  - build and run ringbuf unit tests."
	@echo "clean - remove all targets."
	@echo "help  - this message."

ringbuf-test: ringbuf-test.o ringbuf.o
	$(LD) -o ringbuf-test $(LDFLAGS) $^

ringbuf.o: ringbuf.c ringbuf.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f test-ringbuf *.o

.PHONY:	clean
