-module(guards).
-export([old_enough/1]).

old_enough(X) when X >= 16, X <= 104 -> true;
old_enough(_) -> false.

wrong_age(X) when X < 16; X > 104 -> true;
wrong_age(_) -> false.

%%ここで、whenの条件を','で区切ることは、「andalso」を、';'で区切ることは「orelse」を意味する

%%ガードの欠点は、副作用を理由にユーザ定義の関数を受け入れないこと


