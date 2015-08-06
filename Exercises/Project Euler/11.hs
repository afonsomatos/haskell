checkCords :: Int -> [(Int, Int)] -> Bool
checkCords size = all valid
    where valid (x, y) = x >= 0 && y >= 0 &&
                         x < size && y < size

possible :: [[Int]] -> [Int]
possible grid = do

    let size = length grid - 1

    row <- [0..size]
    col <- [0..size]

    let getNums xs = if checkCords size xs
                         then map (\(x, y) -> grid !! x !! y) xs
                         else []

        genList (offX, offY) = [(row + n * offX, col + n * offY) | n <- [0..3]]

        results = map (product . getNums . genList) [(0, 1), (1, 0), (1, 1), (1, -1)]

    return (maximum results)

main :: IO ()
main = readFile "11-grid" >>= output where
    output = print . maximum . possible . map (map read . words) . lines