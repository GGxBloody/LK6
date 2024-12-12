-module(homework6_sup).
-behaviour(supervisor).

-export([start_link/0, init/1]).

%% API
start_link() ->
    supervisor:start_link({local, homework6_sup}, homework6_sup, []).

%% Callback для ініціалізації супервізора
init([]) ->
    {ok, {{one_for_one, 5, 10}, [
        {homework6_server,
         {homework6_server, start_link, []},
         permanent, 5000, worker, [homework6_server]}
    ]}}.
