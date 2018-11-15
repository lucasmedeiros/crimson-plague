% stats(hp, maxHP, mp, maxMP)
stats(100, 100, 30, 30).

% attributes(str, int, dex, vit, luk, chr)
attributes(9, 9, 9, 9, 9, 9).

% sheet(Name, level, Role, XP, MaxXP)
sheet("Luan", 1, "Mago", 0, 100).

% Informações
getHP(HP) :- stats(HP, _, _, _).
getMaxHP(MHP) :- stats(_, MHP, _, _).
getMP(MP) :- stats(_, _, MP, _).
getMaxMP(MMP) :- stats(_, _, _, MMP).

getSTR(Str) :- attributes(Str, _, _, _, _, _).
getINT(Int) :- attributes(_, Int, _, _, _, _).
getDEX(Dex) :- attributes(_, _, Dex, _, _, _).
getVIT(Vit) :- attributes(_, _, _, Vit, _, _).
getLUK(Luk) :- attributes(_, _, _, _, Luk, _).
getCHR(Chr) :- attributes(_, _, _, _, _, Chr).

getStrModifier(Value) :- getSTR(K), Value is K // 4.
getIntModifier(Value) :- getINT(K), Value is K // 4.
getDexModifier(Value) :- getDEX(K), Value is K // 4.
getVitModifier(Value) :- getVIT(K), Value is K // 4.
getLukModifier(Value) :- getLUK(K), Value is K // 4.
getChrModifier(Value) :- getCHR(K), Value is K // 4.

getName(Name) :- sheet(Name, _, _, _, _).
getLevel(Level) :- sheet(_, Level, _, _, _).
getRole(Role) :- sheet(_, _, Role, _, _).
getXP(XP) :- sheet(_, _, _, XP, _).
getMaxXP(MXP) :- sheet(_, _, _, _, MXP).
