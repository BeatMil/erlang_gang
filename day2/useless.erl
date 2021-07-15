-module(useless).
-author("beatmil").
-import(io,[format/1]).
-export([do_both/2]).

add(A, B) ->
    io:format("Nice job\n"),
    A + B.

hello() ->
    format("Hello, world!~n").

do_both(A,B) ->
    hello(),
    add(A,B).
