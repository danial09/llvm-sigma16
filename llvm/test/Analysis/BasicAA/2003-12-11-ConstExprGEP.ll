; This testcase consists of alias relations which should be completely
; resolvable by basicaa, but require analysis of getelementptr constant exprs.

; RUN: opt < %s -aa-pipeline=basic-aa -passes=aa-eval -print-may-aliases -disable-output 2>&1 | FileCheck %s

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

%T = type { i32, [10 x i8] }

@G = external global %T

; CHECK:     Function: test
; CHECK-NOT:   MayAlias:

define void @test() {
  %E = getelementptr %T, ptr @G, i64 0, i32 1, i64 5
  %X = getelementptr [10 x i8], ptr getelementptr (%T, ptr @G, i64 0, i32 1), i64 0, i64 5

  ret void
}
