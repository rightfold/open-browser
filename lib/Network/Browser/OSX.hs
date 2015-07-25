module Network.Browser.OSX
( openBrowserOSX
) where

import System.Exit (ExitCode(..))
import System.Process (rawSystem)

osxCommand :: String -> (String, [String])
osxCommand url = ("/usr/bin/osascript", argv)
    where argv = ["-e", appleScript, url]
          appleScript = "on run argv\n\
                        \    open location (item 1 of argv)\n\
                        \end run\n"

openBrowserOSX :: String -> IO Bool
openBrowserOSX url = exitCodeToBool `fmap` rawSystem executable argv
    where (executable, argv) = osxCommand url
          exitCodeToBool ExitSuccess     = True
          exitCodeToBool (ExitFailure _) = False
