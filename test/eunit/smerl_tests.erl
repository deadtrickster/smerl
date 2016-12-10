-module(smerl_tests).

-include_lib("eunit/include/eunit.hrl").

basic_text_test() ->
  M1 = smerl:new(foo),
  {ok, M2} = smerl:add_func(M1, "bar() -> 1 + 1."),
  smerl:compile(M2),
  ?assertMatch(2, foo:bar()),
  ?assertMatch(true, smerl:has_func(M2, bar, 0)).

basic_ast_test() ->

  M1 = smerl:new(foo),
  {ok,M2} = smerl:add_func(M1, {function, 1, bar, 0,
                                [{clause, 1, [], [],
                                  [{op, 1, '+',
                                    {integer, 1, 1},
                                    {integer, 1, 1}}]}]}),
  smerl:compile(M2),
  ?assertMatch(2, foo:bar()),
  ?assertMatch(true, smerl:has_func(M2, bar, 0)).
