-module(p09).
-export([pack/1]).


pack([])->
	[];

pack([X|[]])->
	[X];

pack([[X|T1]|[X|T2]])->
	pack([[X|[X|T1]]|T2]);

pack([[H|T1]|[H1|[]]])->
	[[H|T1],[H1]];

pack([[H|T1]|[H1|T2]])->
	[[H|T1]|pack([H1|T2])];

pack([X|[X|T]])->
	pack([[X,X]|T]);

pack([H|[H1|T]])->
	[[H]|pack([H1|T])].
