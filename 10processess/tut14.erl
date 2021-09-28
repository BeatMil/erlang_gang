-module(tut14).

-export([loopy/1, do_get_request/1, run_test/0]).



run_test() ->
    io:format("start test~n"),
    loopy(100).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Spawn processes that do get request
%% depending on Times
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loopy(0) ->
    done,
    timer:sleep(100),
    exit('test finish');
loopy(1) ->
    Last_man_pid = spawn(tut14, do_get_request, [no_use_arg]),
    Last_man_bool = link(Last_man_pid),
    register(last_man, Last_man_pid),
    wait_for_last_man();
loopy(Times) ->
    spawn(tut14, do_get_request, [no_use_arg]),
    timer:sleep(10),
    loopy(Times - 1).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% No_use_arg parameter is unused
%% but if removed
%% the spawn in loopy() doesn't work ¯\_(ツ)_/¯
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
do_get_request(No_use_arg) ->
    inets:start(),
    io:format("Requesting~n"),
    Res = httpc:request("http://localhost:8080"),
    io:format("~p~n", [Res]).


wait_for_last_man() ->
    Pid = whereis(last_man),
    if
        Pid == undefined ->
            exit('test complete'),
            'test complete';
    true ->
        io:format("~p~n", [Pid]),
        io:format("sleeping~n", []),
        timer:sleep(500),
        wait_for_last_man()
    end.
