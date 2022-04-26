#!/usr/bin/env bash
set -e
P3D_INCLUDE_PATH=/Library/Developer/Panda3D/include
P3D_LIB_PATH=/Library/Developer/Panda3D/lib 
clang++ \
  -Wfatal-errors \
  -c src/main.cxx \
  -o 3d-game-shaders-for-beginners.o \
  -std=gnu++11 \
  -O3 \
  -arch x86_64 \
  -I$P3D_INCLUDE_PATH

clang++ \
  3d-game-shaders-for-beginners.o \
  -o 3d-game-shaders-for-beginners \
  -arch x86_64 \
  -L$P3D_LIB_PATH \
  -lp3framework \
  -lpanda \
  -lpandafx \
  -lpandaexpress \
  -lpandaphysics \
  -lp3dtoolconfig \
  -lp3dtool \
  -lpthread


if [ ! -h ../lib ]
then
echo "ln -s"
ln -s $P3D_LIB_PATH ../lib
fi

./3d-game-shaders-for-beginners