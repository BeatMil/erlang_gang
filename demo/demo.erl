-module(demo).
-export([f_to_c/1, convert/1]).


f_to_c(Farenhide) ->
    (Farenhide - 32) * (5/9).

convert(Tempurature) ->
    case(Tempurature) of
        {f, N} ->
            (N - 32) * (5/9);
        {c, N} ->
            (N * (9/5)) + 32 ;
        _->
            'we dont do that here'
    end.
