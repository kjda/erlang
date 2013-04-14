-module(collection).
-export([map/2]).
-export([sqrt/1]).
-export([reduce/2]).
-export([avg/1]).
-export([sum/1]).
-export([has_one/2]).
-export([filter/2]).
-export([without/2]).

% map([2, 4], fun(X) -> X*2 end).  ---> [4,8]
map([], _) -> [];
map([H|T], F) -> [F(H)|map(T, F)].

% reduce([2,4], func(X) -> X end).  ---> 6
reduce([], _) -> 0;
reduce([H|T], F) -> F(H) + reduce(T, F).

% sqrt([2,4,6])
sqrt(LIST) -> map(LIST, fun(V) -> math:sqrt(V) end).

%sum([2,3]). -----> 5
sum(LIST) -> reduce(LIST, fun(X) ->X end).

%avg([2,4,6]). ----> 4
avg(LIST) -> reduce(LIST, fun(X) -> X end) / length(LIST).

% has_one([2,4,6], 4) ---> true
has_one([], _) -> false;
has_one([H|_], H) -> true;
has_one([_|T], V) -> has_one(T, V).

% filter([2,3,4,5], fun(X) X rem 2 == 0 end). ---> [2,4]
filter([], _) -> [];
filter([H|T], F) -> filtr2(H, T, F, F(H)).
filtr2(H, T, F, FLAG) ->
  if 
  FLAG -> [H|filter(T, F)];
  true -> filter(T,F)
  end.

%without([2,3,3,4]).  ----> [2,4]
without([], _) -> [];
without([H|T], H) -> without(T, H);
without([H|T], V) -> [H|without(T,V)].


