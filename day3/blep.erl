-module(blep).
-import(io, [format/1, format/2]).
-export([yay/0, square_perimeter/1, fac/1, inifine_loop/0, len/1, any/1, pto1/1]).

yay() ->
    receive 
        {Pid, cat} ->
            format(sayonara),
            Pid ! okayfine
    end.

square_perimeter(Side) ->
   Side*4.

fac(0) -> 1;
fac(N) when N > 0 -> N*fac(N-1).

inifine_loop() ->
    format("yay"),
    inifine_loop().

len([]) -> 0;
len([_|L]) -> 1 + len(L).

any(Pid) ->
    Pid ! {self(), cat}. 

pto1(1) -> format("1~n");
pto1(N) -> format("~s~n", [N]), pto1(N - 1).
