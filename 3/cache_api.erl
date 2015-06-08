-module(cache_api).
-export([create/0,add_item/2,remove_key/1, get_table/0, range/2, get/1]).


create() ->
  ets:new(data,[ordered_set, named_table]).

add_item(Key, Value) ->
  Time = erlang:localtime(),
  ets:insert(data,{Key, Value, Time}).

get(Key)->
  ets:lookup(data, Key).

range(From, Until) -> 
    range(From, Until, ets:first(data), []).

range(_, _, '$end_of_table', A) -> 
    p05:reverse(A);

range(From, Until, Key, A) ->
    [{Key, Value, Time}] = ets:lookup(data, Key),
  if
    Time >= From andalso Until >= Time ->
        range(From, Until, ets:next(data, Key), [{Key, Value}|A]);
    true ->
        range(From, Until, ets:next(data, Key), A)
  end.

remove_key(Key) ->
  ets:delete(data, Key).

get_table()->
  ets:tab2list(data).

