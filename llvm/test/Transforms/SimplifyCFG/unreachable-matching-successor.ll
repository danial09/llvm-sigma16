; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -passes=simplifycfg -simplifycfg-require-and-preserve-domtree=1 -S < %s | FileCheck %s

define void @fn(i1 %c) {
; CHECK-LABEL: @fn(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    ret void
;
entry:
  ret void

unreachable_bb0:
  br i1 %c, label %unreachable_bb1, label %unreachable_bb1
unreachable_bb1:
  br label %unreachable_bb0
}
