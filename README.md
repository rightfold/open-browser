# open-browser
[![Hackage Version](https://img.shields.io/hackage/v/open-browser.svg)](https://hackage.haskell.org/package/open-browser)
[![Hackage Deps](https://img.shields.io/hackage-deps/v/open-browser.svg)](http://packdeps.haskellers.com/feed?needle=open-browser)
- - -
Haskell package to open a web browser. [See the haddock documentation for more
information.](http://hackage.haskell.org/package/open-browser)

## Usage
```haskell
module Main
( main
) where

import Web.Browser (openBrowser)

main :: IO ()
main = openBrowser "http://haskell.org/" >>= print
```

## License
This code is published under the BSD3 license.
