-module(p07).
-export([flatten/1]).

flatten([])->
	[];
flatten([H|T])->
	flatten(H)++flatten(T);
flatten(H)->
	[H].

