-module(bob).
-compile(export_all).

reverse() -> lists:reverse([1,2,3]).

reverse_nil() -> [] = lists:reverse([]).
reverse_one() -> [1] = lists:reverse([1]).
reverse_two() -> [2,1] = lists:reverse([1,2]).
choose_char() -> ladiva.
choose_char2() -> bob.
