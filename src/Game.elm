module Game exposing (Game, Score, score)


type alias Game =
    List Int


type alias Score =
    Int


score : Game -> Score
score =
    reduce >> List.take 10 >> List.sum


scoreFrame : Game -> ( Score, Game )
scoreFrame rolls =
    case rolls of
        x1 :: x2 :: x3 :: xs ->
            if x1 == 10 then
                ( x1 + x2 + x3, x2 :: x3 :: xs )
            else if x1 + x2 == 10 then
                ( x1 + x2 + x3, x3 :: xs )
            else
                ( x1 + x2, x3 :: xs )

        {- last two throws of a normal game -}
        [ x1, x2 ] ->
            ( x1 + x2, [] )

        [ x ] ->
            ( x, [] )

        [] ->
            ( 0, [] )


reduce : Game -> List Score
reduce rolls =
    let
        ( frameScore, remainingRolls ) =
            scoreFrame rolls
    in
        if rolls == [] then
            []
        else
            frameScore :: reduce remainingRolls
