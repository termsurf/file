
%%----------------------------------------------------------------------
%% qsort/1
%%
%% Tail recursive quicksort
%%----------------------------------------------------------------------
qsort([]) ->
    [];
qsort([H | _] = List) ->
    {L, E, G} = partition(H, List, {[], [], []}),
    qsort(L) ++ E ++ qsort(G).

partition(_, [], {L, E, G}) ->
    {L, E, G};
partition(Pivot, [H | List], {L, E, G}) when Pivot > H ->
    partition(Pivot, List, {[H | L], E, G});
partition(Pivot, [H | List], {L, E, G}) when Pivot < H ->
    partition(Pivot, List, {L, E, [H | G]});
partition(Pivot, [H | List], {L, E, G}) when Pivot == H ->
    partition(Pivot, List, {L, [H | E], G}).
