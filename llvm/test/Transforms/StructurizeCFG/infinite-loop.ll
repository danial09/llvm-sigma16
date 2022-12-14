; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -o - -structurizecfg -verify-dom-info < %s | FileCheck %s

; This test hits a limitation in StructurizeCFG: it doesn't handle infinite-loops.
; In this case, the IR remains unchanged.

define void @infinite_loop_false(ptr addrspace(1) %out, i1 %cond) {
; CHECK-LABEL: @infinite_loop_false(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[COND:%.*]], label [[FOR_END:%.*]], label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    store volatile i32 999, ptr addrspace(1) [[OUT:%.*]], align 4
; CHECK-NEXT:    br label [[FOR_BODY]]
; CHECK:       for.end:
; CHECK-NEXT:    ret void
;
entry:
  br i1 %cond, label %for.end, label %for.body

for.body:
  store volatile i32 999, ptr addrspace(1) %out, align 4
  br label %for.body

for.end:
  ret void
}

define void @infinite_loop_on_branch(ptr addrspace(1) %out, i1 %cond) {
; CHECK-LABEL: @infinite_loop_on_branch(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[COND:%.*]], label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    store volatile i32 999, ptr addrspace(1) [[OUT:%.*]], align 4
; CHECK-NEXT:    br label [[FOR_BODY]]
; CHECK:       if.else:
; CHECK-NEXT:    store volatile i32 111, ptr addrspace(1) [[OUT]], align 4
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  br i1 %cond, label %if.then, label %if.else

if.then:
  br label %for.body

for.body:
  store volatile i32 999, ptr addrspace(1) %out, align 4
  br label %for.body

if.else:
  store volatile i32 111, ptr addrspace(1) %out, align 4
  br label %exit

exit:
  ret void
}
