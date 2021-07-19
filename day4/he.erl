-module(he).
-import(io, [format/1, format/2]).
-export([hi/1]).

hi(Name) ->
    format("Hi ~p~n", [Name]).
