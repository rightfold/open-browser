module Web.Browser.Windows
( openBrowserWindows
) where

import System.Directory (findExecutable)
import System.Exit (ExitCode(..))
import System.Process (system)

openBrowserWindows :: String -> IO Bool
openBrowserWindows url = do
  mbCygstart <- findExecutable "cygstart"
  case mbCygstart of
       Just cygstart -> openBrowserWith cygstart url
       Nothing       -> openBrowserWith "start" url

-- We can't use rawSystem on Windows, since that doesn't pick up the "start"
-- shell built-in.
openBrowserWith :: FilePath -> String -> IO Bool
openBrowserWith cmd url = exitCodeToBool `fmap` system (cmd ++ " " ++ url)
    where exitCodeToBool ExitSuccess     = True
          exitCodeToBool (ExitFailure _) = False