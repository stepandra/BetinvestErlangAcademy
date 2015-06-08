-module(bs01).
-export([first_word/1]).


first_word(P)->
    first_word(P, <<>>).

first_word(<<$\s, _/binary>>, Acc)->
    Acc;

first_word(<<H, Other/binary>>, Acc)->
    first_word(Other, <<Acc/binary, H>>);

first_word(<<>>, Acc)->
    Acc.