module Main
( main
) where

import Network.Browser (openBrowser)

main :: IO ()
main = openBrowser "http://haskell.org/" >>= print
