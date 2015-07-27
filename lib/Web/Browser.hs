module Web.Browser
( openBrowser
) where

import Data.List (isInfixOf)
import System.Info (os)
import Web.Browser.Linux (openBrowserLinux)
import Web.Browser.OSX (openBrowserOSX)

-- |'openBrowser' opens a URL in the user's preferred web browser. Returns
-- whether or not the operation succeeded.
openBrowser :: String -> IO Bool
openBrowser
    | "linux"  `isInfixOf` os = openBrowserLinux
    | "darwin" `isInfixOf` os = openBrowserOSX
    | otherwise               = error "unsupported platform"
