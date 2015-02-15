-module(what_the_if).
-export([heh_fine/0, oh_god/1, help_me/1]).

heh_fine() ->
  if 1 =:= 1 ->
    works
  end,
  if 1 =:= 2; 1 =:= 1 ->
    works
  end,
  if 1 =:= 2, 1 =:= 1 -> %%1 =:= 2はfalseなので、この部分がマッチしない
    fails
  end.

%% Warningは出るけど、コンパイルはできる

%% ガードやパターンマッチのときは';'でつないでいたのに、ここに来て突然の','
%% end, とend; の違いは?

oh_god(N) ->
  if N =:= 2 -> might_succeed;
  true -> always_does %% This is Erlang's if's 'else!'
end.

%% Note that this one would be better as a pattern match in function heads
%% I'm doing it this way for the sake of the example
help_me(Animal) ->
  Talk = if Animal == cat  -> "meow";
            Animal == beef -> "mooo";
            Animal == dog  -> "bark";
            Animal == tree -> "bark";
            true           -> "fgdafgna"
         end,
  {Animal, "says " ++ Talk ++ "!"}.
