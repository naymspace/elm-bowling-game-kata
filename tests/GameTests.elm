module GameTests exposing (all)

import Expect
import Fuzz exposing (Fuzzer, intRange, list)
import Game exposing (Game, Score, score)
import List exposing (repeat)
import Random.Pcg as Random
import Shrink
import Test exposing (Test, describe, fuzz, test)


all : Test
all =
    let
        strike n =
            List.repeat n 10

        toTest ( expectedScore, game ) =
            test ("Scoring " ++ toString expectedScore)
                (always <| Expect.equal expectedScore (score game))
    in
        describe "Game.score" <|
            List.map toTest
                [ ( 0, repeat 20 0 )
                , ( 20, repeat 20 1 )
                , ( 300, strike 12 )
                , ( 269, 8 :: 1 :: 9 :: 1 :: strike 10 )
                , ( 290, strike 9 ++ [ 10, 10, 0 ] )
                , ( 285, strike 9 ++ [ 10, 5, 5 ] )
                , ( 280, strike 9 ++ [ 10, 0, 10 ] )
                , ( 270, strike 9 ++ [ 10, 0, 0 ] )
                , ( 267, strike 9 ++ [ 9, 0 ] )
                , ( 274, strike 9 ++ [ 9, 1, 5 ] )
                ]
