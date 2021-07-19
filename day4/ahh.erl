-module(ahh).
-import(io, [format/1, format/2]).
-export([pl/1, dup/2, res/1]).

pl([B]) -> format("~p~n", [B]);
pl(List) ->
    [H|T] = List,
    format("~p~n", [H]),
    pl(T).

dup(0,_) -> [];
dup(C,Something) when C > 0 ->
    [Something | dup(C-1,Something)].

res([]) -> [];
res([H|T]) -> res(T) ++ [H].
