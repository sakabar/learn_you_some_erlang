-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().

increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H-1|increment(T)].

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

a() ->
  Secret = "pony",
  fun() -> Secret end.

b(F) ->
  "a/0's password is " ++ F().

%% Only keep even numbers.
even(L) -> lists:reverse(even(L, [])).
even([], Acc) -> Acc;
even([H|T], Acc) when H rem 2 == 0 ->
  even(T, [H|Acc]);
even([_|T], Acc) -> even(T, Acc).


%%Only keep man older than 60.
old_men(L) -> lists:reverse(old_men(L, [])).
old_men([Person = {nale, Age} | People], Acc) when Age > 60 ->
  old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
  old_men(People, Acc).

filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).
filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
    true  -> filter(Pred, T, [H|Acc]);
    false -> filter(Pred, T, Acc)
  end.

%% Find the maximum of a list.
max([H|T]) -> max2(T, H).

max2([], Max) -> Max;
max2([H|T], Max) when H > Max -> max2(T, H);
max2([_|T], Max) -> max2(T, Max).

%% Find the minimum of a list.
min([H|T]) -> min2(T, H).

min2([], Min) -> Min;
min2([H|T], Min) when H < Min -> min(T, H);
min2([H|T], Min) -> min2(T, Min).

%% Find the sum of all the elements of a list.
sum(L) -> sum(L, 0).

sum([], Sum) -> Sum;
sum([H|T], Sum) -> sum(T, H+Sum).

fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H, Start), T).

reverse(L) ->
  fold(fun(X, Acc) -> [X|Acc] end, [], L).

map2(F, L) ->
  reverse(fold(fun(X,Acc) -> [F(X)|Acc] end, [], L)).

filter2(Pred, L) ->
  F = fun(X, Acc) ->
        case Pred(X) of
          true  -> [X|Acc];
          false -> Acc
        end
      end,
  reverse(fold(F, [], L)).
