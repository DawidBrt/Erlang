-module(powrot_do_liceum).
-export([pole/1, obj/1, lista_pol/1]).
-export([len/1, amin/1, amax/1, tmin_max/1, lmin_max/1, mklist/1, mklist/2]).
-export([temp_conv/2]).
%%-compile([export_all]).

pole({kwadrat,X,Y}) ->  X*Y;
pole({kolo,X}) -> 3.14*X*X;
pole({trapez,A,B,H}) -> (A+B)/2*H;
pole({trojkat,A,H}) -> A*H/2;
pole({kula,X}) -> 4*3.14*X*X;
pole({szescian,X}) -> 6*X*X;
pole({stozek,R,L}) -> 3.14*R(R+L).

lista_pol([]) -> [];
lista_pol([A|L]) -> [pole(A)| lista_pol(L)].

obj({kula,X}) -> 4/3*3.14*X*X*X;
obj({szescian,X}) -> X*X*X;
obj({stozek,R,H}) -> 1/3*3.14*R*R*H.

%%%%%%%%%%%% LISTY %%%%%%%%%%%%%%%%%

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

mklist(0) -> [];
mklist(N) -> [N|mklist(N-1)].

mklist(0,_) -> [];
mklist(N,X) -> [X|mklist(N-1,X)].

%%%%%%%%% Temp converter %%%%%%%%%%%%%%%%%%
%%%  KFC  %%%
% k - Kelvin 
% f - Fahrenheit
% c - Celsius
temp_conv({k, T}, k) -> {k, T};
temp_conv({k, T}, f) -> {f, (T-273.15)*9/5+32};
temp_conv({k, T}, c) -> {c, T-273.15};
temp_conv({f, T}, k) -> {k, (T-32)*5/9+273.15};
temp_conv({f, T}, f) -> {f, T};
temp_conv({f, T}, c) -> {c, (T-32)*5/9};
temp_conv({c, T}, k) -> {k, T+273.15};
temp_conv({c, T}, f) -> {f, (T*9/5)+32};
temp_conv({c, T}, c) -> {c, T}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


