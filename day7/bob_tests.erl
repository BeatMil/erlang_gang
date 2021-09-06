-module(bob_tests).
-compile(export_all).
-include_lib("eunit/include/eunit.hrl").


% fib(0) -> 1;
% fib(1) -> 1;
% fib(N) when N > 1 -> fib(N-1) + fib(N-2).

% fib_test_() ->
%    [?_assert(fib(0) =:= 1),
%     ?_assert(fib(1) =:= 1),
%     ?_assert(fib(2) =:= 2),
%     ?_assert(fib(3) =:= 3),
%     ?_assert(fib(4) =:= 5),
%     ?_assert(fib(5) =:= 8),
%     ?_assertException(error, function_clause, fib(-1)),
%     ?_assert(fib(31) =:= 2178309)
%    ].

simple_test() ->
   ?assert(1 + 1 =:= 2).

basic_test_() ->
   ?_test(?assert(1 + 1 =:= 2)).

fail_test() ->
    ?_assertException(error, function_clause, 3 =:= 2).

start() ->
    bob:reverse().

beat_test() ->
    ?assert(bob:choose_char() =:= aoeu).

beat2_test() ->
    bob = bob:choose_char2().
