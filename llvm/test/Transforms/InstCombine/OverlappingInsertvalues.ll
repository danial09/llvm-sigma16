; RUN: opt < %s -passes=instcombine -S | FileCheck %s
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

; Check that we can find and remove redundant insertvalues
; CHECK-LABEL: foo_simple
; CHECK-NOT: ptr %x, 0
define { ptr, i64, i32 } @foo_simple(ptr %x, ptr %y) nounwind {
entry:
  %0 = insertvalue { ptr, i64, i32 } undef, ptr %x, 0
  %1 = insertvalue { ptr, i64, i32 } %0, ptr %y, 0
  ret { ptr, i64, i32 } %1
}
; Check that we can find and remove redundant nodes in insertvalues chain
; CHECK-LABEL: foo_ovwrt_chain
; CHECK-NOT: i64 %y, 1
; CHECK-NOT: i32 555, 2
define { ptr, i64, i32 } @foo_ovwrt_chain(ptr %x, i64 %y, i64 %z) nounwind {
entry:
  %0 = insertvalue { ptr, i64, i32 } undef, ptr %x, 0
  %1 = insertvalue { ptr, i64, i32 } %0, i64 %y, 1
  %2 = insertvalue { ptr, i64, i32 } %1, i32 555, 2
  %3 = insertvalue { ptr, i64, i32 } %2, i64 %z, 1
  %4 = insertvalue { ptr, i64, i32 } %3, i32 777, 2
  ret { ptr, i64, i32 } %4
}
; Check that we propagate insertvalues only if they are use as the first
; operand (as initial value of aggregate)
; CHECK-LABEL: foo_use_as_second_operand
; CHECK: i16 %x, 0
; CHECK: %0, 1
define { i8, {i16, i32} } @foo_use_as_second_operand(i16 %x) nounwind {
entry:
  %0 = insertvalue { i16, i32 } undef, i16 %x, 0
  %1 = insertvalue { i8, {i16, i32} } undef, { i16, i32 } %0, 1
  ret { i8, {i16, i32} } %1
}
