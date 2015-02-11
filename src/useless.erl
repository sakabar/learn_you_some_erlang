-module(useless).
-export([add/2, hello/0, greet_and_add_two/1]).
-define(HOUR, 3600). % in seconds

add(A, B) ->
  A + B.

%% Shows greetings
%% '%' is comment
%%io:format/1 is the standard function used to output text.
hello() ->
  io:format("hello, world!~n"). % ~n は改行(\n)

greet_and_add_two(X) ->
  hello(),
  add(X, 2).

%% 日本語もOK
%% aii() ->
%%   io:format("あいい").


%% マクロは先頭以外でも定義できる
%% しかし、定義した行より前で使うことができない
%% -define(HOUR, 3600). % in seconds
