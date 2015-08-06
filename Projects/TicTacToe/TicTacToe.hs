module Main where

import Data.List (transpose)
import Data.Foldable (asum)
import System.IO (hSetBuffering, stdout, BufferMode (NoBuffering))

import Utils (surround, nth, isInt)

data Tile = O | X | Empty deriving Eq

instance Show Tile where
    show Empty = " "
    show O     = "O"
    show X     = "X"

-- ======================
-- Board Helper Functions
-- ======================
type Board = [[ Tile ]]

showBoard :: Board -> String
showBoard xss = unlines
             . surround vtx
             . map (concat . surround mid . map show)
             $ xss

    where mid = "|"
          vtx = surround '+' $ replicate (length xss) '-'                   

whoWon :: Board -> Maybe Player
whoWon xss = asum
           . map winner
           $ diag : anti : cols ++ xss

    where cols = transpose xss
          diag = zipWith (!!) xss           [0..]
          anti = zipWith (!!) (reverse xss) [0..]

          winner []     = Nothing
          winner (x:xs) = if all (==x) xs && x /= Empty
                              then Just (toPlayer x)
                              else Nothing

getCoords :: Int -> Board -> (Int, Int)
getCoords n = divMod (n - 1) . length

fillTile :: Board -> Int -> Tile -> Board
fillTile xss n tile = nth row (nth col (const tile)) xss
    
    where (row, col) = getCoords n xss

isOver :: Board -> Bool
isOver = all (notElem Empty)

-- ========================
-- Player related functions
-- ========================
data Player = Player1 | Player2

instance Show Player where
    show Player1 = "1st Player"
    show Player2 = "2nd Player"

toPlayer :: Tile -> Player
toPlayer X = Player1
toPlayer _ = Player2

fromPlayer :: Player -> Tile
fromPlayer Player1 = X
fromPlayer Player2 = O

changePlayer :: Player -> Player
changePlayer Player1 = Player2
changePlayer Player2 = Player1

-- ===========================
-- Game and UI Logic Functions
-- ===========================
data ValidationError = OutOfRange | AlreadyFilled | NotInteger

instance Show ValidationError where
    show NotInteger    = "Only integers allowed"
    show OutOfRange    = "Number is not in range"
    show AlreadyFilled = "That tile is already filled" 

validateNumber :: Board -> String -> Either ValidationError Int
validateNumber xss x
    | not $ isInt x              = Left NotInteger
    | num < 1 || num > tiles     = Left OutOfRange
    | xss !! row !! col /= Empty = Left AlreadyFilled
    | otherwise                  = Right num

    where num        = read x
          tiles      = length (concat xss)
          (row, col) = getCoords num xss

getNumber :: Board -> IO Int
getNumber xss = do

    input <- getLine

    case validateNumber xss input of

        Left  err -> putStrLn ("Invalid: " ++ show err) >> getNumber xss
        Right num -> return num

nextPlay :: Player -> Board -> IO ()
nextPlay player board = do

    putStrLn $ "Your turn, " ++ show player ++ "!"

    putStr $ "Tile number [1.." ++ show (length . concat $ board) ++ "]: "
    num <- getNumber board

    let tile = fromPlayer   player
        next = changePlayer player
    
    gameStep next (fillTile board num tile)

gameStep :: Player -> Board -> IO ()
gameStep player board = do

    putStrLn $ showBoard board

    case whoWon board of

        Just winner -> putStrLn $ show winner ++ " won!"

        Nothing | isOver board -> putStrLn "Game ended in a draw"
                | otherwise    -> nextPlay player board

startBoard :: Int -> Board
startBoard x = replicate x (replicate x Empty)

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    gameStep Player1 (startBoard 3)