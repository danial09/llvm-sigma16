; RUN: not llvm-link %s %p/Inputs/appending-global.ll -S -o - 2>&1 | FileCheck %s
; RUN: not llvm-link %p/Inputs/appending-global.ll %s -S -o - 2>&1 | FileCheck %s

; Negative test to check that global variables with appending linkage and
; different visibility cannot be linked.

; CHECK: Appending variables with different visibility need to be linked

@var = appending hidden global [1 x ptr ] undef
