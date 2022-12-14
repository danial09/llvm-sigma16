; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes=verify,iroutliner -ir-outlining-no-cost < %s | FileCheck %s

; Show that we do not extract phi nodes as it would require extra label and
; control flow checking.

define void @function1(i32* %a, i32* %b) {
; CHECK-LABEL: @function1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FIRST:%.*]]
; CHECK:       first:
; CHECK-NEXT:    [[TMP0:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ 3, [[NEXT:%.*]] ]
; CHECK-NEXT:    call void @outlined_ir_func_0(i32* [[A:%.*]], i32* [[B:%.*]])
; CHECK-NEXT:    ret void
; CHECK:       next:
; CHECK-NEXT:    br label [[FIRST]]
;
entry:
  br label %first
first:
  %0 = phi i32 [ 0, %entry ], [ 3, %next ]
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  ret void
next:
  br label %first
}

define void @function2(i32* %a, i32* %b) {
; CHECK-LABEL: @function2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FIRST:%.*]]
; CHECK:       first:
; CHECK-NEXT:    [[TMP0:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ 3, [[NEXT:%.*]] ]
; CHECK-NEXT:    call void @outlined_ir_func_0(i32* [[A:%.*]], i32* [[B:%.*]])
; CHECK-NEXT:    ret void
; CHECK:       next:
; CHECK-NEXT:    br label [[FIRST]]
;
entry:
  br label %first
first:
  %0 = phi i32 [ 0, %entry ], [ 3, %next ]
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  ret void
next:
  br label %first
}
