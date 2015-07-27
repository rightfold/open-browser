module Web.Browser.OSX
( openBrowserOSX
) where

import System.Exit (ExitCode(..))
import System.Process (rawSystem)

openBrowserOSX :: String -> IO Bool
openBrowserOSX url = exitCodeToBool `fmap` rawSystem executable argv
    where (executable, argv) = ("open", [url])
          exitCodeToBool ExitSuccess     = True
          exitCodeToBool (ExitFailure _) = False
