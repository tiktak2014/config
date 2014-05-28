#!/usr/bin/env bash

## download llvm-3.4 tarballs
SRC_ROOT='llvm_src'
CLANG_SRC='http://llvm.org/releases/3.4/clang-3.4.src.tar.gz'
LLVM_SRC='http://llvm.org/releases/3.4/llvm-3.4.src.tar.gz'
COMPILER_RT_SRC='http://llvm.org/releases/3.4/compiler-rt-3.4.src.tar.gz'
CLANG_TOOLS_EXTRA='http://llvm.org/releases/3.4/clang-tools-extra-3.4.src.tar.gz'
LIBCXX_SRC='http://llvm.org/releases/3.4/libcxx-3.4.src.tar.gz'

wget -c $CLANG_SRC -P $SRC_ROOT
wget -c $LLVM_SRC -P $SRC_ROOT
wget -c $COMPILER_RT_SRC -P $SRC_ROOT
wget -c $CLANG_TOOLS_EXTRA -P $SRC_ROOT
wget -c $LIBCXX_SRC -P $SRC_ROOT

## extract tarballs
for file in `ls $SRC_ROOT/*.tar.gz`; do
    tar zxvf $file -C $SRC_ROOT
done

## pre-build
cd $SRC_ROOT
mv llvm-3.4 llvm
mv clang-3.4 clang
mv compiler-rt-3.4 compiler-rt
mv clang-tools-extra-3.4 extra
mv extra clang/
mv clang llvm/tools/
mv compiler-rt llvm/projects/

## build llvm/clang
mkdir llvm-build
cd llvm-build
../llvm/configure --enable-optimized --enable-targets=host-only --with-python=/opt/python27/bin/python
make clean && make && sudo make install

## build libcxx
# cd ../libcxx-3.4/lib
# ./buildit
# sudo cp ./libc++.so.1.0 /usr/lib
# cd /usr/lib
# sudo ln -sf libc++.so.1.0 libc++.so
# sudo ln -sf libc++.so.1.0 libc++.so.1
# cd -
# cp -r ../include /usr/include/c++/v1
