:- initialization(main).

classe("1", "guerreiro").
classe("2", "mago").
classe("3", "ladino").

escolheClasse() :-
    writeln("0) Informações"),
    writeln("1) Guerreiro"),
    writeln("2) Mago"),
    writeln("3) Ladino"),
    writeln("Digite sua classe:"),
    read_line_to_string(user_input, Opcao),
    avaliaOpcaoClasse(Opcao, Output),
    writeln(Output).

avaliaOpcaoClasse(Value, Output) :-
    classe(Value, Output).
avaliaOpcaoClasse(Value, Output) :-
    writeln("Opção inválida!"),
    escolheClasse().

main:-
    escolheClasse().