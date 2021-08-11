-module(mac).
-export([start/0]).
-define(macro1(X, Y), {a, X, b, Y}).


start() ->
    ?macro1(b, a).
