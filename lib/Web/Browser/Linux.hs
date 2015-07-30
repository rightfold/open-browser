module Web.Browser.Linux
( openBrowserLinux
) where

import System.Exit (ExitCode(..))
import System.Process (rawSystem)

openBrowserLinux :: String -> IO Bool
openBrowserLinux url = exitCodeToBool `fmap` rawSystem executable argv
    where (executable, argv) = ("sh", ["-c", "xdg-open \"$0\" 2>&1 > /dev/null", url])
          exitCodeToBool ExitSuccess     = True
          exitCodeToBool (ExitFailure _) = False
