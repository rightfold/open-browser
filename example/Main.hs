module Main
( main
) where

import Web.Browser (openBrowser)

main :: IO ()
main = openBrowser "http://haskell.org/" >>= print
