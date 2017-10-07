-module(powrot_do_liceum).
-export([pole/1]).
-export([obj/1]).
-compile([export_all]).

pole({kwadrat,X,Y}) ->  X*Y;
pole({kolo,X}) -> 3.14*X*X;
pole({trapez,A,B,H}) -> (A+B)/2*H;
pole({trojkat,A,H}) -> A*H/2;
pole({kula,X}) -> 4*3.14*X*X;
pole({szescian,X}) -> 6*X*X;
pole({stozek,R,L}) -> 3.14*R(R+L).

obj({kula,X}) -> 4/3*3.14*X*X*X;
obj({szescian,X}) -> X*X*X;
obj({stozek,R,H}) -> 1/3*3.14*R*R*H.

polex2({A,B},{C,D}) -> [pole({A,B}), pole({C,D})].

polexx([]) -> [];
%polexx([{A,B}]) -> [pole({A,B})];
polexx([{A,B}|L]) -> [pole({A,B})| polexx(L)];
polexx([{A,B,C}|L) -> [pole({A,B,C}) | polexx(L)].


