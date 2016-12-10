

# Module smerl #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

Smerl: Simple Metaprogramming for Erlang.

Copyright (c) 2006-2007, 2016 AUTHORS

__Authors:__ AUTHORS.

<a name="description"></a>

## Description ##

Smerl is an Erlang library
that simplifies the creation and manipulation of Erlang modules in
runtime.

You don't need to know Smerl in order to use ErlyWeb; Smerl
is included in ErlyWeb because ErlyWeb uses it internally.

Smerl uses Erlang's capabilities for hot code swapping and
abstract syntax tree transformations to do its magic. Smerl is inspired by
the rdbms_codegen.erl module in the RDBMS application written by
Ulf Wiger. RDBMS is part of Jungerl ([`http://jungerl.sf.net`](http://jungerl.sf.net)).

Here's a quick example illustrating how to use Smerl:

```erlang

   test_smerl() ->
     M1 = smerl:new(foo),
     {ok, M2} = smerl:add_func(M1, "bar() -> 1 + 1."),
     smerl:compile(M2),
     foo:bar(),   % returns 2
     smerl:has_func(M2, bar, 0). % returns true
```

New functions can be expressed either as strings of Erlang code
or as abstract forms. For more information, read the Abstract Format
section in the ERTS User's guide
([`http://erlang.org/doc/doc-5.5/erts-5.5/doc/html/absform.html#4`](http://erlang.org/doc/doc-5.5/erts-5.5/doc.md/absform.html#4)).

Using the abstract format, the 3rd line of the above example
would be written as

```erlang

      {ok,M2} = smerl:add_func(M1, {function,1,bar,0,
                               [{clause,1,[],[],
                                [{op,1,'+',{integer,1,1},{integer,1,1}}]}]).
```

The abstact format may look more verbose in this example, but
it's also easier to manipulate in code.


<a name="types"></a>

## Data Types ##




### <a name="type-func_form">func_form()</a> ###


__abstract datatype__: `func_form()`

The abstract form for the function, as described
in the ERTS Users' manual.



### <a name="type-meta_mod">meta_mod()</a> ###


__abstract datatype__: `meta_mod()`

A data structure holding the abstract representation
for a module.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#add_func-2">add_func/2</a></td><td>Add a new function to the meta_mod and return the resulting meta_mod.</td></tr><tr><td valign="top"><a href="#add_func-3">add_func/3</a></td><td>Add a new function to the meta_mod and return the new MetaMod
record.</td></tr><tr><td valign="top"><a href="#compile-1">compile/1</a></td><td>Compile the module represented by the meta_mod and load the
resulting BEAM into the emulator.</td></tr><tr><td valign="top"><a href="#compile-2">compile/2</a></td><td>Compile the module represented by the meta_mod and load the
resulting BEAM into the emulator.</td></tr><tr><td valign="top"><a href="#curry-2">curry/2</a></td><td>Get the curried form for the function and parameter(s).</td></tr><tr><td valign="top"><a href="#curry-4">curry/4</a></td><td>Curry the function from the module with the given param(s).</td></tr><tr><td valign="top"><a href="#curry-5">curry/5</a></td><td>Curry the function from the module or meta_mod
with the param(s), and return its renamed form.</td></tr><tr><td valign="top"><a href="#curry_add-3">curry_add/3</a></td><td>Add the curried form of the function in the meta_mod
with its curried form.</td></tr><tr><td valign="top"><a href="#curry_add-4">curry_add/4</a></td><td>Add the curried form of the function
in the meta_mod with its curried form.</td></tr><tr><td valign="top"><a href="#curry_add-5">curry_add/5</a></td><td>Curry the function form from the meta_mod, then add it
to the other meta_mod with a new name.</td></tr><tr><td valign="top"><a href="#curry_add-6">curry_add/6</a></td><td>Curry the function in the module, rename the curried form, and
add it to the meta_mod.</td></tr><tr><td valign="top"><a href="#curry_replace-3">curry_replace/3</a></td><td>Replace the function in the meta_mod with
its curried form.</td></tr><tr><td valign="top"><a href="#curry_replace-4">curry_replace/4</a></td><td>Replace the function in the meta_mod with
its curried form.</td></tr><tr><td valign="top"><a href="#embed_all-2">embed_all/2</a></td><td>Apply the embed_params function with the list of {Name, Value}
pairs to all forms in the meta_mod.</td></tr><tr><td valign="top"><a href="#embed_params-2">embed_params/2</a></td><td>This function takes a function form and list of name/value pairs,
and replaces all the function's parameters that whose names match an
element from the list with the predefined value.</td></tr><tr><td valign="top"><a href="#embed_params-4">embed_params/4</a></td><td>Apply <a href="#embed_params-2"><code>embed_params/2</code></a> to a function from the meta_mod and
add the resulting function to the meta_mod, and return the resulting
meta_mod.</td></tr><tr><td valign="top"><a href="#embed_params-5">embed_params/5</a></td><td>Apply embed_params/2 to the function from the meta_mod and
add the resulting function to the meta_mod after renaming the function.</td></tr><tr><td valign="top"><a href="#extend-2">extend/2</a></td><td>extend/2
Add all the parent module's functions that are missing from the child
module to the child module.</td></tr><tr><td valign="top"><a href="#extend-3">extend/3</a></td><td>Similar to extend/2, with the addition of the 'ArityDiff' parameter,
which indicates the difference
in arities Smerl should use when figuring out which functions to
generate based on the modules' exports.</td></tr><tr><td valign="top"><a href="#extend-4">extend/4</a></td><td></td></tr><tr><td valign="top"><a href="#for_file-1">for_file/1</a></td><td>Equivalent to <a href="#for_file-2"><tt>for_file(SrcFilePath, [])</tt></a>.</td></tr><tr><td valign="top"><a href="#for_file-2">for_file/2</a></td><td>Equivalent to <a href="#for_file-3"><tt>for_file(SrcFilePath, IncludePaths, [])</tt></a>.</td></tr><tr><td valign="top"><a href="#for_file-3">for_file/3</a></td><td>Create a meta_mod for a module from its source file.</td></tr><tr><td valign="top"><a href="#for_module-1">for_module/1</a></td><td>Equivalent to <a href="#for_module-2"><tt>for_module(ModuleName, [])</tt></a>.</td></tr><tr><td valign="top"><a href="#for_module-2">for_module/2</a></td><td>Equivalent to <a href="#for_module-3"><tt>for_module(ModuleName, IncludePaths, [])</tt></a>.</td></tr><tr><td valign="top"><a href="#for_module-3">for_module/3</a></td><td>Create a meta_mod tuple for an existing module.</td></tr><tr><td valign="top"><a href="#get_attribute-2">get_attribute/2</a></td><td>Get the value a the module's attribute.</td></tr><tr><td valign="top"><a href="#get_export_all-1">get_export_all/1</a></td><td>Get the export_all value for the module.</td></tr><tr><td valign="top"><a href="#get_exports-1">get_exports/1</a></td><td>Return the list of exports in the meta_mod.</td></tr><tr><td valign="top"><a href="#get_forms-1">get_forms/1</a></td><td>Return the list of function forms in the meta_mod.</td></tr><tr><td valign="top"><a href="#get_func-3">get_func/3</a></td><td>Get the form for the function with the specified arity in the
meta_mod.</td></tr><tr><td valign="top"><a href="#get_module-1">get_module/1</a></td><td>Return the module name for the meta_mod.</td></tr><tr><td valign="top"><a href="#has_func-3">has_func/3</a></td><td>Check whether the meta_mod has a function with the given name
and arity.</td></tr><tr><td valign="top"><a href="#new-1">new/1</a></td><td>Create a new meta_mod for a module with the given name.</td></tr><tr><td valign="top"><a href="#remove_export-3">remove_export/3</a></td><td>Remove the export from the list of exports in the meta_mod.</td></tr><tr><td valign="top"><a href="#remove_func-3">remove_func/3</a></td><td>Try to remove the function from the meta_mod.</td></tr><tr><td valign="top"><a href="#rename-2">rename/2</a></td><td>Change the name of the function represented by the form.</td></tr><tr><td valign="top"><a href="#replace_func-2">replace_func/2</a></td><td>
Replace an existing function with the new one.</td></tr><tr><td valign="top"><a href="#set_export_all-2">set_export_all/2</a></td><td>Set the export_all value for the module.</td></tr><tr><td valign="top"><a href="#set_exports-2">set_exports/2</a></td><td>Set the meta_mod's export list to the new list.</td></tr><tr><td valign="top"><a href="#set_forms-2">set_forms/2</a></td><td></td></tr><tr><td valign="top"><a href="#set_module-2">set_module/2</a></td><td>Set the meta_mod's module name.</td></tr><tr><td valign="top"><a href="#to_src-1">to_src/1</a></td><td>Return the pretty-printed source code for the module.</td></tr><tr><td valign="top"><a href="#to_src-2">to_src/2</a></td><td>Write the pretty printed source code for the module
to the file with the given file name.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="add_func-2"></a>

### add_func/2 ###

<pre><code>
add_func(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Form::<a href="#type-func_form">func_form()</a> | string()) -&gt; {ok, NewMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, parse_error}
</code></pre>
<br />

Add a new function to the meta_mod and return the resulting meta_mod.
This function calls add_func(MetaMod, Form, true).

<a name="add_func-3"></a>

### add_func/3 ###

<pre><code>
add_func(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Func::<a href="#type-func_form">func_form()</a> | string(), Export::boolean()) -&gt; {ok, NewMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, parse_error}
</code></pre>
<br />

Add a new function to the meta_mod and return the new MetaMod
record. Export is a boolean variable indicating if the function should
be added to the module's exports.

<a name="compile-1"></a>

### compile/1 ###

<pre><code>
compile(MetaMod::<a href="#type-meta_mod">meta_mod()</a>) -&gt; ok | {error, Error}
</code></pre>
<br />

Compile the module represented by the meta_mod and load the
resulting BEAM into the emulator. This function calls
compile(MetaMod, [report_errors, report_warnings]).

<a name="compile-2"></a>

### compile/2 ###

<pre><code>
compile(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Options::[term()]) -&gt; ok | {error, Error}
</code></pre>
<br />

Compile the module represented by the meta_mod and load the
resulting BEAM into the emulator. 'Options' is a list of options as
described in the 'compile' module in the Erlang documentation.

If the 'outdir' option is provided,
the .beam file is written to the destination directory.

<a name="curry-2"></a>

### curry/2 ###

<pre><code>
curry(Form::<a href="#type-func_form">func_form()</a>, Param::term() | [term()]) -&gt; {ok, NewForm::<a href="#type-func_form">func_form()</a>} | {error, Err}
</code></pre>
<br />

Get the curried form for the function and parameter(s). Currying
involves replacing one or more of the function's leading parameters
with predefined values.

<a name="curry-4"></a>

### curry/4 ###

<pre><code>
curry(ModName::atom(), Name::atom(), Arity::integer(), Params::term() | [term()]) -&gt; {ok, NewForm} | {error, Err}
</code></pre>
<br />

Curry the function from the module with the given param(s)

<a name="curry-5"></a>

### curry/5 ###

<pre><code>
curry(Module::atom() | <a href="#type-meta_mod">meta_mod()</a>, Name::atom(), Arity::integer(), Params::term() | [<a href="#type-terms">terms()</a>], NewName::atom()) -&gt; {ok, NewForm} | {error, Err}
</code></pre>
<br />

Curry the function from the module or meta_mod
with the param(s), and return its renamed form.

<a name="curry_add-3"></a>

### curry_add/3 ###

<pre><code>
curry_add(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Form::<a href="#type-func_form">func_form()</a>, Params::term() | [term()]) -&gt; {ok, NewMetaMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, Err}
</code></pre>
<br />

Add the curried form of the function in the meta_mod
with its curried form.

<a name="curry_add-4"></a>

### curry_add/4 ###

<pre><code>
curry_add(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Name::atom(), Arity::integer(), Params::term() | [term()]) -&gt; {ok, NewMetaMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, Err}
</code></pre>
<br />

Add the curried form of the function
in the meta_mod with its curried form.

<a name="curry_add-5"></a>

### curry_add/5 ###

<pre><code>
curry_add(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Name::atom(), Arity::integer(), Params::[term()], NewName::atom()) -&gt; {ok, NewMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, Err}
</code></pre>
<br />

Curry the function form from the meta_mod, then add it
to the other meta_mod with a new name.

<a name="curry_add-6"></a>

### curry_add/6 ###

<pre><code>
curry_add(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Module::atom() | <a href="#type-meta_mod">meta_mod()</a>, Name::atom(), Arity::integer(), Params::term() | [term()], NewName::atom()) -&gt; {ok, NewMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, Error}
</code></pre>
<br />

Curry the function in the module, rename the curried form, and
add it to the meta_mod.

<a name="curry_replace-3"></a>

### curry_replace/3 ###

<pre><code>
curry_replace(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Form::<a href="#type-func_form">func_form()</a>, Params::term() | [term()]) -&gt; {ok, NewMetaMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, Err}
</code></pre>
<br />

Replace the function in the meta_mod with
its curried form.

<a name="curry_replace-4"></a>

### curry_replace/4 ###

<pre><code>
curry_replace(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Name::atom(), Arity::integer(), Params::term() | list()) -&gt; {ok, NewMetaMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, Err}
</code></pre>
<br />

Replace the function in the meta_mod with
its curried form.

<a name="embed_all-2"></a>

### embed_all/2 ###

<pre><code>
embed_all(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Vals::[{Name::atom(), Value::term()}]) -&gt; NewMetaMod::<a href="#type-meta_mod">meta_mod()</a>
</code></pre>
<br />

Apply the embed_params function with the list of {Name, Value}
pairs to all forms in the meta_mod. Exports
for functions whose arities change due to the embedding are preserved.

<a name="embed_params-2"></a>

### embed_params/2 ###

<pre><code>
embed_params(Func::<a href="#type-func_form">func_form()</a>, Vals::[{Name::atom(), Value::term()}]) -&gt; NewForm::<a href="#type-func_form">func_form()</a>
</code></pre>
<br />

This function takes a function form and list of name/value pairs,
and replaces all the function's parameters that whose names match an
element from the list with the predefined value.

<a name="embed_params-4"></a>

### embed_params/4 ###

<pre><code>
embed_params(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Name::atom(), Arity::integer(), Values::<a href="#type-proplist">proplist()</a>) -&gt; {ok, NewMetaMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, Err}
</code></pre>
<br />

Apply [`embed_params/2`](#embed_params-2) to a function from the meta_mod and
add the resulting function to the meta_mod, and return the resulting
meta_mod.

<a name="embed_params-5"></a>

### embed_params/5 ###

<pre><code>
embed_params(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Name::atom(), Arity::integer(), Values::<a href="#type-proplist">proplist()</a>, NewName::atom()) -&gt; {ok, NewMetaMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, Err}
</code></pre>
<br />

Apply embed_params/2 to the function from the meta_mod and
add the resulting function to the meta_mod after renaming the function.

<a name="extend-2"></a>

### extend/2 ###

<pre><code>
extend(Parent::atom() | <a href="#type-meta_mod">meta_mod()</a>, Child::atom() | <a href="#type-meta_mod">meta_mod()</a>) -&gt; NewChildMod::<a href="#type-meta_mod">meta_mod()</a>
</code></pre>
<br />

extend/2
Add all the parent module's functions that are missing from the child
module to the child module. The new functions in the child module are
shallow: they have the name and arity as their corresponding functions in
the parent meta_mod, but instead of implementing their logic they call
the parent module's functions.

<a name="extend-3"></a>

### extend/3 ###

<pre><code>
extend(Parent::atom() | <a href="#type-meta_mod">meta_mod()</a>, Child::atom() | <a href="#type-meta_mod">meta_mod()</a>, ArityDiff::integer()) -&gt; NewChildMod::<a href="#type-meta_mod">meta_mod()</a>
</code></pre>
<br />

Similar to extend/2, with the addition of the 'ArityDiff' parameter,
which indicates the difference
in arities Smerl should use when figuring out which functions to
generate based on the modules' exports. This is sometimes
useful when calling extend() followed by embed_all().

<a name="extend-4"></a>

### extend/4 ###

`extend(Parent, Child, ArityDiff, Options) -> any()`

<a name="for_file-1"></a>

### for_file/1 ###

`for_file(SrcFilePath) -> any()`

Equivalent to [`for_file(SrcFilePath, [])`](#for_file-2).

<a name="for_file-2"></a>

### for_file/2 ###

`for_file(SrcFilePath, IncludePaths) -> any()`

Equivalent to [`for_file(SrcFilePath, IncludePaths, [])`](#for_file-3).

<a name="for_file-3"></a>

### for_file/3 ###

<pre><code>
for_file(SrcFilePath::string(), IncludePaths::[string()], Macros::[{atom(), term()}]) -&gt; {ok, <a href="#type-meta_mod">meta_mod()</a>} | {error, invalid_module}
</code></pre>
<br />

Create a meta_mod for a module from its source file.

<a name="for_module-1"></a>

### for_module/1 ###

`for_module(ModuleName) -> any()`

Equivalent to [`for_module(ModuleName, [])`](#for_module-2).

<a name="for_module-2"></a>

### for_module/2 ###

`for_module(ModuleName, IncludePaths) -> any()`

Equivalent to [`for_module(ModuleName, IncludePaths, [])`](#for_module-3).

<a name="for_module-3"></a>

### for_module/3 ###

<pre><code>
for_module(ModuleName::atom() | string(), IncludePaths::[string()], Macros::[{atom(), term()}]) -&gt; {ok, <a href="#type-meta_mod">meta_mod()</a>} | {error, Error}
</code></pre>
<br />

Create a meta_mod tuple for an existing module. If ModuleName is a
string, it is interpreted as a file name (this is the same as calling
{link smerl:for_file}). If ModuleName is an atom, Smerl attempts to
find its abstract represtation either from its source file or from
its .beam file directly (if it has been compiled with debug_info).
If the abstract representation can't be found, this function returns
an error.

The IncludePaths parameter is used when 'ModuleName' is a file name.

<a name="get_attribute-2"></a>

### get_attribute/2 ###

<pre><code>
get_attribute(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, AttName::atom()) -&gt; {ok, Val} | error
</code></pre>
<br />

Get the value a the module's attribute.

<a name="get_export_all-1"></a>

### get_export_all/1 ###

<pre><code>
get_export_all(MetaMod::meta_mod) -&gt; true | false
</code></pre>
<br />

Get the export_all value for the module.

<a name="get_exports-1"></a>

### get_exports/1 ###

<pre><code>
get_exports(MetaMod::<a href="#type-meta_mod">meta_mod()</a>) -&gt; [{FuncName::atom(), Arity::integer()}]
</code></pre>
<br />

Return the list of exports in the meta_mod.

<a name="get_forms-1"></a>

### get_forms/1 ###

<pre><code>
get_forms(MetaMod::<a href="#type-meta_mod">meta_mod()</a>) -&gt; [Form]
</code></pre>
<br />

Return the list of function forms in the meta_mod.

<a name="get_func-3"></a>

### get_func/3 ###

<pre><code>
get_func(MetaMod::<a href="#type-meta_mod">meta_mod()</a> | atom(), FuncName::atom(), Arity::integer()) -&gt; {ok, <a href="#type-func_form">func_form()</a>} | {error, Err}
</code></pre>
<br />

Get the form for the function with the specified arity in the
meta_mod.

<a name="get_module-1"></a>

### get_module/1 ###

`get_module(MetaMod) -> any()`

Return the module name for the meta_mod.

<a name="has_func-3"></a>

### has_func/3 ###

<pre><code>
has_func(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, FuncName::atom(), Arity::integer()) -&gt; bool()
</code></pre>
<br />

Check whether the meta_mod has a function with the given name
and arity.

<a name="new-1"></a>

### new/1 ###

<pre><code>
new(Module::atom()) -&gt; <a href="#type-meta_mod">meta_mod()</a>
</code></pre>
<br />

Create a new meta_mod for a module with the given name.

<a name="remove_export-3"></a>

### remove_export/3 ###

<pre><code>
remove_export(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, FuncName::atom(), Arity::integer()) -&gt; NewMod::<a href="#type-meta_mod">meta_mod()</a>
</code></pre>
<br />

Remove the export from the list of exports in the meta_mod.

<a name="remove_func-3"></a>

### remove_func/3 ###

<pre><code>
remove_func(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, FuncName::string(), Arity::integer()) -&gt; NewMod::<a href="#type-meta_mod">meta_mod()</a>
</code></pre>
<br />

Try to remove the function from the meta_mod.
If the function exists, the new meta_mod is returned. Otherwise,
original meta_mod is returned.

<a name="rename-2"></a>

### rename/2 ###

<pre><code>
rename(Form::<a href="#type-func_form">func_form()</a>, NewName::atom()) -&gt; {ok, NewForm::<a href="#type-func_form">func_form()</a>} | {error, Err}
</code></pre>
<br />

Change the name of the function represented by the form.

<a name="replace_func-2"></a>

### replace_func/2 ###

<pre><code>
replace_func(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Function::string() | <a href="#type-func_form">func_form()</a>) -&gt; {ok, NewMod::<a href="#type-meta_mod">meta_mod()</a>} | {error, Error}
</code></pre>
<br />

Replace an existing function with the new one. If the function doesn't exist
the new function is added to the meta_mod.
This is tantamount to calling smerl:remove_func followed by smerl:add_func.

<a name="set_export_all-2"></a>

### set_export_all/2 ###

<pre><code>
set_export_all(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Val::true | false) -&gt; NewMetaMod::<a href="#type-meta_mod">meta_mod()</a>
</code></pre>
<br />

Set the export_all value for the module.

<a name="set_exports-2"></a>

### set_exports/2 ###

<pre><code>
set_exports(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, Exports::[{FuncName::atom(), Arity::integer()}]) -&gt; NewMod::<a href="#type-meta_mod">meta_mod()</a>
</code></pre>
<br />

Set the meta_mod's export list to the new list.

<a name="set_forms-2"></a>

### set_forms/2 ###

`set_forms(MetaMod, Forms) -> any()`

<a name="set_module-2"></a>

### set_module/2 ###

<pre><code>
set_module(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, NewName::atom()) -&gt; NewMod::<a href="#type-meta_mod">meta_mod()</a>
</code></pre>
<br />

Set the meta_mod's module name.

<a name="to_src-1"></a>

### to_src/1 ###

<pre><code>
to_src(MetaMod::<a href="#type-meta_mod">meta_mod()</a>) -&gt; string()
</code></pre>
<br />

Return the pretty-printed source code for the module.

<a name="to_src-2"></a>

### to_src/2 ###

<pre><code>
to_src(MetaMod::<a href="#type-meta_mod">meta_mod()</a>, FileName::string()) -&gt; ok | {error, Error}
</code></pre>
<br />

Write the pretty printed source code for the module
to the file with the given file name.

