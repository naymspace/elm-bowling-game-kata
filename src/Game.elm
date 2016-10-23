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
        -- strike
        10 :: ((x2 :: x3 :: xs) as remainingRolls) ->
            ( 10 + x2 + x3, remainingRolls )

        -- spare or open frame
        x1 :: x2 :: ((x3 :: xs) as remainingRolls) ->
            let
                bonus =
                    if x1 + x2 == 10 then
                        x3
                    else
                        0
            in
                ( x1 + x2 + bonus, remainingRolls )

        -- the last frame
        xs ->
            ( List.sum xs, [] )


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
