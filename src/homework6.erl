-module(homework6).
-export([create/1, insert/3, insert/4, lookup/2]).

create(TableName) -> homework6_server:create(TableName).
insert(TableName, Key, Value) -> homework6_server:insert(TableName, Key, Value).
insert(TableName, Key, Value, TTL) -> homework6_server:insert(TableName, Key, Value, TTL).
lookup(TableName, Key) -> homework6_server:lookup(TableName, Key).
