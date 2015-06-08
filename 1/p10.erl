-module(p10).
-export([encode/1]).


encode([])->
	[];
encode([{K,Item}|{Item|{}}])->
	[{K+1,Item}];
encode([{K,Item}|{Item|T}])->
	encode([{K+1,Item}|T]);
encode([{K,Item1}|{Item2|{}}])->
	[{K,Item1}|{1,Item2}];
encode([{K,Item1}|{Item2|T}])->
	[{K,Item1}|encode([[1,Item2]|T])];
encode([H|T])->
	encode([{1,H}|T]).
