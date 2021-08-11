CC = gcc
CFLAGS_debug = -g -Wall -Wextra -Werror -Wshadow -no-pie
CFLAGS_RELEASE = -O3 -Wall -Wextra -Werror -Wshadow -no-pie
CFLAGS_TEST = -O0 -Wall -Wextra -Werror -Wshadow -no-pie -fprofile-arcs -ftest-coverage

AC = nasm
AFLAGS = -Worphan-labels -f elf64

PNAME   ?= name

FILES = \
	$(wildcard src/*.c)

FILES_ASM = \
	$(wildcard src/*.asm)

FILES_TEST = \
	$(FILES) \
	$(wildcard tests/*.c)


ASM_OBJS = $(addsuffix .o, $(basename $(FILES_ASM)))


build: build_asm
	$(CC) $(CFLAGS_RELEASE) $(ASM_OBJS) $(FILES) -o $(PNAME)_release.out

build_asm:
	for asm_file in $(basename $(FILES_ASM)) ; do \
		$(AC) $(AFLAGS) $$asm_file.asm -l $$asm_file.lst -o $$asm_file.o; \
	done

debug: build_asm
	$(CC) $(CFLAGS_debug) $(ASM_OBJS) $(FILES) -o $(PNAME)_debug.out

ddd: debug
	ddd $(PNAME)_debug.out &

run: build
	./$(PNAME)_release.out

profile: debug
	valgrind --tool=callgrind ./$(PNAME)_debug.out

memcheck: debug
	valgrind --leak-check=full ./$(PNAME)_debug.out

cache: build
	valgrind --tool=cachegrind ./$(PNAME)_release.out
	#cg_annotate cachegrind.out.{PID}

test: build_asm
	$(CC) $(CFLAGS_TEST) -DTEST $(ASM_OBJS) $(FILES_TEST) -o test.out
	./test.out
	gcovr -e "tests/*" --xml-pretty --exclude-unreachable-branches --print-summary -o coverage.xml

coverage_html: build_asm
	$(CC) $(CFLAGS_TEST) -DTEST $(ASM_OBJS) $(FILES_TEST) -o test.out
	./test.out
	gcovr -e "tests/*" --html --html-details --print-summary -o coverage.html

clean:
	rm -f */*.o
	rm -f */*.lst
	rm -f *.out
	rm -f *.out.*
	rm -f *.html
	rm -f *.xml
	rm -f *.gcda
	rm -f *.gcno
	