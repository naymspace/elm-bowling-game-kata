module Game exposing (Game, Score, score)


type alias Game =
    List Int


type alias Score =
    Int


score : Game -> Score
score game =
    -1
