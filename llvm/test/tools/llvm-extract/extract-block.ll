; RUN: llvm-extract -S -bb foo:bb4 %s | FileCheck %s

; CHECK: declare void @bar()
define void @bar() {
bb:
  ret void
}

; CHECK-NOT: @unused()
define void @unused() {
bb:
  ret void
}

; CHECK: @foo.bb4
; CHECK: call void @bar()
; CHECK: %tmp5
define i32 @foo(i32 %arg) {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  store i32 %arg, ptr %tmp1, align 4
  %tmp2 = load i32, ptr %tmp1, align 4
  %tmp3 = icmp sgt i32 %tmp2, 0
  br i1 %tmp3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  call void @bar()
  %tmp5 = load i32, ptr %tmp1, align 4
  %tmp6 = add nsw i32 %tmp5, 1
  store i32 %tmp6, ptr %tmp1, align 4
  store i32 %tmp6, ptr %tmp, align 4
  br label %bb8

bb7:                                              ; preds = %bb
  store i32 0, ptr %tmp, align 4
  br label %bb8

bb8:                                              ; preds = %bb7, %bb4
  %tmp9 = load i32, ptr %tmp, align 4
  ret i32 %tmp9
}

