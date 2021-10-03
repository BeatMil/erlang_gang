-module(bob).
-compile(export_all).


start() ->
	Plate = "5W76-C-BB-37S",
	group_by_four(Plate).


group_by_four(Plate) ->
	Splitted_string = split_with_dash(Plate),
	flatten_list(Splitted_string).


split_with_dash(List) ->
	Result = string:tokens(List, "-"),
	Result.


flatten_list(List) ->
	Result = lists:flatten(List),
	Result.
