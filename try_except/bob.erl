-module(bob).
-compile(export_all).

start(Games) ->
    % Games = {granblue, grandchase, {ronan, arme}},
    try
        {_, {_, Box}, _} = Games,
        Box
    catch 
        error:Error -> 
              {error, beat_istrying, Error}
    end.
