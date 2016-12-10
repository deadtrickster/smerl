

# smerl #

Copyright (c) 2006-2007, 2016 AUTHORS

__Version:__ 0.0.1

[![Hex.pm](https://img.shields.io/hexpm/v/smerl.svg?maxAge=2592000?style=plastic)](https://hex.pm/packages/smerl)
[![Hex.pm](https://img.shields.io/hexpm/dt/smerl.svg?maxAge=2592000)](https://hex.pm/packages/smerl)
[![Build Status](https://travis-ci.org/deadtrickster/smerl.svg?branch=version-3)](https://travis-ci.org/deadtrickster/smerl)
[![Coverage Status](https://coveralls.io/repos/github/deadtrickster/smerl/badge.svg?branch=master)](https://coveralls.io/github/deadtrickster/smerl?branch=master)

## Origins

Extracted from [abandoned Erlyweb](https://github.com/yariv/erlyweb).
Plus patches from Erlyweb forks.

## Examples

Define module `foo` and function `bar` using string of Erlang code:

```erlang

  M1 = smerl:new(foo),
  {ok, M2} = smerl:add_func(M1, "bar() -> 1 + 1."),
  smerl:compile(M2),
  foo:bar(). %% => 2
  smerl:has_func(M2, bar, 0). %% => true

```

Define module `foo` and function `bar` using Erlang Abstract Format:

```erlang

  M1 = smerl:new(foo),
  {ok, M2} = smerl:add_func(M1, {function, 1, bar, 0,
                                [{clause, 1, [], [],
                                  [{op, 1, '+',
                                    {integer, 1, 1},
                                    {integer, 1, 1}}]}]}),
  smerl:compile(M2),
  ?assertMatch(2, foo:bar()),

```

## Contributing

Sections order:

`Types -> Macros -> Callbacks -> Public API -> Deprecations -> Private Parts`

install git precommit hook:

```
   ./bin/pre-commit.sh install
```

Pre-commit check can be skipped passing `--no-verify` option to git commit.

## AUTHORS

- Yariv Sadan yarivsblog@gmail.com;
- Ilya Khaprov i.khaprov@gmail.com;
- Eric Bailey eric@ericb.me.

## License

MIT


## Modules ##


<table width="100%" border="0" summary="list of modules">
<tr><td><a href="https://github.com/deadtrickster/smerl/blob/master/doc/smerl.md" class="module">smerl</a></td></tr></table>

