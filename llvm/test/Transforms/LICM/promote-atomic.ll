; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes=licm < %s | FileCheck %s

%class.LiveThread = type { i64, ptr }

@globallive = external dso_local global i64, align 8

; The store should not be sunk (via scalar promotion) past the cmpxchg.

define void @test(ptr %live_thread) {
; CHECK-LABEL: @test(
; CHECK-NEXT:    [[NEXT_UNPROCESSED_:%.*]] = getelementptr inbounds [[CLASS_LIVETHREAD:%.*]], ptr [[LIVE_THREAD:%.*]], i64 0, i32 1
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    store ptr undef, ptr [[NEXT_UNPROCESSED_]], align 8
; CHECK-NEXT:    [[XCHG:%.*]] = cmpxchg weak ptr @globallive, i64 undef, i64 undef release monotonic, align 8
; CHECK-NEXT:    [[DONE:%.*]] = extractvalue { i64, i1 } [[XCHG]], 1
; CHECK-NEXT:    br i1 [[DONE]], label [[EXIT:%.*]], label [[LOOP]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
  %next_unprocessed_ = getelementptr inbounds %class.LiveThread, ptr %live_thread, i64 0, i32 1
  br label %loop

loop:
  store ptr undef, ptr %next_unprocessed_, align 8
  %xchg = cmpxchg weak ptr @globallive, i64 undef, i64 undef release monotonic, align 8
  %done = extractvalue { i64, i1 } %xchg, 1
  br i1 %done, label %exit, label %loop

exit:
  ret void
}

