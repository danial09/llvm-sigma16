; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes=separate-const-offset-from-gep < %s | FileCheck %s

@e = external global [4000 x i8], align 1

define void @find_either_reset() {
; CHECK-LABEL: @find_either_reset(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[SUB:%.*]] = sub nsw i32 65536, undef
; CHECK-NEXT:    [[TMP0:%.*]] = trunc i32 [[SUB]] to i8
; CHECK-NEXT:    [[TMP1:%.*]] = add i8 [[TMP0]], 96
; CHECK-NEXT:    [[IDXPROM:%.*]] = sext i8 0 to i64
; CHECK-NEXT:    [[IDXPROM1:%.*]] = sext i8 [[TMP1]] to i64
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds [4000 x i8], ptr @e, i64 [[IDXPROM]], i64 [[IDXPROM1]]
; CHECK-NEXT:    ret void
;
entry:
  %sub = sub nsw i32 65536, undef
  %0 = trunc i32 %sub to i8
  %1 = add i8 %0, -4000
  %arrayidx = getelementptr inbounds [4000 x i8], ptr @e, i8 0, i8 %1
  ret void
}
