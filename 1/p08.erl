-module(p08).
-export([compress/1]).


compress([])->
	[];
<<<<<<< HEAD:1/p08.erl
<<<<<<< HEAD:1/p08.erl

compress([X|[X|T]])->
	compress([X|T]);

compress([X|[H|T]])->
	[X|compress([H|T])];

=======
=======
>>>>>>> origin/master:p08.erl
	
compress([X|[X|T]])->
	compress([X|T]);
	
compress([X|[H|T]])->
	[X|compress([H|T])];
	
<<<<<<< HEAD:1/p08.erl
>>>>>>> origin/master:p08.erl
=======
>>>>>>> origin/master:p08.erl
compress([X|[]])->
	[X].


