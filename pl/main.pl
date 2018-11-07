%! Define main como a regra principal do programa
:- initialization(main).

%! Fatos
classe("1", "guerreiro").
classe("2", "mago").
classe("3", "ladino").

			
main:-

writeln("1) Guerreiro"),
writeln("2) Mago"),
writeln("3) Ladino"),
writeln("Digite sua classe:"),
read_line_to_string(user_input, Opcao),
classe(Opcao, Classe),
writeln(Classe).