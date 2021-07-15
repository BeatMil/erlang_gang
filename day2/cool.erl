-module(cool).
-import(io, [format/1]).
-export([main/0, get_game/1]).

main() ->
    format("uhh").

get_game(t) ->
    format("Game is ~s~n", ["tekken"]);
get_game(g) ->
    format("granblue");
get_game(_) ->
    format("uhhh huh?").

