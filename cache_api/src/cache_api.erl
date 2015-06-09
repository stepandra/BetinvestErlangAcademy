-module(cache_api).
-export([create/0,add_item/2,remove_key/1, get_data/0, range/2, get/1]).


create() ->
  ets:new(data,[ordered_set, named_table]).

add_item(Key, Value) ->
  Time = erlang:localtime(),
  ets:insert(data,{Key, Value, Time}).

get_data()->
  ets:tab2list(data).

get(Key)->
  ets:lookup(data, Key).

range(From, Until) -> 
    range(From, Until, ets:first(data), []).

range(_, _, '$end_of_table', Acc) -> 
    lists:reverse(Acc);

range(From, Until, Key, Acc) ->
    [{Key, Value, Time}] = ets:lookup(data, Key),
  if
    Time >= From andalso Until >= Time ->
        range(From, Until, ets:next(data, Key), [{Key, Value}|Acc]);
    true ->
        range(From, Until, ets:next(data, Key), Acc)
  end.

remove_key(Key) ->
  ets:delete(data, Key).
