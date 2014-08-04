module Main (main) where

import Distribution.Simple
import Distribution.System
import System.Environment

main :: IO ()
main = do
  msys'present <- (elem "MSYSTEM" . map fst) `fmap` getEnvironment
  case (msys'present,buildOS) of
    (False, Windows) -> defaultMain -- on Windows without MSYS use preconfigured headers and params
    _ -> defaultMainWithHooks autoconfUserHooks
