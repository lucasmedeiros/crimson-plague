main:	main.o	util.o	criaPersonagem.o	personagem.o
	g++ -o main.o util.o criaPersonagem.o personagem.o

main.o:	main.cpp	main.h
	g++ -c main.cpp

util.o:	util.cpp	util.h
	g++ -c util.cpp

criaPersonagem.o:	personagem/criaPersonagem.cpp personagem/criaPersonagem.cpp
	g++ -c personagem/personagem.cpp

personagem.o:	personagem/personagem.cpp	personagem/personagem.h
	g++ -c personagem/personagem.cpp

clean:
	rm *.o
