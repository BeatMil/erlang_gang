-module(fake_loop).
-export([add_head/1, add_tail/1]).


add_head(Thing) ->
    [16|Thing].


add_tail(Thing) ->
    [Thing|23].
