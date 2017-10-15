-module(lab2).
-compile([export_all]).

map_append(Key, Value, Map) -> maps:put(Key, Value, Map).

map_update(Key, Value, Map) -> maps:update(Key, Value, Map).

map_display(Map) -> maps:to_list(Map).

%f-cja wildcard
%czytaj po lini dla zwiekszenia efektywnosci
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


readfile(FileName) ->
	{ok, Binary} = file:read_file(FileName),
	Lines = string:tokens(erlang:binary_to_list(Binary), "\n .,"),
	Map = maps:new(),
	listToMap(Lines,Map).


