module Network.Browser
( openBrowser
) where

import System.Exit (ExitCode(..))
import System.Process (rawSystem)

osxCommand :: String -> (String, [String])
osxCommand url = ("/usr/bin/osascript", argv)
    where argv = ["-e", appleScript, url]
          appleScript = "on run argv\n\
                        \    open location (item 1 of argv)\n\
                        \end run\n"

osx :: String -> IO Bool
osx url = exitCodeToBool `fmap` rawSystem executable argv
    where (executable, argv) = osxCommand url
          exitCodeToBool ExitSuccess     = True
          exitCodeToBool (ExitFailure _) = False

-- |'openBrowser' opens a URL in the user's preferred web browser. Returns
-- whether or not the operation succeeded.
openBrowser :: String -> IO Bool
openBrowser = osx
