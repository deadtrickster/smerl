

# Smerl #

Copyright (c) 2006-2007, 2016 AUTHORS

__Version:__ 0.0.1

[![Hex.pm][Hex badge]][Hex link]
[![Hex.pm Downloads][Hex downloads badge]][Hex link]
[![Build Status][Travis badge]][Travis link]
[![Coverage Status][Coveralls badge]][Coveralls link]

*<b>S</b>imple <b>M</b>etaprogramming for <b>Erl</b>ang*

*Smerl* is an Erlang library that simplifies the creation and manipulation of
Erlang modules at runtime, using Erlang's capabilities for hot code swapping and
abstract syntax tree transformations to do its magic.

New functions can be expressed either as strings of Erlang code or as abstract
forms.

For more information, read
the [Abstract Format section in the ERTS User's guide][Abstract Format].

## Origins

*Smerl* was inspired by the [`rdbms_codegen`][] module in the [RDBMS][]
application (part of [Jungerl][]) written by [Ulf Wiger][].

The [`smerl`][] module was extracted from the abandoned [ErlyWeb][]
and patches from [ErlyWeb forks][].

## Examples

Define a module `foo`:

<pre lang="erlang">
M1 = smerl:new(foo).
</pre>

Define a function `foo:bar/0` using a string of Erlang code:

<pre lang="erlang">
{ok, M2} = smerl:add_func(M1, "bar() -> 1 + 1.").
</pre>

... or using the Erlang Abstract Format:

<pre lang="erlang">
{ok, M2} = smerl:add_func(M1, {function, 1, bar, 0,
                               [{clause, 1, [], [],
                                [{op, 1, '+',
                                 {integer, 1, 1},
                                 {integer, 1, 1}}]}]}).
</pre>

*The abstract format may look more verbose in this example,
but it's also easier to manipulate in code.*

Compile the `foo` module and confirm the expected results:

<pre lang="erlang">
smerl:compile(M2),
foo:bar(),                                      % returns 2
smerl:has_func(M2, bar, 0).                     % returns true
</pre>

## Contributing

Section order:

- Types
- Macros
- Callbacks
- Public API
- Deprecations
- Private Parts

Install the `git` pre-commit hook:

<pre lang="bash">
./bin/pre-commit.sh install
</pre>

The pre-commit check can be skipped by passing `--no-verify` to `git commit`.

## AUTHORS

See the [AUTHORS][] file.

## License

*Smerl* is licensed under [The MIT License][LICENSE].

<!-- Named Links -->

[Hex badge]: https://img.shields.io/hexpm/v/smerl.svg?maxAge=2592000?style=plastic
[Hex link]: https://hex.pm/packages/smerl
[Hex downloads badge]: https://img.shields.io/hexpm/dt/smerl.svg?maxAge=2592000
[Travis badge]: https://travis-ci.org/deadtrickster/smerl.svg?branch=master
[Travis link]: https://travis-ci.org/deadtrickster/smerl
[Coveralls badge]: https://coveralls.io/repos/github/deadtrickster/smerl/badge.svg?branch=master
[Coveralls link]: https://coveralls.io/github/deadtrickster/smerl?branch=master
[Erlyweb]: https://github.com/yariv/erlyweb
[Abstract Format]: http://erlang.org/doc/doc-5.5/erts-5.5/doc/html/absform.html#4
[`rdbms_codegen`]: https://github.com/yurrriq/jungerl/blob/master/lib/rdbms/src/rdbms_codegen.erl
[RDBMS]: https://github.com/yurrriq/jungerl/tree/master/lib/rdbms
[Jungerl]: https://github.com/yurrriq/jungerl
[Ulf Wiger]: https://github.com/uwiger
[`smerl`]: ./src/smerl.erl
[Erlyweb forks]: https://github.com/yariv/erlyweb/network
[AUTHORS]: ./AUTHORS.md
[LICENSE]: ./LICENSE


## Modules ##


<table width="100%" border="0" summary="list of modules">
<tr><td><a href="https://github.com/deadtrickster/smerl/blob/feature/yurrriq-cleanup/doc/smerl.md" class="module">smerl</a></td></tr></table>

