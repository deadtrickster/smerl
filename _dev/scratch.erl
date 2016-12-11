%% @doc Simliar to {@link replace_func/2}, but accepts a function
%% name and `fun' expression.
-spec replace_func(MetaMod, Name, Fun) -> {ok, NewMod} | {error, Error} when
    MetaMod :: meta_mod(),
    Name    :: atom(),
    Fun     :: function(),
    NewMod  :: meta_mod(),
    Error   :: term().
replace_func(MetaMod, Name, Fun) when is_function(Fun) ->
  case form_for_fun(Name, Fun) of
    {ok, Form} ->
      replace_func(MetaMod, Form);
    Err ->
      Err
  end.

add_func(MetaMod, Name, Fun) when is_function(Fun) ->
  add_func(MetaMod, Name, Fun, true);

add_func(MetaMod, Name, Fun, Export) when is_function(Fun) ->
  case form_for_fun(Name, Fun) of
    {ok, Form} ->
      add_func(MetaMod, Form, Export);
    Err ->
      Err
  end.

form_for_fun(Name, Fun) ->
  Line = 999,
  Info = erlang:fun_info(Fun),
  case Info of
    [{module, _ModName}, _FuncName, _Arity, _Env, {type, external}] ->
      {error, cant_add_external_funcs};
    [_Pid, _Module, _NewIdx, _NewUniq, _Index, _Uniq, _Name,
     {arity, Arity},
     {env, [Vars, _Unknown1, _Unknown2, Clauses]},
     {type, local}] ->
      EnvVars = lists:map(
                  fun({VarName, Val}) ->
                      {match,Line,{var,Line,VarName},
                       erl_parse:abstract(Val)}
                  end, Vars),
      NewClauses = lists:map(
                     fun({clause, Line1, Params, Guards, Exprs}) ->
                         {clause, Line1, Params, Guards,
                          EnvVars ++ Exprs}
                     end, Clauses),
      {ok, {function, Line, Name, Arity, NewClauses}};
    _Other ->
      {error, bad_fun}
  end.
