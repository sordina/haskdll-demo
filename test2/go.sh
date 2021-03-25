#!/bin/bash

ghc --make -dynamic Main.hs
ghc --make -dynamic -shared -fPIC Plugin1.hs -o plugins/plugin1-so
ghc --make -dynamic -shared -fPIC Plugin2.hs -o plugins/plugin2-so

PLUGIN=./plugins/plugin1-so ./Main
PLUGIN=./plugins/plugin2-so ./Main
