#!/bin/sh
mkdir -p bin

cd corpus/programs
if ! [ -x "$(command -v node)" ]; then
  if ! [ -x "$(command -v nodejs)" ]; then
    echo 'Error: nodeJs not installed.' >&2
    exit 1
  else 
    nodejs ../../compilers/JavaScript/compiler.js init.chi
  fi
else 
  node ../../compilers/JavaScript/compiler.js init.chi
fi

mv init.kua ../../bin
cd ../..

cp Chika_PC.cpp Chika_Arduino
cd Chika_Arduino
g++ -o ../bin/chika Chika_PC.cpp ChVM.cpp Item.cpp utils.cpp config.cpp -g
rm Chika_PC.cpp

echo "Compiled Chika VM for PC."
