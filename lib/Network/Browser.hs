module Network.Browser
( openBrowser
) where

import Network.Browser.OSX (openBrowserOSX)

-- |'openBrowser' opens a URL in the user's preferred web browser. Returns
-- whether or not the operation succeeded.
openBrowser :: String -> IO Bool
openBrowser = openBrowserOSX
