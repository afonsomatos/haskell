# ![haskell-logo](http://i.imgur.com/ABp849o.png) Learning Haskell
<img src="http://g.recordit.co/Lcmhs72JHk.gif" width="50%" align="right">

### Description

This repo includes books, exercises, experiments and projects that I did/am
doing while learning Haskell. I have also put together a list of resources that
have had a positive influence on my journey. I hope this helps
anyone who wants to learn Haskell.

--

## 1. Resources

There a lot, a *lot* of bad tutorials / books on Haskell. Some of them don't
cover the essentials of the language and the most fundamental libraries and
others are very outdated. This list contains useful resources for any level
learner.

### 1.1 Books

[Learn You a Haskell for Great good (LYAH)]
(http://learnyouahaskell.com/chapters)

- Good book that lacks exercises. Make sure you do CIS194 and H-99
while reading LYAH.

[Real World Haskell (RWH)](http://book.realworldhaskell.org/read/)

- Outdated book. Only read this if you have more than basic understanding of
Haskell. While there are good chapters (the first 4 are best), if you decide to
read further, you'll stumble across code that is no longer valid and won't
compile. Also, the JSON library chapter can be very boring.

### 1.2 Courses / Exercises

[Ninety-Nine Haskell Problems]
(https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems)

- Do as much of these as you can. Even better, solve this problems whil
learning LYAH or RWH.

[CIS 194 course (Spring 3013)](http://www.seas.upenn.edu/~cis194/spring13/)

- This is the most recommended course out there. The lecture notes are small and
the exercises are some of the best. I recommend to do this course with a mentor.

[20 Intermediate Haskell Exercises]
(http://blog.tmorris.net/posts/20-intermediate-haskell-exercises/)

- These are some very good exercises to do once you think you have figured out
typeclasses. Basically, you'll have to write functions based on their types.

[Project Euler](https://projecteuler.net/)

- Do a lot of these too. As a beginner, you'll probably be capable of solving
the first 10. If you have already solved these in another language, try
writing them without looking at your previous work.

## 2. Projects

While learning Haskell, you might get tired of solving exercises or just want
to write some real stuff. For this case, I have put together a list of simple
projects. While they're simple, you can improve on them while you learn.

### 2.1 TicTacToe

- Create a simple 3x3 TicTacToe

    Try to implement the game in Haskell. After you have made it, you can ask
    someone to review it in the [SO Haskell Chat Room]
    (http://chat.stackoverflow.com/rooms/83002/haskell-room) or in [Code Review]
    (http://codereview.stackexchange.com/).

- Implement the game in a more abstract way.

    Instead of a 3x3 grid, why not allow the user to choose the size of the
    board? What about adding capability for more than 2 players playing?
    Have you already added a function to print the board?

### 2.2 Connect Four

- Make the [Connect Four](https://en.wikipedia.org/wiki/Connect_Four) game in
Haskell!

    This game is very similar to TicTacToe, so you'll find it easier to
    do one after another. Each time you learn a new function or library, try
    to apply your knowledge by re-designing certain parts of your code.

## Documentation / Tools

There are some pretty awesome stuff you should check when learning Haskell.

[GHC Documentation](https://downloads.haskell.org/~ghc/latest/docs/html/) - A
must read (especially the ghci chapter).

[Hoogle](https://www.haskell.org/hoogle/) - One of the most pleasant tools if
you want more information about a certain function, class, etc.

[Cabal](https://www.haskell.org/cabal/users-guide/) - A tool to create packages.
You'll probably use this along with Hackage. The user-guide is excellent for
learning more about it.

[Hspec](http://hspec.github.io/) - A testing framework for Haskell. I recommend
checking this out after writing some bigger Haskell programs.

[Hackage](hackage.haskell.org) - This is the most used package archieve among
Haskell programmers. A little side note: Don't upload test packages, because
they can't be deleted. For testing, use [Package candidates]
(https://hackage.haskell.org/packages/candidates/upload).

## Get help

If you stumble across any kind of problem, try to spend at least 10 minutes
trying to figure it out. If not, you can ask your question in this list of
websites.

- [SO Haskell Chat Room](http://chat.stackoverflow.com/rooms/83002/haskell-room)

- [IRC Chat](https://webchat.freenode.net/)
(channel #haskell and #haskell-beginners)

- [StackOverflow](http://stackoverflow.com)

## Little side notes

- I am currently learning Haskell. I am no expert. That's why the solutions
may not be the best. If you find better solutions, please create a pull
request or open an issue.

- This list is not permanent, I'll be updating things as the time goes on.

- Do you know about any other good resources or exercises? Open an issue and
we'll discuss your suggestions.