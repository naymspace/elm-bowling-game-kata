port module Main exposing (..)

import GameTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit GameTests.all


port emit : ( String, Value ) -> Cmd msg
