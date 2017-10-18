-module(lab2).
-compile([export_all]).

map_append(Key, Value, Map) -> maps:put(Key, Value, Map).

map_update(Key, Value, Map) -> maps:update(Key, Value, Map).

map_display(Map) -> maps:to_list(Map).

%f-cja wildcard
%%%%%%%%%%%%%%%%%%%%

listToMap([],Map) -> Map;
listToMap([H|T],Map) ->
	case maps:is_key(H,Map) of
		true ->
			Value = maps:get(H, Map),
			Map1 = maps:update(H, Value+1, Map);
		false ->
			Map1 = maps:put(H, 1, Map)
	end,
	listToMap(T,Map1).

readFile(FileName) ->
	{ok, File} = file:open(FileName, read),
	Map = maps:new(),
	readByLine(File,Map).

readByLine(File, Map) ->
    case file:read_line(File) of
        {ok, Data} -> Line = string:tokens(Data, "\n .,"),
					Map1 = listToMap(Line,Map),
					readByLine(File,Map1);
        eof        -> Map;
		{error, Reason} -> Reason
    end.

readWholeFile(FileName) ->
	{ok, Binary} = file:read_file(FileName),
	Lines = string:tokens(erlang:binary_to_list(Binary), "\n .,"),
	Map = maps:new(),
	listToMap(Lines,Map).






