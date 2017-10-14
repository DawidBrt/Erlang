-module(lab2).
-compile([export_all]).

map_append(Key, Value, Map) -> maps:put(Key, Value, Map).

map_update(Key, Value, Map) -> maps:update(Key, Value, Map).

map_display(Map) -> maps:to_list(Map).

%f-cja wildcard
%czytaj po lini dla zwiekszenia efektywnosci
%%%%%%%%%%%%%%%%%%%%
readfile(FileName) ->
	{ok, Binary} = file:read_file(FileName),
	Lines = string:tokens(erlang:binary_to_list(Binary), "\n .,").
	


