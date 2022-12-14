; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S --passes=slp-vectorizer -mtriple=x86_64-unknown %s -slp-threshold=-5 | FileCheck %s

define i32 @test(i32* %isec) {
; CHECK-LABEL: @test(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[ARRAYIDX10:%.*]] = getelementptr inbounds i32, i32* [[ISEC:%.*]], i32 0
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast i32* [[ARRAYIDX10]] to <2 x i32>*
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i32>, <2 x i32>* [[TMP0]], align 8
; CHECK-NEXT:    [[TMP2:%.*]] = shufflevector <2 x i32> [[TMP1]], <2 x i32> poison, <2 x i32> <i32 1, i32 0>
; CHECK-NEXT:    br i1 false, label [[BLOCK1:%.*]], label [[BLOCK3:%.*]]
; CHECK:       block1:
; CHECK-NEXT:    br i1 false, label [[BLOCK2:%.*]], label [[BLOCK3]]
; CHECK:       block2:
; CHECK-NEXT:    br label [[BLOCK3]]
; CHECK:       block3:
; CHECK-NEXT:    [[TMP3:%.*]] = phi <2 x i32> [ [[TMP1]], [[BLOCK1]] ], [ [[TMP1]], [[BLOCK2]] ], [ [[TMP2]], [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[TMP4:%.*]] = extractelement <2 x i32> [[TMP3]], i32 0
; CHECK-NEXT:    [[TMP5:%.*]] = extractelement <2 x i32> [[TMP3]], i32 1
; CHECK-NEXT:    [[TMP6:%.*]] = mul i32 [[TMP5]], [[TMP4]]
; CHECK-NEXT:    ret i32 [[TMP6]]
;
entry:
  %arrayidx10 = getelementptr inbounds i32, i32* %isec, i32 0
  %0 = bitcast i32* %arrayidx10 to <2 x i32>*
  %1 = load <2 x i32>, <2 x i32>* %0, align 8
  %2 = extractelement <2 x i32> %1, i32 1
  %3 = extractelement <2 x i32> %1, i32 0
  br i1 false, label %block1, label %block3
block1:
  br i1 false, label %block2, label %block3
block2:
  br label %block3
block3:
  %4 = phi i32 [ %2, %block1 ], [ %2, %block2 ], [ %3, %entry ]
  %5 = phi i32 [ %3, %block1 ], [ %3, %block2 ], [ %2, %entry ]
  %6 = mul i32 %4, %5
  ret i32 %6
}
