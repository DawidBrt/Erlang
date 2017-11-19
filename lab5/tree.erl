-module(tree).
-compile([export_all]).


insert(X, {Value, Left, Right}) ->
	if
		X>Value ->
			{Value, Left, insert(X, Right)};
		X<Value ->
			{Value, insert(X, Left), Right};
		true -> {Value, Left, Right}
	end;
insert(X, nil) -> {X, nil, nil}.


makeRandomTree(N) ->
	Tmp = rand:uniform(1000),
	Tree = {Tmp, nil, nil},
	randomTree(N-1,Tree).
	
randomTree(0, Tree) ->
	Tree;	
randomTree(N,Tree) ->
	Tmp	= rand:uniform(1000),
	NextTree = insert(Tmp,Tree),
	randomTree(N-1,NextTree).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fromList([]) -> nil;
fromList(L) ->	fromListToTree(L,nil).

fromListToTree([],Tree) -> Tree;
fromListToTree([L|H], Tree) ->
	Tree2 = insert(L,Tree),
	fromListToTree(H,Tree2).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treeToList(Tree, Type) -> 
	case Type of
		"pre" -> listPRE(Tree);
		"post" ->	listPOST(Tree);
		"in" ->	listIN(Tree)
	end.
		
%% pre order
listPRE(nil) -> [];
listPRE({Value, Left, Right}) ->
	lists:append([[Value],listPRE(Left),listPRE(Right)]).

%% in order
listIN(nil) -> [];
listIN({Value, Left, Right}) ->
	lists:append([listIN(Left),[Value],listIN(Right)]).

%% post order
listPOST(nil) -> [];
listPOST({Value, Left, Right}) ->
	lists:append([listPOST(Left),listPOST(Right),[Value]]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

search(nil,_V) -> false;
search({Value,Left,Right}, V) ->
	if
		Value == V -> true;
		Value < V -> search(Right,V);
		true -> search(Left, V)
	end.

searchC(Tree,V) -> catch searchT(Tree,V).
searchT(nil,_V) -> throw(false);
searchT({Value, Left, Right}, V) ->
	if
		Value == V -> throw(true);
		Value < V -> search(Right,V);
		true -> search(Left, V)
	end.

	


















