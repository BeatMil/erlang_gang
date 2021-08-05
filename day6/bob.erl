-module(bob).
-export([add_two_int/2, start/1]).


add_two_int(F1, F2) ->
    F1 + F2.


start(Class) ->
    Class.
