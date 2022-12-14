; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -passes=loop-unroll -S < %s | FileCheck %s

declare void @bar()

define void @test1() {
; CHECK-LABEL: @test1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_1:%.*]]
; CHECK:       latch.1:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_2:%.*]]
; CHECK:       latch.2:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_3:%.*]]
; CHECK:       latch.3:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_4:%.*]]
; CHECK:       latch.4:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_5:%.*]]
; CHECK:       latch.5:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_6:%.*]]
; CHECK:       latch.6:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_7:%.*]]
; CHECK:       latch.7:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_8:%.*]]
; CHECK:       latch.8:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_9:%.*]]
; CHECK:       latch.9:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br i1 false, label [[LATCH_10:%.*]], label [[EXIT:%.*]]
; CHECK:       latch.10:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  br label %loop
loop:
  %iv = phi i64 [0, %entry], [%iv.next, %latch]
  %iv.next = add i64 %iv, 1
  call void @bar()
  %cmp1 = icmp ult i64 %iv, 10
  br i1 %cmp1, label %latch, label %exit
latch:
  call void @bar()
  %cmp2 = icmp ult i64 %iv, 20
  br i1 %cmp2, label %loop, label %exit
exit:
  ret void
}

; Fully unroll this loop by 10, but leave the unrolled latch
; tests since we don't know if %N < 10, and break the backedge.
define void @test2(i64 %N) {
; CHECK-LABEL: @test2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br i1 true, label [[LOOP_1:%.*]], label [[EXIT:%.*]]
; CHECK:       loop.1:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_1:%.*]]
; CHECK:       latch.1:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2_1:%.*]] = icmp ule i64 1, [[N:%.*]]
; CHECK-NEXT:    br i1 [[CMP2_1]], label [[LOOP_2:%.*]], label [[EXIT]]
; CHECK:       loop.2:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_2:%.*]]
; CHECK:       latch.2:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2_2:%.*]] = icmp ule i64 2, [[N]]
; CHECK-NEXT:    br i1 [[CMP2_2]], label [[LOOP_3:%.*]], label [[EXIT]]
; CHECK:       loop.3:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_3:%.*]]
; CHECK:       latch.3:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2_3:%.*]] = icmp ule i64 3, [[N]]
; CHECK-NEXT:    br i1 [[CMP2_3]], label [[LOOP_4:%.*]], label [[EXIT]]
; CHECK:       loop.4:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_4:%.*]]
; CHECK:       latch.4:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2_4:%.*]] = icmp ule i64 4, [[N]]
; CHECK-NEXT:    br i1 [[CMP2_4]], label [[LOOP_5:%.*]], label [[EXIT]]
; CHECK:       loop.5:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_5:%.*]]
; CHECK:       latch.5:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2_5:%.*]] = icmp ule i64 5, [[N]]
; CHECK-NEXT:    br i1 [[CMP2_5]], label [[LOOP_6:%.*]], label [[EXIT]]
; CHECK:       loop.6:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_6:%.*]]
; CHECK:       latch.6:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2_6:%.*]] = icmp ule i64 6, [[N]]
; CHECK-NEXT:    br i1 [[CMP2_6]], label [[LOOP_7:%.*]], label [[EXIT]]
; CHECK:       loop.7:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_7:%.*]]
; CHECK:       latch.7:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2_7:%.*]] = icmp ule i64 7, [[N]]
; CHECK-NEXT:    br i1 [[CMP2_7]], label [[LOOP_8:%.*]], label [[EXIT]]
; CHECK:       loop.8:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_8:%.*]]
; CHECK:       latch.8:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2_8:%.*]] = icmp ule i64 8, [[N]]
; CHECK-NEXT:    br i1 [[CMP2_8]], label [[LOOP_9:%.*]], label [[EXIT]]
; CHECK:       loop.9:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_9:%.*]]
; CHECK:       latch.9:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2_9:%.*]] = icmp ule i64 9, [[N]]
; CHECK-NEXT:    br i1 [[CMP2_9]], label [[LOOP_10:%.*]], label [[EXIT]]
; CHECK:       loop.10:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[LATCH_10:%.*]]
; CHECK:       latch.10:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2_10:%.*]] = icmp ule i64 10, [[N]]
; CHECK-NEXT:    br i1 [[CMP2_10]], label [[LOOP_11:%.*]], label [[EXIT]]
; CHECK:       loop.11:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br i1 false, label [[LATCH_11:%.*]], label [[EXIT]]
; CHECK:       latch.11:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  br label %loop
loop:
  %iv = phi i64 [0, %entry], [%iv.next, %latch]
  %iv.next = add i64 %iv, 1
  call void @bar()
  %cmp1 = icmp ule i64 %iv, 10
  br i1 %cmp1, label %latch, label %exit
latch:
  call void @bar()
  %cmp2 = icmp ule i64 %iv, %N
  br i1 %cmp2, label %loop, label %exit
exit:
  ret void
}


; TODO: We could partially unroll this by 2.
define void @test3(i64 %N, i64 %M) {
; CHECK-LABEL: @test3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[N_MASKED:%.*]] = and i64 [[N:%.*]], 65520
; CHECK-NEXT:    [[M_MASKED:%.*]] = and i64 [[M:%.*]], 65520
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i64 [ 0, [[ENTRY:%.*]] ], [ [[IV_NEXT:%.*]], [[LATCH:%.*]] ]
; CHECK-NEXT:    [[IV_NEXT]] = add i64 [[IV]], 1
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP1:%.*]] = icmp ule i64 [[IV]], [[N_MASKED]]
; CHECK-NEXT:    br i1 [[CMP1]], label [[LATCH]], label [[EXIT:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    call void @bar()
; CHECK-NEXT:    [[CMP2:%.*]] = icmp ule i64 [[IV]], [[M_MASKED]]
; CHECK-NEXT:    br i1 [[CMP2]], label [[LOOP]], label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  %N.masked = and i64 %N, 65520 ; 0xfff0
  %M.masked = and i64 %M, 65520 ; 0xfff0
  br label %loop
loop:
  %iv = phi i64 [0, %entry], [%iv.next, %latch]
  %iv.next = add i64 %iv, 1
  call void @bar()
  %cmp1 = icmp ule i64 %iv, %N.masked
  br i1 %cmp1, label %latch, label %exit
latch:
  call void @bar()
  %cmp2 = icmp ule i64 %iv, %M.masked
  br i1 %cmp2, label %loop, label %exit
exit:
  ret void
}
