-module(homework6_test).
-export([test_lookup/2]).

test_lookup(TableName, Key) ->
    case homework6:lookup(TableName, Key) of
        undefined -> io:format("Key not found or expired~n");
        Value -> io:format("Found value: ~p~n", [Value])
    end.
