-module(functions).
-export([greet/2, head/1, second/1, valid_time/1]).

%%functionから始まる宣言にはどんな意味が?
%%って、これ、Erlangじゃない言語での話っぽいっすね
%% function greet(Gender, Name)
%%   if Gender == male then
%%     print("Hello, Mr. %s!", Name)
%%   else if Gender == female then
%%     print("Hello, Mrs. %s!", Name)
%%   else
%%     print("Hello, %s!", Name)
%%   end

greet(male, Name) ->
  io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
  io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
  io:format("Hello, ~s!", [Name]).

head([H | _]) -> H.
second([_, X| _]) -> X.

%% {}はタプル
%% 関数のヘッド(関数名と変数のリスト)の中で、'='演算子を使うことで、タプルの中身とタプル全体をパターンマッチしている
%% この定義では、{{A,B,C}, {D,E,F}}の形をしているタプルをなんでも受け付けてしまう
valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
  io:format("THe Date tuple (~p) says today is : ~p/~p/~p,~n", [Date,Y,M,D]),
  io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S]);
valid_time(_) ->
  io:format("Stoop feeding me wrong data!~n").


