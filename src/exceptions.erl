-module(exceptions).
-compile(export_all).

throws(F) ->
  try F() of
    _ -> ok
  catch
    Throw -> {throw, caught, Throw}
  end.

errors(F) ->
  try F() of
    _ -> ok
  catch
    error:Error -> {error, caught, Error}
  end.

exits(F) ->
  try F() of
    _ -> ok
  catch
    exit:Exit -> {exit, caught, Exit}
  end.

sword(1) -> throw(slice);
sword(2) -> erlang:error(cut_arm);
sword(3) -> exit(cut_leg);
sword(4) -> throw(punch);
sword(5) -> exit(cross_bridge).


%% is_function(f, n)
%% fがn-aryの関数かどうか
black_knight(Attack) when is_function(Attack, 0) ->
  try Attack() of
    _ -> "None shall pass."
  catch
    throw:slice -> "It is but a scratch.";
    error:cut_arm -> "I've had worse.";
    exit:cut_leg -> "Come on you pansy!";
    _:_ -> "Just a flesh wound."
  end.

talk() -> "blah blah".

whoa() ->
  try
    talk(),
    _Knight = "None shall Pass!",
    _Doubles = [N*2 || N <- lists:seq(1,100)],
    throw(up),
    _WillReturnThis = tequila
  of
    tequila -> "hey this worked!"
  catch
    Exception:Reason -> {caught, Exception, Reason}
  end.

im_impressed() ->
  try
    talk(),
    _Knight = "None shall Pass!",
    _Doubles = [N*2 || N <- lists:seq(1,100)],
    throw(up),
    _WillReturnThis = tequila
% of節はなくてもいい、らしい
% of
%   tequila -> "hey this worked!"
  catch
    Exception:Reason -> {caught, Exception, Reason}
  end.

catcher(X,Y) ->
  case catch X/Y of
    {'EXIT', {badarith,_}} -> "uh oh";
    N -> N
  end.

%%looks for a given value 'Val' in the tree
%% has_value(_, {node, 'nil'}) ->
%%   false;
%% has_value(Val, {node, {_,Val,_,_}}) ->
%%   true;
%% has_value(Val, {node, {_,_,Left,Right}}) ->
%%   case has_value(Val, Left) of
%%     true -> true;
%%     false -> has_value(Val, Right)
%%   end.


has_value(Val, Tree) ->
  try has_value1(Val, Tree) of
    false -> false
  catch
    true -> true
  end.

has_value1(_, {node, 'nil'}) ->
  false;
has_value1(Val, {node, {_, Val, _, _}}) ->
  throw(true);
has_value1(Val, {node, {_, _, Left, Right}}) ->
  has_value1(Val, Left),
  has_value1(Val, Right).
