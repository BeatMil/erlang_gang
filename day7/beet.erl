-module(beet).
% -import(bob, [send/0]).
-export([start/0]).

start() ->
    bob:send(),
    nice.
