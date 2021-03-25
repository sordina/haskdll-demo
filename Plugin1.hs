module Plugin1 where

import           Foreign.StablePtr

foreign export ccall initializePlugin :: IO (StablePtr (String -> IO ()))

initializePlugin :: IO (StablePtr (String -> IO ()))
initializePlugin =
    newStablePtr $ \s -> putStrLn $ s <> "!"
