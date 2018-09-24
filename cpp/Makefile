main:	main.o	util.o	criaPersonagem.o	personagem.o	batalha.o
	g++ -o crimsonPlague main.o util.o criaPersonagem.o personagem.o batalha.o

main.o:	main.cpp	main.h
	g++ -c main.cpp

util.o:	util.cpp	util.h
	g++ -c util.cpp

criaPersonagem.o:	personagem/criaPersonagem.cpp	personagem/criaPersonagem.h
	g++ -c personagem/criaPersonagem.cpp

personagem.o:	personagem/personagem.cpp	personagem/personagem.h
	g++ -c personagem/personagem.cpp

batalha.o:	batalhas/batalha.cpp	batalhas/batalha.h
	g++ -c batalhas/batalha.cpp

clean:
	rm *.o
