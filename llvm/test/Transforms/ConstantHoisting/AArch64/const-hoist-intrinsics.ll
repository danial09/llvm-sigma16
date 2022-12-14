; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -mtriple=arm64-darwin-unknown -S -passes=consthoist < %s | FileCheck %s

; Make sure we hoist constants out of intrinsics.

define void @test_stxr(i64* %ptr) {
; CHECK-LABEL: @test_stxr(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONST:%.*]] = bitcast i64 -9223372036317904832 to i64
; CHECK-NEXT:    [[PTR_0:%.*]] = getelementptr i64, i64* [[PTR:%.*]], i64 0
; CHECK-NEXT:    [[CONST_MAT:%.*]] = add i64 [[CONST]], -64
; CHECK-NEXT:    [[BAR_0:%.*]] = call i32 @llvm.aarch64.stxr.p0i64(i64 [[CONST_MAT]], i64* elementtype(i64) [[PTR_0]])
; CHECK-NEXT:    [[PTR_1:%.*]] = getelementptr i64, i64* [[PTR]], i64 1
; CHECK-NEXT:    [[BAR_1:%.*]] = call i32 @llvm.aarch64.stxr.p0i64(i64 [[CONST]], i64* elementtype(i64) [[PTR_1]])
; CHECK-NEXT:    [[PTR_2:%.*]] = getelementptr i64, i64* [[PTR]], i64 2
; CHECK-NEXT:    [[CONST_MAT1:%.*]] = add i64 [[CONST]], 64
; CHECK-NEXT:    [[BAR_2:%.*]] = call i32 @llvm.aarch64.stxr.p0i64(i64 [[CONST_MAT1]], i64* elementtype(i64) [[PTR_2]])
; CHECK-NEXT:    [[PTR_3:%.*]] = getelementptr i64, i64* [[PTR]], i64 3
; CHECK-NEXT:    [[CONST_MAT2:%.*]] = add i64 [[CONST]], 128
; CHECK-NEXT:    [[BAR_3:%.*]] = call i32 @llvm.aarch64.stxr.p0i64(i64 [[CONST_MAT2]], i64* elementtype(i64) [[PTR_3]])
; CHECK-NEXT:    ret void
;
entry:
  %ptr.0 = getelementptr i64, i64* %ptr, i64 0
  %bar.0 = call i32 @llvm.aarch64.stxr.p0i64(i64 -9223372036317904896, i64* elementtype(i64) %ptr.0)
  %ptr.1 = getelementptr i64, i64* %ptr, i64 1
  %bar.1 = call i32 @llvm.aarch64.stxr.p0i64(i64 -9223372036317904832,  i64* elementtype(i64) %ptr.1)
  %ptr.2 = getelementptr i64, i64* %ptr, i64 2
  %bar.2 = call i32 @llvm.aarch64.stxr.p0i64(i64 -9223372036317904768, i64* elementtype(i64) %ptr.2)
  %ptr.3 = getelementptr i64, i64* %ptr, i64 3
  %bar.3 = call i32 @llvm.aarch64.stxr.p0i64(i64 -9223372036317904704, i64* elementtype(i64) %ptr.3)
  ret void
}

declare i32 @llvm.aarch64.stxr.p0i64(i64 , i64*)

define i64 @test_udiv(i64 %x) {
; CHECK-LABEL: @test_udiv(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONST:%.*]] = bitcast i64 -9223372036317904832 to i64
; CHECK-NEXT:    [[CONST_MAT:%.*]] = add i64 [[CONST]], -64
; CHECK-NEXT:    [[BAR_0:%.*]] = call i64 @llvm.aarch64.udiv.i64(i64 [[CONST_MAT]], i64 [[X:%.*]])
; CHECK-NEXT:    [[BAR_1:%.*]] = call i64 @llvm.aarch64.udiv.i64(i64 [[CONST]], i64 [[X]])
; CHECK-NEXT:    [[CONST_MAT1:%.*]] = add i64 [[CONST]], 64
; CHECK-NEXT:    [[BAR_2:%.*]] = call i64 @llvm.aarch64.udiv.i64(i64 [[CONST_MAT1]], i64 [[X]])
; CHECK-NEXT:    [[CONST_MAT2:%.*]] = add i64 [[CONST]], 128
; CHECK-NEXT:    [[BAR_3:%.*]] = call i64 @llvm.aarch64.udiv.i64(i64 [[CONST_MAT2]], i64 [[X]])
; CHECK-NEXT:    [[RES_1:%.*]] = add i64 [[BAR_0]], [[BAR_1]]
; CHECK-NEXT:    [[RES_2:%.*]] = add i64 [[RES_1]], [[BAR_2]]
; CHECK-NEXT:    [[RES_3:%.*]] = add i64 [[RES_2]], [[BAR_3]]
; CHECK-NEXT:    ret i64 [[RES_3]]
;
entry:
  %bar.0 = call i64 @llvm.aarch64.udiv.i64.i64(i64 -9223372036317904896, i64 %x)
  %bar.1 = call i64 @llvm.aarch64.udiv.i64.i64(i64 -9223372036317904832,  i64 %x)
  %bar.2 = call i64 @llvm.aarch64.udiv.i64.i64(i64 -9223372036317904768, i64 %x)
  %bar.3 = call i64 @llvm.aarch64.udiv.i64.i64(i64 -9223372036317904704, i64 %x)
  %res.1 = add i64 %bar.0, %bar.1
  %res.2 = add i64 %res.1, %bar.2
  %res.3 = add i64 %res.2, %bar.3
  ret i64 %res.3
}

declare i64 @llvm.aarch64.udiv.i64.i64(i64, i64)

define void @test_free_intrinsics(i64 %x, i8* %ptr) {
; CHECK-LABEL: @test_free_intrinsics(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    call void @llvm.lifetime.start.p0i8(i64 100000000032, i8* [[PTR:%.*]])
; CHECK-NEXT:    call void @llvm.lifetime.start.p0i8(i64 100000000064, i8* [[PTR]])
; CHECK-NEXT:    call void @llvm.lifetime.end.p0i8(i64 100000000128, i8* [[PTR]])
; CHECK-NEXT:    [[I:%.*]] = call {}* @llvm.invariant.start.p0i8(i64 100000000256, i8* [[PTR]])
; CHECK-NEXT:    call void @llvm.invariant.end.p0i8({}* [[I]], i64 100000000256, i8* [[PTR]])
; CHECK-NEXT:    ret void
;
entry:
  call void @llvm.lifetime.start.p0i8(i64 100000000032, i8* %ptr)
  call void @llvm.lifetime.start.p0i8(i64 100000000064, i8* %ptr)
  call void @llvm.lifetime.end.p0i8(i64 100000000128, i8* %ptr)
  %i = call {}* @llvm.invariant.start.p0i8(i64 100000000256, i8* %ptr)
  call void @llvm.invariant.end.p0i8({}* %i, i64 100000000256, i8* %ptr)
  ret void
}

declare void @llvm.lifetime.start.p0i8(i64, i8*)
declare void @llvm.lifetime.end.p0i8(i64, i8*)

declare {}* @llvm.invariant.start.p0i8(i64, i8* nocapture)
declare void @llvm.invariant.end.p0i8({}*, i64, i8* nocapture)
