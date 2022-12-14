; RUN: opt -S -passes=licm < %s | FileCheck %s --check-prefix=IR-AFTER-TRANSFORM
; RUN: opt -passes='print<scalar-evolution>,loop-mssa(licm),print<scalar-evolution>' -disable-output < %s 2>&1 | FileCheck %s --check-prefix=SCEV-EXPRS

declare void @clobber()

define void @f_0(ptr %loc) {
; IR-AFTER-TRANSFORM-LABEL: @f_0(
; IR-AFTER-TRANSFORM: loop.outer:
; IR-AFTER-TRANSFORM-NEXT:  call void @clobber()
; IR-AFTER-TRANSFORM-NEXT:  %cond = load i1, ptr %loc
; IR-AFTER-TRANSFORM-NEXT:  br label %loop.inner

; SCEV-EXPRS: Classifying expressions for: @f_0
; SCEV-EXPRS: Classifying expressions for: @f_0
; SCEV-EXPRS:  %cond = load i1, ptr %loc
; SCEV-EXPRS-NEXT:   -->  {{.*}} LoopDispositions: { %loop.outer: Variant, %loop.inner: Invariant }

entry:
  br label %loop.outer

loop.outer:
  call void @clobber()
  br label %loop.inner

loop.inner:
  %cond = load i1, ptr %loc
  br i1 %cond, label %loop.inner, label %leave.inner

leave.inner:
  br label %loop.outer
}
