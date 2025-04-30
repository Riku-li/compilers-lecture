LDFLAGS = -L/opt/homebrew/opt/flex/lib
CPPFLAGS = -I/opt/homebrew/opt/flex/include

LEX_SRC = lex_analyzer.l
EXEC = lex_scan
GENERATOR = ../03/code_generator.py

build:
	flex $(LEX_SRC)
	gcc $(CPPFLAGS) $(LDFLAGS) lex.yy.c -o $(EXEC) -lfl

example:
	python3 $(GENERATOR) > example.ac

run: build example
	./$(EXEC) example.ac

stress: build
	python3 $(GENERATOR) --stress > random_code.ac
	./$(EXEC) random_code.ac

clean:
	rm -f lex.yy.c $(EXEC) example.ac random_code.ac
