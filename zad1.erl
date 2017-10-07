-module(zad1).
-compile([export_all]).

len([]) -> 0;
len([_|L]) -> 1+len(L).

amin([H|T]) -> amin(H, T).
amin(M, [H|T]) when M < H -> amin(M, T);
amin(M, [H|T]) when M >= H -> amin(H, T);
amin(M, []) ->  M.

amax([H|T]) -> amax(H, T).
amax(M, [H|T]) when M > H -> amax(M, T);
amax(M, [H|T]) when M =< H -> amax(H, T);
amax(M, []) -> M.

tmin_max([H|T]) -> {amin([H|T]), amax([H|T])}.
lmin_max([H|T]) -> [amin([H|T]), amax([H|T])].

mklist(1) -> [1];
mklist(N) -> [N|mklist(N-1)].
