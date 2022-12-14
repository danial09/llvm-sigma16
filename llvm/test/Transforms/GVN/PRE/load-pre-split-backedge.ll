; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes=gvn -enable-split-backedge-in-load-pre=true < %s | FileCheck %s --check-prefix=ON
; RUN: opt -S -passes=gvn -enable-split-backedge-in-load-pre=false < %s | FileCheck %s --check-prefix=OFF

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:128:128-n8:16:32"

define i32 @test(i1 %b, i1 %c, i32* noalias %p, i32* noalias %q) {
; ON-LABEL: @test(
; ON-NEXT:  entry:
; ON-NEXT:    [[Y1:%.*]] = load i32, i32* [[P:%.*]], align 4
; ON-NEXT:    call void @use(i32 [[Y1]])
; ON-NEXT:    br label [[HEADER:%.*]]
; ON:       header:
; ON-NEXT:    [[Y:%.*]] = phi i32 [ [[Y_PRE:%.*]], [[SKIP_HEADER_CRIT_EDGE:%.*]] ], [ [[Y]], [[HEADER]] ], [ [[Y1]], [[ENTRY:%.*]] ]
; ON-NEXT:    call void @use(i32 [[Y]])
; ON-NEXT:    br i1 [[B:%.*]], label [[SKIP:%.*]], label [[HEADER]]
; ON:       skip:
; ON-NEXT:    call void @clobber(i32* [[P]], i32* [[Q:%.*]])
; ON-NEXT:    br i1 [[C:%.*]], label [[SKIP_HEADER_CRIT_EDGE]], label [[EXIT:%.*]]
; ON:       skip.header_crit_edge:
; ON-NEXT:    [[Y_PRE]] = load i32, i32* [[P]], align 4
; ON-NEXT:    br label [[HEADER]]
; ON:       exit:
; ON-NEXT:    ret i32 [[Y]]
;
; OFF-LABEL: @test(
; OFF-NEXT:  entry:
; OFF-NEXT:    [[Y1:%.*]] = load i32, i32* [[P:%.*]], align 4
; OFF-NEXT:    call void @use(i32 [[Y1]])
; OFF-NEXT:    br label [[HEADER:%.*]]
; OFF:       header:
; OFF-NEXT:    [[Y:%.*]] = load i32, i32* [[P]], align 4
; OFF-NEXT:    call void @use(i32 [[Y]])
; OFF-NEXT:    br i1 [[B:%.*]], label [[SKIP:%.*]], label [[HEADER]]
; OFF:       skip:
; OFF-NEXT:    call void @clobber(i32* [[P]], i32* [[Q:%.*]])
; OFF-NEXT:    br i1 [[C:%.*]], label [[HEADER]], label [[EXIT:%.*]]
; OFF:       exit:
; OFF-NEXT:    ret i32 [[Y]]
;
entry:
  %y1 = load i32, i32* %p
  call void @use(i32 %y1)
  br label %header
header:
  %y = load i32, i32* %p
  call void @use(i32 %y)
  br i1 %b, label %skip, label %header
skip:
  call void @clobber(i32* %p, i32* %q)
  br i1 %c, label %header, label %exit
exit:
  ret i32 %y
}

declare void @use(i32) readonly
declare void @clobber(i32* %p, i32* %q)
