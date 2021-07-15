-module(jero).
-export([hello_beat/1, age_check/1, get_animal/1, get_game/1]).

hello_beat(ladiva) ->
    io:format("LOVE\n");
hello_beat(solbadguy) ->
    io:format("Voltex!\n");
hello_beat(_) ->
    io:format("....?\n").

age_check(Age) ->
    if Age >= 18 ->
        nice;
       Age < 18 ->
        yikes
    end.

get_animal(Animal) ->
    if Animal == cat ->
            meow;
       Animal == dog ->
            bork
    end.

get_game(Game) ->
    case(Game) of
        tekken -> gudgame;
        granblue -> verygudgame;
        mincraft -> calmgame
    end.
