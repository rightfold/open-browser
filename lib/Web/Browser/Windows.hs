{-# LANGUAGE ForeignFunctionInterface #-}
module Web.Browser.Windows
( openBrowserWindows
) where

import System.Win32.Types (INT, HANDLE, HINSTANCE, LPCTSTR,
                           handleToWord, nullPtr, withTString)

openBrowserWindows :: String -> IO Bool
openBrowserWindows url =
    withTString "open" $ \openStr ->
        withTString url $ \urlStr ->
            exitCodeToBool `fmap` c_ShellExecute nullPtr
                                                 openStr
                                                 urlStr
                                                 nullPtr
                                                 nullPtr
                                                 1
  where exitCodeToBool hinst | handleToWord hinst > 32 = True
                             | otherwise               = False

-- https://msdn.microsoft.com/en-us/library/windows/desktop/bb762153(v=vs.85).aspx
foreign import ccall "ShellExecuteW"
    c_ShellExecute :: HANDLE  -- _In_opt_
                   -> LPCTSTR -- _In_opt_
                   -> LPCTSTR -- _In_
                   -> LPCTSTR -- _In_opt_
                   -> LPCTSTR -- _In_opt_
                   -> INT     -- _In_
                   -> IO (HINSTANCE)