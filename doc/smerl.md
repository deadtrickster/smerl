

# Module smerl #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

Simple Metaprogramming for Erlang.

Copyright (c) 2006-2007, 2016 AUTHORS

```
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

__Authors:__ AUTHORS.

<a name="types"></a>

## Data Types ##




### <a name="type-args">args()</a> ###


<pre><code>
args() = term() | [term()]
</code></pre>




### <a name="type-export">export()</a> ###


<pre><code>
export() = {Function::atom(), Arity::arity()}
</code></pre>




### <a name="type-exports">exports()</a> ###


__abstract datatype__: `exports()`

A list of <code><a href="#type-export">export()</a></code>s.



### <a name="type-func_form">func_form()</a> ###


__abstract datatype__: `func_form()`

The abstract form for the function, as described
in the ERTS Users' manual.



### <a name="type-func_forms">func_forms()</a> ###


__abstract datatype__: `func_forms()`

A list of <code><a href="#type-func_form">func_form()</a></code>s.



### <a name="type-meta_mod">meta_mod()</a> ###


__abstract datatype__: `meta_mod()`

A data structure holding the abstract representation
for a module.



### <a name="type-result">result()</a> ###


<pre><code>
result(Value, Error) = {ok, Value} | {error, Error}
</code></pre>




### <a name="type-result">result()</a> ###


<pre><code>
result(Value) = <a href="#type-result">result</a>(Value, term())
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#add_func-2">add_func/2</a></td><td>Add a new exported function to <code>MetaMod</code>.</td></tr><tr><td valign="top"><a href="#add_func-3">add_func/3</a></td><td>Add <code>Function</code> to <code>MetaMod</code> and return the new <code><a href="#type-meta_mod">meta_mod()</a></code>.</td></tr><tr><td valign="top"><a href="#compile-1">compile/1</a></td><td>Compile <code>MetaMod</code> and load the resulting BEAM into the emulator.</td></tr><tr><td valign="top"><a href="#compile-2">compile/2</a></td><td>Compile <code>MetaMod</code> and load the resulting BEAM into the emulator.</td></tr><tr><td valign="top"><a href="#curry-2">curry/2</a></td><td>Get the curried form for <code>Form</code> with <code>Args</code>.</td></tr><tr><td valign="top"><a href="#curry-4">curry/4</a></td><td>Curry <code>Module</code>:<code>Function</code>/<code>Arity</code> with the given <code>Args</code>.</td></tr><tr><td valign="top"><a href="#curry-5">curry/5</a></td><td>Curry <code>Module</code>:<code>Function</code>/<code>Arity</code>with the given <code>Args</code>,
renaming it to <code>NewName</code> and return the renamed form.</td></tr><tr><td valign="top"><a href="#curry_add-3">curry_add/3</a></td><td>Add <code>Form</code> curried with <code>Args</code> to <code>MetaMod</code>.</td></tr><tr><td valign="top"><a href="#curry_add-4">curry_add/4</a></td><td>Add <code>Function</code>/<code>Arity</code> curried with <code>Args</code> to <code>MetaMod</code>.</td></tr><tr><td valign="top"><a href="#curry_add-5">curry_add/5</a></td><td>Curry <code>MetaMod</code>:<code>Function</code>/<code>Arity</code> and add it to <code>MetaMod</code> as <code>NewName</code>.</td></tr><tr><td valign="top"><a href="#curry_add-6">curry_add/6</a></td><td>Curry <code>Module</code>:<code>Function</code>/<code>Arity</code> and add it to <code>MetaMod</code> as <code>NewName</code>.</td></tr><tr><td valign="top"><a href="#curry_replace-3">curry_replace/3</a></td><td>Replace the function represented by <code>Form</code> in <code>MetaMod</code>
with its curried form.</td></tr><tr><td valign="top"><a href="#curry_replace-4">curry_replace/4</a></td><td>Replace <code>Function</code>/<code>Arity</code> in <code>MetaMod</code> with its curried form.</td></tr><tr><td valign="top"><a href="#embed_all-2">embed_all/2</a></td><td>Apply <a href="#embed_args-2"><code>embed_args/2</code></a> with <code>Values</code> to all forms in <code>MetaMod</code>.</td></tr><tr><td valign="top"><a href="#embed_args-2">embed_args/2</a></td><td>Replace the arguments of the function represented by <code>Form</code>,
where the argument's <code>Name</code> matches an element from <code>Vals</code>
with the corresponding <code>Value</code>.</td></tr><tr><td valign="top"><a href="#embed_args-4">embed_args/4</a></td><td>Equivalent to <a href="#embed_args-5"><tt>embed_args(MetaMod, Name, Arity, Values, Name)</tt></a>.</td></tr><tr><td valign="top"><a href="#embed_args-5">embed_args/5</a></td><td>Apply <a href="#embed_args-2"><code>embed_args/2</code></a> to <code>MetaMod</code>:<code>Function</code>/<code>Arity</code> and
add the resulting function to <code>MetMod</code>, after renaming it to <code>NewName</code>.</td></tr><tr><td valign="top"><a href="#extend-2">extend/2</a></td><td>Add aliases for <code>Parent</code>'s functions missing from <code>Child</code> to <code>Child</code>.</td></tr><tr><td valign="top"><a href="#extend-3">extend/3</a></td><td>Similar to <a href="#extend-2"><code>extend/2</code></a>, with the addition of <code>ArityDiff</code>, which
indicates the difference in arities <em>Smerl</em> should use when figuring
out which functions to generate based on the modules' exports.</td></tr><tr><td valign="top"><a href="#extend-4">extend/4</a></td><td></td></tr><tr><td valign="top"><a href="#for_file-1">for_file/1</a></td><td>Equivalent to <a href="#for_file-2"><tt>for_file(SrcFilePath, [])</tt></a>.</td></tr><tr><td valign="top"><a href="#for_file-2">for_file/2</a></td><td>Equivalent to <a href="#for_file-3"><tt>for_file(SrcFilePath, IncludePaths, [])</tt></a>.</td></tr><tr><td valign="top"><a href="#for_file-3">for_file/3</a></td><td>Create a meta_mod for a module from its source file.</td></tr><tr><td valign="top"><a href="#for_module-1">for_module/1</a></td><td>Equivalent to <a href="#for_module-2"><tt>for_module(ModuleName, [])</tt></a>.</td></tr><tr><td valign="top"><a href="#for_module-2">for_module/2</a></td><td>Equivalent to <a href="#for_module-3"><tt>for_module(ModuleName, IncludePaths, [])</tt></a>.</td></tr><tr><td valign="top"><a href="#for_module-3">for_module/3</a></td><td>Create a meta_mod tuple for an existing module.</td></tr><tr><td valign="top"><a href="#get_attribute-2">get_attribute/2</a></td><td>Get the value of <code>MetaMod</code>'s <code>Attribute</code>.</td></tr><tr><td valign="top"><a href="#get_export_all-1">get_export_all/1</a></td><td>Get the <code>export_all</code> value for <code>MetaMod</code>.</td></tr><tr><td valign="top"><a href="#get_exports-1">get_exports/1</a></td><td>Return the list of exports in the meta_mod.</td></tr><tr><td valign="top"><a href="#get_forms-1">get_forms/1</a></td><td>Return the list of function forms in the meta_mod.</td></tr><tr><td valign="top"><a href="#get_func-3">get_func/3</a></td><td>Attempt to get the <code><a href="#type-func_form">func_form()</a></code> for <code>MetaMod</code>:<code>Function</code>/<code>Arity</code>.</td></tr><tr><td valign="top"><a href="#get_module-1">get_module/1</a></td><td>Return the module name for the meta_mod.</td></tr><tr><td valign="top"><a href="#has_func-3">has_func/3</a></td><td>Check whether <code>MetaMod</code> has a function <code>Function</code>/<code>Arity</code>.</td></tr><tr><td valign="top"><a href="#new-1">new/1</a></td><td>Create a new meta_mod for a module with the given name.</td></tr><tr><td valign="top"><a href="#remove_export-3">remove_export/3</a></td><td>Remove an export <code>{Function, Arity}</code>
from the list of <code>exports</code> in <code>MetaMod</code>.</td></tr><tr><td valign="top"><a href="#remove_func-3">remove_func/3</a></td><td>Try to remove <code>Function</code> from <code>MetaMod</code>.</td></tr><tr><td valign="top"><a href="#rename-2">rename/2</a></td><td>Change the name of the function represented by <code>Form</code> to <code>NewName</code>.</td></tr><tr><td valign="top"><a href="#replace_func-2">replace_func/2</a></td><td>Replace an existing function with a new one.</td></tr><tr><td valign="top"><a href="#set_export_all-2">set_export_all/2</a></td><td>Set the <code>export_all</code> value for <code>MetaMod</code>.</td></tr><tr><td valign="top"><a href="#set_exports-2">set_exports/2</a></td><td>Set the <code>MetaMod</code>'s export list to <code>Exports</code>.</td></tr><tr><td valign="top"><a href="#set_forms-2">set_forms/2</a></td><td></td></tr><tr><td valign="top"><a href="#set_module-2">set_module/2</a></td><td>Set the meta_mod's module name.</td></tr><tr><td valign="top"><a href="#to_src-1">to_src/1</a></td><td>Return the pretty-printed source code for <code>MetaMod</code>.</td></tr><tr><td valign="top"><a href="#to_src-2">to_src/2</a></td><td>Equivalent to <a href="file.md#write_file-2"><tt>file:write_file(Filename, to_src(MetaMod))</tt></a>.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="add_func-2"></a>

### add_func/2 ###

<pre><code>
add_func(MetaMod, Form) -&gt; <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>, parse_error)
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Form = <a href="#type-func_form">func_form()</a> | string()</code></li></ul>

Equivalent to [`add_func(MetaMod, Form, true)`](#add_func-3).

Add a new exported function to `MetaMod`.

<a name="add_func-3"></a>

### add_func/3 ###

<pre><code>
add_func(MetaMod, Func, Export) -&gt; <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>, parse_error)
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Func = <a href="#type-func_form">func_form()</a> | string()</code></li><li><code>Export = boolean()</code></li></ul>

Add `Function` to `MetaMod` and return the new <code><a href="#type-meta_mod">meta_mod()</a></code>. If
`Export` is `true`, add `Function` to `MetaMod`'s `exports`.

<a name="compile-1"></a>

### compile/1 ###

<pre><code>
compile(MetaMod::<a href="#type-meta_mod">meta_mod()</a>) -&gt; ok | {error, Error::term()}
</code></pre>
<br />

Equivalent to [`compile(MetaMod, undefined)`](#compile-2).

Compile `MetaMod` and load the resulting BEAM into the emulator.

<a name="compile-2"></a>

### compile/2 ###

<pre><code>
compile(MetaMod, Options) -&gt; ok | {error, Error}
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Options = undefined | [term()]</code></li><li><code>Error = term()</code></li></ul>

Equivalent to [`compile(MetaMod,[report_errprs, report_warnings, return_errors])`](#compile-2).

Compile `MetaMod` and load the resulting BEAM into the emulator.
`Options` is a list of options as described in the `compile` module in the
Erlang documentation.
If an `outdir` is provided, write the `.beam` file to it.

<a name="curry-2"></a>

### curry/2 ###

<pre><code>
curry(Form::<a href="#type-func_form">func_form()</a>, Args::<a href="#type-args">args()</a>) -&gt; <a href="#type-result">result</a>(<a href="#type-func_form">func_form()</a>)
</code></pre>
<br />

Get the curried form for `Form` with `Args`.
Here, "currying" involves replacing one or more of the function's leading
arguments with predefined values.

<a name="curry-4"></a>

### curry/4 ###

<pre><code>
curry(Module, Function, Arity, Args) -&gt; <a href="#type-result">result</a>(<a href="#type-func_form">func_form()</a>)
</code></pre>

<ul class="definitions"><li><code>Module = module() | <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li><li><code>Args = <a href="#type-args">args()</a></code></li></ul>

Curry `Module`:`Function`/`Arity` with the given `Args`.

<a name="curry-5"></a>

### curry/5 ###

<pre><code>
curry(Module, Function, Arity, Args, NewName) -&gt; <a href="#type-result">result</a>(<a href="#type-func_form">func_form()</a>)
</code></pre>

<ul class="definitions"><li><code>Module = module() | <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li><li><code>Args = <a href="#type-args">args()</a></code></li><li><code>NewName = atom()</code></li></ul>

Curry `Module`:`Function`/`Arity`with the given `Args`,
renaming it to `NewName` and return the renamed form.

<a name="curry_add-3"></a>

### curry_add/3 ###

<pre><code>
curry_add(MetaMod, Form, Args) -&gt; <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>)
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Form = <a href="#type-func_form">func_form()</a></code></li><li><code>Args = <a href="#type-args">args()</a></code></li></ul>

Add `Form` curried with `Args` to `MetaMod`.

<a name="curry_add-4"></a>

### curry_add/4 ###

<pre><code>
curry_add(MetaMod, Function, Arity, Args) -&gt; <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>)
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li><li><code>Args = <a href="#type-args">args()</a></code></li></ul>

Add `Function`/`Arity` curried with `Args` to `MetaMod`.

<a name="curry_add-5"></a>

### curry_add/5 ###

<pre><code>
curry_add(MetaMod, Function, Arity, Args, NewName) -&gt; Result
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li><li><code>Args = <a href="#type-args">args()</a></code></li><li><code>NewName = atom()</code></li><li><code>Result = <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>, parse_error)</code></li></ul>

Curry `MetaMod`:`Function`/`Arity` and add it to `MetaMod` as `NewName`.

<a name="curry_add-6"></a>

### curry_add/6 ###

<pre><code>
curry_add(MetaMod, Module, Function, Arity, Args, NewName) -&gt; Result
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Module = module() | <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li><li><code>Args = <a href="#type-args">args()</a></code></li><li><code>NewName = atom()</code></li><li><code>Result = <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>)</code></li></ul>

Curry `Module`:`Function`/`Arity` and add it to `MetaMod` as `NewName`.

<a name="curry_replace-3"></a>

### curry_replace/3 ###

<pre><code>
curry_replace(MetaMod, Form, Args) -&gt; <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>)
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Form = <a href="#type-func_form">func_form()</a></code></li><li><code>Args = <a href="#type-args">args()</a></code></li></ul>

Replace the function represented by `Form` in `MetaMod`
with its curried form.

<a name="curry_replace-4"></a>

### curry_replace/4 ###

<pre><code>
curry_replace(MetaMod, Function, Arity, Args) -&gt; <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>)
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li><li><code>Args = <a href="#type-args">args()</a></code></li></ul>

Replace `Function`/`Arity` in `MetaMod` with its curried form.

<a name="embed_all-2"></a>

### embed_all/2 ###

<pre><code>
embed_all(MetaMod, Values) -&gt; NewMod
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Values = [{Name::atom(), Value::term()}]</code></li><li><code>NewMod = <a href="#type-meta_mod">meta_mod()</a></code></li></ul>

Apply [`embed_args/2`](#embed_args-2) with `Values` to all forms in `MetaMod`.
`exports` for functions whose arities change are preserved.

<a name="embed_args-2"></a>

### embed_args/2 ###

<pre><code>
embed_args(Form, Vals) -&gt; NewForm
</code></pre>

<ul class="definitions"><li><code>Form = <a href="#type-func_form">func_form()</a></code></li><li><code>Vals = [{Name::atom(), Value::term()}]</code></li><li><code>NewForm = <a href="#type-func_form">func_form()</a></code></li></ul>

Replace the arguments of the function represented by `Form`,
where the argument's `Name` matches an element from `Vals`
with the corresponding `Value`.

<a name="embed_args-4"></a>

### embed_args/4 ###

<pre><code>
embed_args(MetaMod, Function, Arity, Values) -&gt; <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>)
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li><li><code>Values = <a href="proplists.md#type-proplist">proplists:proplist()</a></code></li></ul>

Equivalent to [`embed_args(MetaMod, Name, Arity, Values, Name)`](#embed_args-5).

<a name="embed_args-5"></a>

### embed_args/5 ###

<pre><code>
embed_args(MetaMod, Function, Arity, Values, NewName) -&gt; Result
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li><li><code>Values = <a href="proplists.md#type-proplist">proplists:proplist()</a></code></li><li><code>NewName = atom()</code></li><li><code>Result = <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>)</code></li></ul>

Apply [`embed_args/2`](#embed_args-2) to `MetaMod`:`Function`/`Arity` and
add the resulting function to `MetMod`, after renaming it to `NewName`.

__See also:__ [rename/2](#rename-2).

<a name="extend-2"></a>

### extend/2 ###

<pre><code>
extend(Parent, Child) -&gt; NewChildMod
</code></pre>

<ul class="definitions"><li><code>Parent = module() | <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Child = module() | <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>NewChildMod = <a href="#type-meta_mod">meta_mod()</a></code></li></ul>

Add aliases for `Parent`'s functions missing from `Child` to `Child`.
The new functions in `Child` are shallow, i.e. they have the name and arity
of the corresponding functions in `Parent`, but instead of implementing their
logic they call the `Parent` functions.

<a name="extend-3"></a>

### extend/3 ###

<pre><code>
extend(Parent, Child, ArityDiff) -&gt; NewChildMod
</code></pre>

<ul class="definitions"><li><code>Parent = module() | <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Child = module() | <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>ArityDiff = non_neg_integer()</code></li><li><code>NewChildMod = <a href="#type-meta_mod">meta_mod()</a></code></li></ul>

Similar to [`extend/2`](#extend-2), with the addition of `ArityDiff`, which
indicates the difference in arities _Smerl_ should use when figuring
out which functions to generate based on the modules' exports. This is
sometimes useful when calling [`extend/3`](#extend-3) followed by [`embed_all/2`](#embed_all-2).

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
for_file(SrcFilePath, IncludePaths, Macros) -&gt; Result
</code></pre>

<ul class="definitions"><li><code>SrcFilePath = <a href="file.md#type-filename">file:filename()</a></code></li><li><code>IncludePaths = [<a href="file.md#type-filename">file:filename()</a>]</code></li><li><code>Macros = [{module(), atom()}]</code></li><li><code>Result = <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>, invalid_module)</code></li></ul>

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
for_module(ModuleName, IncludePaths, Macros) -&gt; <a href="#type-result">result</a>(meta_mod)
</code></pre>

<ul class="definitions"><li><code>ModuleName = atom() | string()</code></li><li><code>IncludePaths = [string()]</code></li><li><code>Macros = [{atom(), term()}]</code></li></ul>

Create a meta_mod tuple for an existing module. If ModuleName is a
string, it is interpreted as a file name (this is the same as calling
[`for_file/3`](#for_file-3)). If ModuleName is an atom, _Smerl_ attempts to
find its abstract represtation either from its source file or from
its .beam file directly (if it has been compiled with debug_info).
If the abstract representation can't be found, this function returns
an error.

The `IncludePaths` argument is used when `ModuleName` is a file name.

<a name="get_attribute-2"></a>

### get_attribute/2 ###

<pre><code>
get_attribute(MetaMod, Attribute) -&gt; {ok, Value} | error
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Attribute = atom()</code></li><li><code>Value = term()</code></li></ul>

Get the value of `MetaMod`'s `Attribute`.

<a name="get_export_all-1"></a>

### get_export_all/1 ###

<pre><code>
get_export_all(MetaMod::<a href="#type-meta_mod">meta_mod()</a>) -&gt; boolean()
</code></pre>
<br />

Get the `export_all` value for `MetaMod`.

<a name="get_exports-1"></a>

### get_exports/1 ###

<pre><code>
get_exports(MetaMod::<a href="#type-meta_mod">meta_mod()</a>) -&gt; <a href="#type-exports">exports()</a>
</code></pre>
<br />

Return the list of exports in the meta_mod.

<a name="get_forms-1"></a>

### get_forms/1 ###

<pre><code>
get_forms(MetaMod::<a href="#type-meta_mod">meta_mod()</a>) -&gt; <a href="#type-func_forms">func_forms()</a>
</code></pre>
<br />

Return the list of function forms in the meta_mod.

<a name="get_func-3"></a>

### get_func/3 ###

<pre><code>
get_func(MetaMod, Function, Arity) -&gt; <a href="#type-result">result</a>(<a href="#type-func_form">func_form()</a>)
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a> | module()</code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li></ul>

Attempt to get the <code><a href="#type-func_form">func_form()</a></code> for `MetaMod`:`Function`/`Arity`.

<a name="get_module-1"></a>

### get_module/1 ###

<pre><code>
get_module(MetaMod::<a href="#type-meta_mod">meta_mod()</a>) -&gt; module()
</code></pre>
<br />

Return the module name for the meta_mod.

<a name="has_func-3"></a>

### has_func/3 ###

<pre><code>
has_func(MetaMod, Function, Arity) -&gt; boolean()
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li></ul>

Check whether `MetaMod` has a function `Function`/`Arity`.

<a name="new-1"></a>

### new/1 ###

<pre><code>
new(Module::module()) -&gt; <a href="#type-meta_mod">meta_mod()</a>
</code></pre>
<br />

Create a new meta_mod for a module with the given name.

<a name="remove_export-3"></a>

### remove_export/3 ###

<pre><code>
remove_export(MetaMod, Function, Arity) -&gt; NewMod
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li><li><code>NewMod = <a href="#type-meta_mod">meta_mod()</a></code></li></ul>

Remove an export `{Function, Arity}`
from the list of `exports` in `MetaMod`.

<a name="remove_func-3"></a>

### remove_func/3 ###

<pre><code>
remove_func(MetaMod, Function, Arity) -&gt; NewMod
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = atom()</code></li><li><code>Arity = arity()</code></li><li><code>NewMod = <a href="#type-meta_mod">meta_mod()</a></code></li></ul>

Try to remove `Function` from `MetaMod`.
If the function exists, return the new <code><a href="#type-meta_mod">meta_mod()</a></code>.
Otherwise, return `MetaMod`.

<a name="rename-2"></a>

### rename/2 ###

<pre><code>
rename(Form::<a href="#type-func_form">func_form()</a>, NewName::atom()) -&gt; <a href="#type-func_form">func_form()</a>
</code></pre>
<br />

Change the name of the function represented by `Form` to `NewName`.

<a name="replace_func-2"></a>

### replace_func/2 ###

<pre><code>
replace_func(MetaMod, Function) -&gt; <a href="#type-result">result</a>(<a href="#type-meta_mod">meta_mod()</a>)
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Function = string() | <a href="#type-func_form">func_form()</a></code></li></ul>

Replace an existing function with a new one. If a matching function
doesn't exist, add `Function` to `MetaMod`. This is tantamount to calling
[`remove_func/3`](#remove_func-3) followed by [`add_func/2`](#add_func-2).

<a name="set_export_all-2"></a>

### set_export_all/2 ###

<pre><code>
set_export_all(MetaMod, Value) -&gt; NewMod
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Value = boolean()</code></li><li><code>NewMod = <a href="#type-meta_mod">meta_mod()</a></code></li></ul>

Set the `export_all` value for `MetaMod`.

<a name="set_exports-2"></a>

### set_exports/2 ###

<pre><code>
set_exports(MetaMod, Exports) -&gt; NewMod
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Exports = <a href="#type-exports">exports()</a></code></li><li><code>NewMod = <a href="#type-meta_mod">meta_mod()</a></code></li></ul>

Set the `MetaMod`'s export list to `Exports`.

<a name="set_forms-2"></a>

### set_forms/2 ###

<pre><code>
set_forms(MetaMod, Forms) -&gt; NewMod
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Forms = <a href="#type-func_forms">func_forms()</a></code></li><li><code>NewMod = <a href="#type-meta_mod">meta_mod()</a></code></li></ul>

<a name="set_module-2"></a>

### set_module/2 ###

<pre><code>
set_module(MetaMod, NewName) -&gt; NewMod
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>NewName = module()</code></li><li><code>NewMod = <a href="#type-meta_mod">meta_mod()</a></code></li></ul>

Set the meta_mod's module name.

<a name="to_src-1"></a>

### to_src/1 ###

<pre><code>
to_src(MetaMod::<a href="#type-meta_mod">meta_mod()</a>) -&gt; Source::string()
</code></pre>
<br />

Return the pretty-printed source code for `MetaMod`.

<a name="to_src-2"></a>

### to_src/2 ###

<pre><code>
to_src(MetaMod, Filename) -&gt; ok | {error, Error}
</code></pre>

<ul class="definitions"><li><code>MetaMod = <a href="#type-meta_mod">meta_mod()</a></code></li><li><code>Filename = <a href="file.md#type-filename">file:filename()</a></code></li><li><code>Error = term()</code></li></ul>

Equivalent to [`file:write_file(Filename, to_src(MetaMod))`](file.md#write_file-2).

