-module(hello_erlang_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).
-export([get_path/1]).

get_path(path1) -> {"/", hello_handler, []};
get_path(path2) -> {"/beat", beat_hand, []}.

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [get_path(path1), get_path(path2)]}
    ]),
    {ok, _} = cowboy:start_clear(my_http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
    hello_erlang_sup:start_link().

stop(_State) ->
	ok.
