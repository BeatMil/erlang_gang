-module(funs).
-import(io, [format/1, format/2]).
-compile(export_all).

head([H|_]) -> H.

second([_,S|_]) -> S.

mid([_,A,_]) -> A.


same(A) ->
    format("ha ~s", [<<A>>]).

same(A,A) ->
    ha_syce.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n",[Date,Y,M,D]),
io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S]);
valid_time(_) ->
io:format("Stop feeding me wrong data!~n").

old_enough(X) when X >= 10, is_integer(X) ->
    true;
old_enough(_) ->
    false.
