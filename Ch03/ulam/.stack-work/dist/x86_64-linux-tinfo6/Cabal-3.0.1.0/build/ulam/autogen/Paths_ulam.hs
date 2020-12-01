{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_ulam (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/rds/Documents/Haskell/DMA/Ch03/ulam/.stack-work/install/x86_64-linux-tinfo6/5f3b6b3d4195df2e4e5c5bb017352a79419675578f88f44aac45094761307272/8.8.4/bin"
libdir     = "/home/rds/Documents/Haskell/DMA/Ch03/ulam/.stack-work/install/x86_64-linux-tinfo6/5f3b6b3d4195df2e4e5c5bb017352a79419675578f88f44aac45094761307272/8.8.4/lib/x86_64-linux-ghc-8.8.4/ulam-0.1.0.0-8fkHZgjwfhm6Vs68ayUb5a-ulam"
dynlibdir  = "/home/rds/Documents/Haskell/DMA/Ch03/ulam/.stack-work/install/x86_64-linux-tinfo6/5f3b6b3d4195df2e4e5c5bb017352a79419675578f88f44aac45094761307272/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/rds/Documents/Haskell/DMA/Ch03/ulam/.stack-work/install/x86_64-linux-tinfo6/5f3b6b3d4195df2e4e5c5bb017352a79419675578f88f44aac45094761307272/8.8.4/share/x86_64-linux-ghc-8.8.4/ulam-0.1.0.0"
libexecdir = "/home/rds/Documents/Haskell/DMA/Ch03/ulam/.stack-work/install/x86_64-linux-tinfo6/5f3b6b3d4195df2e4e5c5bb017352a79419675578f88f44aac45094761307272/8.8.4/libexec/x86_64-linux-ghc-8.8.4/ulam-0.1.0.0"
sysconfdir = "/home/rds/Documents/Haskell/DMA/Ch03/ulam/.stack-work/install/x86_64-linux-tinfo6/5f3b6b3d4195df2e4e5c5bb017352a79419675578f88f44aac45094761307272/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ulam_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ulam_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ulam_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ulam_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ulam_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ulam_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
