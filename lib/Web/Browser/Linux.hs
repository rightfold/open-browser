module Web.Browser.Linux
( openBrowserLinux
) where

import System.Exit (ExitCode(..))
import System.Process (rawSystem)

openBrowserLinux :: String -> IO Bool
openBrowserLinux url = exitCodeToBool `fmap` rawSystem executable argv
    where (executable, argv) = ("xdg-open", [url])
          exitCodeToBool ExitSuccess     = True
          exitCodeToBool (ExitFailure _) = False
