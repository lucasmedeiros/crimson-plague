#declarando a variavel de compilacao
CC = g++

#declarando a variavel para CFLAGS
CFLAGS = -std=c++14

#variavel para o 'find' para achar todos os arquivos '.cpp'
CPPS = $(shell find -name '*.cpp')

#expressao para pegar todos os arquivos '.o'
OBJS := $(addsuffix .o, $(basename $(CPPS)))

#variavel para todos os arquivos '.h'
HDRS = *.h

#'main' do makefile
all:	compile	clean

#compilando o codigo (gerando o arquivo executavel crimsonPlague)
compile:	$(OBJS)
	$(CC) -o crimsonPlague $^ $(CFLAGS)

#gerando o arquivo '.o' para cada arquivo '.cpp' existente no projeto
$@/%.o:	%.cpp	$(HDRS)
	$(CC) -c -o $< $(CFLAGS)

#limpando todos os arquivos '.o' gerados
clean:	$(OBJS)
	rm -rf $^
