-module(p04).
-export([len/1]).


len([])->
	0;
	
len(L)->
	len(L,0).

len([],Length)->
	Length;

len([_|T],Length)->
	len(T,Length+1).
