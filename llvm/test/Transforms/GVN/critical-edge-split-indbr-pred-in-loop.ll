; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -passes=gvn -S -verify-loop-info %s | FileCheck %s

; Make sure we do not try to preserve loop-simplify form, if it would mean
; splitting blocks with indirectbr predecessors.

declare i1 @cond()

define i32 @foo(i8* %p1, i8* %p2, i32* %p3) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    br label [[LOOP_HEADER:%.*]]
; CHECK:       loop.header:
; CHECK-NEXT:    store i32 0, i32* [[P3:%.*]], align 4
; CHECK-NEXT:    indirectbr i8* [[P1:%.*]], [label [[LOOP_LATCH1:%.*]], label %loop.latch2]
; CHECK:       loop.latch1:
; CHECK-NEXT:    [[C:%.*]] = call i1 @cond()
; CHECK-NEXT:    br i1 [[C]], label [[LOOP_HEADER]], label [[LOOP_LATCH1_EXIT_CRIT_EDGE:%.*]]
; CHECK:       loop.latch1.exit_crit_edge:
; CHECK-NEXT:    [[X_PRE:%.*]] = load i32, i32* [[P3]], align 4
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       loop.latch2:
; CHECK-NEXT:    indirectbr i8* [[P2:%.*]], [label [[LOOP_HEADER]], label %exit]
; CHECK:       exit:
; CHECK-NEXT:    [[X:%.*]] = phi i32 [ [[X_PRE]], [[LOOP_LATCH1_EXIT_CRIT_EDGE]] ], [ 0, [[LOOP_LATCH2:%.*]] ]
; CHECK-NEXT:    ret i32 [[X]]
;
bb:
  br label %loop.header

loop.header:                                      ; preds = %loop.latch2, %loop.latch1, %bb
  store i32 0, i32* %p3, align 4
  indirectbr i8* %p1, [label %loop.latch1, label %loop.latch2]

loop.latch1:                                      ; preds = %loop.header
  %c = call i1 @cond()
  br i1 %c, label %loop.header, label %exit

loop.latch2:                                      ; preds = %loop.header
  indirectbr i8* %p2, [label %loop.header, label %exit]

exit:                                             ; preds = %loop.latch2, %loop.latch1
  %x = load i32, i32* %p3, align 4
  %y = add i32 %x, 0
  ret i32 %y
}
