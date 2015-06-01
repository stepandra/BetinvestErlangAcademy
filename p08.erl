-module(p08).
-export([compress/1]).

compress([])->
	[];
compress([X|[X|T]])->
	compress([X|T]);
compress([X|[H|T]])->
	[X|compress([H|T])];
compress([X|[]])->
	[X].


