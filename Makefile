# Makefile for Assignment 1
CC=gcc
CFLAGS=-O2 -Wall -Werror -Wno-unused-result -std=c99
LDFLAGS=-lm
SEARCHER_SOURCE=smallest_triangle.c
SEARCHER_BINARY=smallest_triangle

PYTHON=python3
GENERATOR_SOURCE=gen_points.py


# non dependency commands for this Makefile
.PHONY: build
.PHONY: generator
.PHONY: searcher
.PHONY: sample
.PHONY: test
.PHONY: clean

# default rule
build: generator searcher test
	# commands that are needed to build both your program (no execution)

generator: 
	# commands to build the Generator program (no execution)
	# use only a single file: GenPoints.java or gen_points.py
	${PYTHON} -m py_compile ${GENERATOR_SOURCE}

searcher: ${OBJFILES}
	# commands to build the Searcher program
	# use only a single file: smallest_triangle.c
	${CC} ${CFLAGS} ${LDFLAGS} ${SEARCHER_SOURCE} -o ${SEARCHER_BINARY}

sample:
	# execute Generator program with arguments -N=20 -mindist=5 rseed=3 and pipe the result to Searcher program
	${PYTHON} ${GENERATOR_SOURCE} -N=20 -mindist=2 -rseed=3 | ./${SEARCHER_BINARY}

test:
	# execute all tests
	#  Generator self test - with argsets
	#  Searcher self test
	#  Generator and Searcher end to end tests - with argsets
	# using a test.sh script (any supported scripting language on Ed) is encouraged
	chmod u+x test.sh
	./test.sh 

clean:
	# delete any unwanted build or editing files (not your source files!)
	rm -f ${SEARCHER_BINARY}

