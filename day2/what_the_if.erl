-module(what_the_if).
-export([oh_god/1]).
 
 
oh_god(N) ->
if N =:= 2 ->
    might_succeed;
true -> 
   always_does  %% this is Erlang's if's 'else!'
end.
