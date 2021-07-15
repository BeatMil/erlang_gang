-module(bob).
-export([poto/1, beat/1, neet/1]).

poto(1) -> io:format("1~n");
poto(N) -> io:format("~w~n", [N]), poto(N-1).


beat(Name) ->
    io:format("Hello, Mrs. ~w!", [Name]).

neet(Name) ->
    io:fwrite("Hello,  ~p!", [Name]).
