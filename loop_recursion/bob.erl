-module(bob).
-compile(export_all).

start()->
    Big_list = [{sla_value, secret_sla_bye}, {game, tekken}, {random, rice}],
    Big_list2 = [{game, tekken}, {random, rice}, {sla_value, secret_sla_bye}],
    Big_list3 = [{game, tekken}, {random, rice}],
    loop(Big_list3).


loop([]) ->
    {no_sla_found, no_sla_found};
loop(List)->
    [H | T] = List,
    {Is_sla, _} = H,
    case Is_sla of
        sla_value ->
            H;
        _ ->
            loop(T)
    end.
