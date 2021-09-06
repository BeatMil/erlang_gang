-module(beat).
-export([start/0]).

start() ->
    Req = #{bindings => #{},body_length => 0,cert => undefined,has_body => false,
           headers =>
               #{<<"accept">> =>
                     <<"image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8">>,
                 <<"accept-encoding">> => <<"gzip, deflate, br">>,
                 <<"accept-language">> => <<"en-US,en;q=0.9">>,
                 <<"cache-control">> => <<"no-cache">>,
                 <<"connection">> => <<"keep-alive">>,
                 <<"host">> => <<"localhost:8080">>,
                 <<"pragma">> => <<"no-cache">>,
                 <<"referer">> => <<"http://localhost:8080/">>,
                 <<"sec-fetch-dest">> => <<"image">>,
                 <<"sec-fetch-mode">> => <<"no-cors">>,
                 <<"sec-fetch-site">> => <<"same-origin">>,
                 <<"sec-gpc">> => <<"1">>,
                 <<"user-agent">> =>
                     <<"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36">>},
           host => <<"localhost">>,host_info => undefined,method => <<"GET">>,
           path => <<"/favicon.ico">>,path_info => undefined,
           peer => {{127,0,0,1},49110},
           pid => <'0.228.0'>,port => 8080,qs => <<>>,ref => http_dispatcher,
           scheme => <<"http">>,
           sock => {{127,0,0,1},8080},
           streamid => 2,version => 'HTTP/1.1'}.
