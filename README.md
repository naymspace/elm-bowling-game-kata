# The Bowling Game Kata in elm

This is an adaption of [Uncle Bob's Bowling Game Kata](http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata).

## Doing The Kata

* Familiarize with the [scoring of bowling](https://en.wikipedia.org/wiki/Ten-pin_bowling#Scoring).
* Make `elm test` pass by implementing `Game.score` to pass the test in `src/Game.elm`.
* Uncomment the next scoring-test in `tests/GameTests.elm`.
* Repeat

## Running the tests

Assuming you already installed [node.js](https://nodejs.org/en/download/package-manager/) and [npm](http://blog.npmjs.org/post/85484771375/how-to-install-npm) you have to install `elm` and `elm-test`:

```
git clone https://github.com/pierrebeitz/elm-bowling-game.git
cd elm-bowling-game

# install prerequisites. depending on your setup, you may want to use `sudo`.
npm install -g elm elm-test

# run the tests
elm-test
```

## Afterwards

Whenever you have a solution, please do not hesitate to make a PR. It will not be merged but may be an inspiration for the fellow elmish.  
You also might want to have a look at my solution by checking out `solution1`.
