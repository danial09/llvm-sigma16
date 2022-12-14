; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes=globalopt < %s | FileCheck %s

; Make sure we don't recursively SRA if there are aggregate load/stores with
; the same type as the global.

@g = internal global { i32, i32 } undef

define void @test() {
; CHECK-LABEL: @test(
; CHECK-NEXT:    store { i32, i32 } zeroinitializer, ptr @g, align 4
; CHECK-NEXT:    store { i32, i32 } { i32 0, i32 1 }, ptr @g, align 4
; CHECK-NEXT:    ret void
;
  store { i32, i32 } zeroinitializer, ptr @g
  store { i32, i32 } { i32 0, i32 1 }, ptr @g
  ret void
}

define { i32, i32 } @load() {
; CHECK-LABEL: @load(
; CHECK-NEXT:    [[V:%.*]] = load { i32, i32 }, ptr @g, align 4
; CHECK-NEXT:    ret { i32, i32 } [[V]]
;
  %v = load { i32, i32 }, ptr @g
  ret { i32, i32 } %v
}
