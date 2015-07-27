module Network.Browser
( openBrowser
) where

import Data.List (isInfixOf)
import Network.Browser.Linux (openBrowserLinux)
import Network.Browser.OSX (openBrowserOSX)
import System.Info (os)

-- |'openBrowser' opens a URL in the user's preferred web browser. Returns
-- whether or not the operation succeeded.
openBrowser :: String -> IO Bool
openBrowser
    | "linux"  `isInfixOf` os = openBrowserLinux
    | "darwin" `isInfixOf` os = openBrowserOSX
    | otherwise               = error "unsupported platform"
