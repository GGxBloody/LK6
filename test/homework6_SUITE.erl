-module(homework6_SUITE).
-include_lib("G:/Erlang OTP/lib/common_test-1.27.1/include/ct.hrl"). % Залишимо ваш шлях до Common Test

-export([all/0, init_per_suite/1, end_per_suite/1, 
         test_create_table/1, test_insert_and_lookup/1, test_ttl_expiration/1]).

%% Список усіх тестів
all() -> [test_create_table, test_insert_and_lookup, test_ttl_expiration].

%% Ініціалізація перед виконанням тестів
init_per_suite(Config) ->
    application:start(homework6),
    Config.

%% Завершення після тестів
end_per_suite(_Config) ->
    application:stop(homework6),
    ok.

%% Тест створення таблиці
test_create_table(_Config) ->
    Expected = ok,
    Actual = homework6:create(test_table),
    ct:pal({Expected =:= Actual, "Expected: ~p, got: ~p", [Expected, Actual]}).

%% Тест вставки та пошуку значень
test_insert_and_lookup(_Config) ->
    ExpectedInsert = ok,
    ActualInsert = homework6:insert(test_table, my_key, "value"),
    ct:pal({ExpectedInsert =:= ActualInsert, "Expected: ~p, got: ~p", [ExpectedInsert, ActualInsert]}),
    
    ExpectedLookup = "value",
    ActualLookup = homework6:lookup(test_table, my_key),
    ct:pal({ExpectedLookup =:= ActualLookup, "Expected: ~p, got: ~p", [ExpectedLookup, ActualLookup]}).

%% Тест з перевіркою TTL
test_ttl_expiration(_Config) ->
    ExpectedInsert = ok,
    ActualInsert = homework6:insert(test_table, temp_key, "temp_value", 2), % TTL = 2 seconds
    ct:pal({ExpectedInsert =:= ActualInsert, "Expected: ~p, got: ~p", [ExpectedInsert, ActualInsert]}),

    ExpectedLookupBefore = "temp_value",
    ActualLookupBefore = homework6:lookup(test_table, temp_key),
    ct:pal({ExpectedLookupBefore =:= ActualLookupBefore, "Expected: ~p, got: ~p", [ExpectedLookupBefore, ActualLookupBefore]}),
    
    timer:sleep(3000), % Почекати, поки TTL закінчиться
    
    ExpectedLookupAfter = undefined,
    ActualLookupAfter = homework6:lookup(test_table, temp_key),
    ct:pal({ExpectedLookupAfter =:= ActualLookupAfter, "Expected: ~p, got: ~p", [ExpectedLookupAfter, ActualLookupAfter]}).
