; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -loop-reduce -S < %s | FileCheck %s

target datalayout = "e-m:w-p:64:64-i32:32-i64:64-i128:128-n32:64-S128"

define i32 @test(i32 %c, ptr %a, ptr %b) {
; CHECK-LABEL: @test(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP13:%.*]] = icmp sgt i32 [[C:%.*]], 0
; CHECK-NEXT:    br i1 [[CMP13]], label [[FOR_BODY_PREHEADER:%.*]], label [[RETURN:%.*]]
; CHECK:       for.body.preheader:
; CHECK-NEXT:    [[WIDE_TRIP_COUNT:%.*]] = zext i32 [[C]] to i64
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.cond:
; CHECK-NEXT:    [[UGLYGEP:%.*]] = getelementptr i8, ptr [[LSR_IV:%.*]], i64 4
; CHECK-NEXT:    [[LSR_IV_NEXT:%.*]] = add nsw i64 [[LSR_IV1:%.*]], -1
; CHECK-NEXT:    [[EXITCOND_NOT:%.*]] = icmp eq i64 [[LSR_IV_NEXT]], 0
; CHECK-NEXT:    br i1 [[EXITCOND_NOT]], label [[RETURN_LOOPEXIT:%.*]], label [[FOR_BODY]]
; CHECK:       for.body:
; CHECK-NEXT:    [[LSR_IV1]] = phi i64 [ [[LSR_IV_NEXT]], [[FOR_COND:%.*]] ], [ [[WIDE_TRIP_COUNT]], [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[LSR_IV]] = phi ptr [ [[UGLYGEP]], [[FOR_COND]] ], [ [[A:%.*]], [[FOR_BODY_PREHEADER]] ]
; CHECK-NEXT:    [[VAL:%.*]] = load i32, ptr [[LSR_IV]], align 4
; CHECK-NEXT:    [[TOBOOL3_NOT:%.*]] = icmp eq i32 [[VAL]], 0
; CHECK-NEXT:    br i1 [[TOBOOL3_NOT]], label [[FOR_COND]], label [[RETURN_LOOPEXIT]]
; CHECK:       return.loopexit:
; CHECK-NEXT:    [[RETVAL_1_PH:%.*]] = phi i32 [ 1, [[FOR_BODY]] ], [ 0, [[FOR_COND]] ]
; CHECK-NEXT:    br label [[RETURN]]
; CHECK:       return:
; CHECK-NEXT:    [[RETVAL_1:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ [[RETVAL_1_PH]], [[RETURN_LOOPEXIT]] ]
; CHECK-NEXT:    ret i32 [[RETVAL_1]]
;
entry:
  %cmp13 = icmp sgt i32 %c, 0
  br i1 %cmp13, label %for.body.preheader, label %return

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %c to i64
  br label %for.body

for.cond:                                         ; preds = %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %return, label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.cond
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.cond ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %val = load i32, ptr %arrayidx, align 4
  %tobool3.not = icmp eq i32 %val, 0
  br i1 %tobool3.not, label %for.cond, label %return

return:                                           ; preds = %for.cond, %for.body, %entry
  %retval.1 = phi i32 [ 0, %entry ], [ 0, %for.cond ], [ 1, %for.body ]
  ret i32 %retval.1
}
