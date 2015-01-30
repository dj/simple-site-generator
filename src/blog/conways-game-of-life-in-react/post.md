# Conway's Game of Life in React
<p class='date'>30 Jan 2014</p>
<a href='/react_game_of_life'><img src='/img/game-of-life.png'/></a>
<p class='caption'>Conway's Game of Life</p>

Here's a thing I made to learn React JS. It was my first take at implementing Conway's Game of Life, which I did without reading any other implementations. I haven't worked on it for months, but I'm trying to get more things online instead of just deleting them.

When I stopped working on it, I was in the middle of trying to turn it into some kind of game, where you tried to get the cells to 'touch' every part of the board. You can click on the board to make a cell alive for the next turn. Press space to pause the game, press s to step through the game one turn at a time and press r to restart the game with a random board.

If I were to refactor this, I would change the state to be a representation of the game state, instead of creating complicated cell object. Particularly shameful is how I'm calculating neighbour cells.

I haven't worked with React since, and a lot has happened. While I found their lack of documentation a little frustrating, I really enjoyed the way React enforces uniderectional data flow.

Here are some links if you're interested in learning what the big deal about React is:
+ [My Game of Life in React](/react_game_of_life "Game of Life")
+ [Pete Hunt: React: Rethinking best practices -- JSConf EU 2013 ](https://www.youtube.com/watch?v=DgVS-zXgMTk "Pete Hunt: React - Rethinking Best Practices (updated) - JSConf.Asia 2013")
+ [React.js Conf 2015 Keynote 2 - A Deep Dive into React Native](https://www.youtube.com/watch?v=7rDsRXj9-cU "React.js Conf 2015 Keynote 2 - A Deep Dive into React Native ")
