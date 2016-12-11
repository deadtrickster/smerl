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

embed_args({function, L, Name, Arity, Clauses}, Vals) ->
  NewClauses =
    lists:map(
      fun({clause, L1, Args, Guards, _Exprs} = Clause) ->
          {EmbeddedVals, OtherArgs} =
            lists:foldr(
              fun({var, _, VarName} = Arg, {Embedded, Rest}) ->
                  case proplists:lookup(VarName, Vals) of
                    none ->
                      {Embedded, [Arg | Rest]};
                    {_, Val} ->
                      {[{VarName, erl_parse:abstract(Val)} |
                        Embedded], Rest}
                  end;
                 (Arg, {Embedded, Rest}) ->
                  {Embedded, [Arg | Rest]}
              end, {[], []}, Args),
          NewExprs = replace_vars(Clause, EmbeddedVals),
          {clause, L1, OtherArgs, Guards, NewExprs}
          %% {Args1, Matches1, _RemainingVals} =
          %%   lists:foldl(
          %%     fun({var, _L2, ArgName} = Arg,
          %%         {Args2, Matches2, Vals1}) ->
          %%         case lists:keysearch(ArgName, 1, Vals1) of
          %%           {value, {_Name, Val} = Elem} ->
          %%             Match = {match, L1, Arg,
          %%                      erl_parse:abstract(Val)},
          %%             {Args2, [Match | Matches2],
          %%              lists:delete(Elem, Vals1)};
          %%           false ->
          %%             {[Arg | Args2], Matches2, Vals1}
          %%         end;
          %%        (Arg, {Args2, Matches2, Vals1}) ->
          %%         {[Arg | Args2], Matches2, Vals1}
          %%     end, {[], [], Vals}, Args),
          %% [{clause, L1, lists:reverse(Args1), Guards,
          %%   lists:reverse(Matches1) ++ Exprs} | Clauses1]
      end, Clauses),
  NewArity =
    case NewClauses of
      [{clause, _L2, Args, _Guards, _Exprs}|_] ->
        length(Args);
      _ ->
        Arity
    end,
  {function, L, Name, NewArity, NewClauses}.

curry_clause({clause, L1, ExistingArgs, Guards, _Exprs} = Clause, NewArgs) ->
  {FirstArgs, LastArgs} = lists:split(length(NewArgs), ExistingArgs),
  %% Matches =
  %%   lists:foldl(
  %%     fun({Var, NewVal}, Acc) ->
  %%         [{match, 1, Var, erl_parse:abstract(NewVal)} | Acc]
  %%     end, [], lists:zip(FirstArgs, NewArgs)),
  %% {clause, L1, LastArgs, Guards, Matches ++ Exprs}.
  Vals =
    lists:foldl(
      fun({{var, _ , Name}, NewVal}, Acc) ->
          [{Name, erl_parse:abstract(NewVal)} | Acc];
         (_, Acc) ->
          Acc
      end, [], lists:zip(FirstArgs, NewArgs)),
  NewExprs = replace_vars(Clause, Vals),
  {clause, L1, LastArgs, Guards, NewExprs}.
