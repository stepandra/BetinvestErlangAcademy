-module(bs03).
-export([split/2]).



split(X, Cs) ->
	split(Cs, X, 0, []).

split(Cs, X, I, Acc) ->
    case X of
        <<This:I/binary, Cr, T/binary>> ->
            case lists:member(Cr, Cs) of
                false ->
                    split(Cs, X, I+1, Acc);
                true ->
                    split(Cs, T, 0, [This|Acc])
            end;
        <<This:I/binary>> ->
            lists:reverse(Acc, [This])
    end.
