-module(lab2).
-compile([export_all]).

map_append(Key, Value, Map) -> maps:put(Key, Value, Map).

map_update(Key, Value, Map) -> maps:update(Key, Value, Map).

map_display(Map) -> maps:to_list(Map).

map_get(Key, Map) ->
	Klow = string:to_lower(Key),
	maps:get(Klow, Map).

%%%%%%%%%%%%%%%

listToMap([],Map) -> Map;
listToMap([H|T],Map) ->
	Hlow = string:to_lower(H),
	case maps:is_key(Hlow,Map) of
		true ->
			Value = maps:get(Hlow, Map),
			Map1 = maps:update(Hlow, Value+1, Map);
		false ->
			Map1 = maps:put(Hlow, 1, Map)
	end,
	listToMap(T,Map1).


%%%%%%%%%%% Basic one %%%%%%%%%%%%%%%%
readWholeFile(FileName) ->
	{ok, Binary} = file:read_file(FileName),
	Lines = string:tokens(erlang:binary_to_list(Binary), "\n .,"),
	Map = maps:new(),
	listToMap(Lines,Map).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

readFile(FileName) ->
	{ok, File} = file:open(FileName, read),
	Map = maps:new(),
	readByLine(File,Map).

readFile(FileName, Map) ->
	{ok, File} = file:open(FileName, read),
	readByLine(File,Map).

readByLine(File, Map) ->
    case file:read_line(File) of
        {ok, Data} -> Line = string:tokens(Data, "\n .,[{()}]\\/"),
					Map1 = listToMap(Line,Map),
					readByLine(File,Map1);
        eof        -> Map;
		{error, Reason} -> Reason
    end.

%%%%%%%%%%%WILD%%%%%%%%%%%%%%%%%%
wildList([],Map) -> Map;
wildList([H|T], Map) -> 
	Map1 = readFile(H, Map),
	wildList(T,Map1).

wildTxt() ->
	L = filelib:wildcard("*.txt"),	%you need txt files in directory
	Map = maps:new(),
	MapEnd = wildList(L, Map),
	MapEnd.
	
	





