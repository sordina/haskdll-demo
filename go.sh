#!/bin/bash

ghc --make -dynamic Main.hs
ghc --make -dynamic -shared -fPIC Plugin1.hs -o plugin1-so
ghc --make -dynamic -shared -fPIC Plugin2.hs -o plugin2-so

rm -f Main.hi
rm -f Main.o
rm -f Plugin1.hi
rm -f Plugin1.o
rm -f Plugin2.hi
rm -f Plugin2.o

PLUGIN=./plugin1-so ./Main
PLUGIN=./plugin2-so ./Main
