module Main where

import Foreign.Ptr
import Foreign.StablePtr
import Lib
import System.Posix.DynamicLinker
import System.Environment

type InitializePlugin = IO (StablePtr (String -> IO ()))
foreign import ccall "dynamic"
  mkInitializePlugin :: FunPtr InitializePlugin -> InitializePlugin

main :: IO ()
main = do
  dylib     <- getEnv "PLUGIN"
  plugin    <- dlopen dylib [ RTLD_LAZY ] -- "./plugins/plugin1-so"
  pluginPtr <- dlsym plugin "initializePlugin"
  plugin    <- deRefStablePtr =<< mkInitializePlugin pluginPtr
  plugin "Hello Sailor"
