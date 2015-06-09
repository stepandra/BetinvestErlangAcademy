-module (cache_api_tests).


-include_lib("eunit/include/eunit.hrl").
    cache_api_test_()->[
        test_types_(),
        test_values_()].
    test_types_()->[
        ?_assert(is_atom(cache_api:create())),
        ?_assert(is_boolean(cache_api:add_item(1, "Pinkie Pie"))),
        ?_assert(is_boolean(cache_api:remove_key(1)))].

    test_values_()->[
        ?_assertEqual(true, cache_api:add_item(2, "Spike")),
        ?_assertEqual([], cache_api:get(0)),
        ?_assertEqual([], cache_api:get(3)),
        ?_assertEqual(true, cache_api:remove_key(1)),
        ?_assertEqual([{2,"Spike", erlang:localtime()}], cache_api:get_data())].
