; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=simplifycfg -simplifycfg-require-and-preserve-domtree=1 -hoist-common-insts=true -S | FileCheck %s

define void @test(i1 %C) {
; CHECK-LABEL: @test(
; CHECK-NEXT:  X:
; CHECK-NEXT:    call void @test(i1 [[C:%.*]])
; CHECK-NEXT:    ret void
;
  br i1 %C, label %A, label %B
A:              ; preds = %0
  call void @test( i1 %C )
  br label %X
B:              ; preds = %0
  call void @test( i1 %C )
  br label %X
X:              ; preds = %B, %A
  ret void
}

