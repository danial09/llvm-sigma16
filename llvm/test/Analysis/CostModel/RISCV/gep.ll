; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt -mtriple=riscv32 -passes="print<cost-model>" 2>&1 -disable-output < %s \
; RUN:   | FileCheck %s -check-prefix=RVI
; RUN: opt -mtriple=riscv64 -passes="print<cost-model>" 2>&1 -disable-output < %s \
; RUN:   | FileCheck %s -check-prefix=RVI

define void @testi8(ptr %a, i32 %i) {
; RVI-LABEL: 'testi8'
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a1 = getelementptr inbounds i8, ptr %a, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a2 = getelementptr inbounds i8, ptr %a, i32 -1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a3 = getelementptr inbounds i8, ptr %a, i32 2047
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a4 = getelementptr inbounds i8, ptr %a, i32 2048
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a5 = getelementptr inbounds i8, ptr %a, i32 -2048
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a6 = getelementptr inbounds i8, ptr %a, i32 -2049
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %ai = getelementptr inbounds i8, ptr %a, i32 %i
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %a1 = getelementptr inbounds i8, ptr %a, i32 1
  %a2 = getelementptr inbounds i8, ptr %a, i32 -1
  %a3 = getelementptr inbounds i8, ptr %a, i32 2047
  %a4 = getelementptr inbounds i8, ptr %a, i32 2048
  %a5 = getelementptr inbounds i8, ptr %a, i32 -2048
  %a6 = getelementptr inbounds i8, ptr %a, i32 -2049
  %ai = getelementptr inbounds i8, ptr %a, i32 %i
  ret void
}

define void @testi16(ptr %a, i32 %i) {
; RVI-LABEL: 'testi16'
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a1 = getelementptr inbounds i16, ptr %a, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a2 = getelementptr inbounds i16, ptr %a, i32 -1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a3 = getelementptr inbounds i16, ptr %a, i32 1023
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a4 = getelementptr inbounds i16, ptr %a, i32 1024
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a5 = getelementptr inbounds i16, ptr %a, i32 -1024
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a6 = getelementptr inbounds i16, ptr %a, i32 -1025
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %ai = getelementptr inbounds i16, ptr %a, i32 %i
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %a1 = getelementptr inbounds i16, ptr %a, i32 1
  %a2 = getelementptr inbounds i16, ptr %a, i32 -1
  %a3 = getelementptr inbounds i16, ptr %a, i32 1023
  %a4 = getelementptr inbounds i16, ptr %a, i32 1024
  %a5 = getelementptr inbounds i16, ptr %a, i32 -1024
  %a6 = getelementptr inbounds i16, ptr %a, i32 -1025
  %ai = getelementptr inbounds i16, ptr %a, i32 %i
  ret void
}

define void @testi32(ptr %a, i32 %i) {
; RVI-LABEL: 'testi32'
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a1 = getelementptr inbounds i32, ptr %a, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a2 = getelementptr inbounds i32, ptr %a, i32 -1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a3 = getelementptr inbounds i32, ptr %a, i32 511
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a4 = getelementptr inbounds i32, ptr %a, i32 512
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a5 = getelementptr inbounds i32, ptr %a, i32 -512
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a6 = getelementptr inbounds i32, ptr %a, i32 -513
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %ai = getelementptr inbounds i32, ptr %a, i32 %i
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %a1 = getelementptr inbounds i32, ptr %a, i32 1
  %a2 = getelementptr inbounds i32, ptr %a, i32 -1
  %a3 = getelementptr inbounds i32, ptr %a, i32 511
  %a4 = getelementptr inbounds i32, ptr %a, i32 512
  %a5 = getelementptr inbounds i32, ptr %a, i32 -512
  %a6 = getelementptr inbounds i32, ptr %a, i32 -513
  %ai = getelementptr inbounds i32, ptr %a, i32 %i
  ret void
}

define void @testi64(ptr %a, i32 %i) {
; RVI-LABEL: 'testi64'
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a1 = getelementptr inbounds i64, ptr %a, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a2 = getelementptr inbounds i64, ptr %a, i32 -1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a3 = getelementptr inbounds i64, ptr %a, i32 255
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a4 = getelementptr inbounds i64, ptr %a, i32 256
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a5 = getelementptr inbounds i64, ptr %a, i32 -256
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a6 = getelementptr inbounds i64, ptr %a, i32 -257
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %ai = getelementptr inbounds i64, ptr %a, i32 %i
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %a1 = getelementptr inbounds i64, ptr %a, i32 1
  %a2 = getelementptr inbounds i64, ptr %a, i32 -1
  %a3 = getelementptr inbounds i64, ptr %a, i32 255
  %a4 = getelementptr inbounds i64, ptr %a, i32 256
  %a5 = getelementptr inbounds i64, ptr %a, i32 -256
  %a6 = getelementptr inbounds i64, ptr %a, i32 -257
  %ai = getelementptr inbounds i64, ptr %a, i32 %i
  ret void
}

define void @testfloat(ptr %a, i32 %i) {
; RVI-LABEL: 'testfloat'
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a1 = getelementptr inbounds float, ptr %a, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a2 = getelementptr inbounds float, ptr %a, i32 -1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a3 = getelementptr inbounds float, ptr %a, i32 511
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a4 = getelementptr inbounds float, ptr %a, i32 512
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a5 = getelementptr inbounds float, ptr %a, i32 -512
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a6 = getelementptr inbounds float, ptr %a, i32 -513
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %ai = getelementptr inbounds float, ptr %a, i32 %i
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %a1 = getelementptr inbounds float, ptr %a, i32 1
  %a2 = getelementptr inbounds float, ptr %a, i32 -1
  %a3 = getelementptr inbounds float, ptr %a, i32 511
  %a4 = getelementptr inbounds float, ptr %a, i32 512
  %a5 = getelementptr inbounds float, ptr %a, i32 -512
  %a6 = getelementptr inbounds float, ptr %a, i32 -513
  %ai = getelementptr inbounds float, ptr %a, i32 %i
  ret void
}

define void @testdouble(ptr %a, i32 %i) {
; RVI-LABEL: 'testdouble'
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a1 = getelementptr inbounds double, ptr %a, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a2 = getelementptr inbounds double, ptr %a, i32 -1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a3 = getelementptr inbounds double, ptr %a, i32 255
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a4 = getelementptr inbounds double, ptr %a, i32 256
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %a5 = getelementptr inbounds double, ptr %a, i32 -256
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %a6 = getelementptr inbounds double, ptr %a, i32 -257
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %ai = getelementptr inbounds double, ptr %a, i32 %i
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %a1 = getelementptr inbounds double, ptr %a, i32 1
  %a2 = getelementptr inbounds double, ptr %a, i32 -1
  %a3 = getelementptr inbounds double, ptr %a, i32 255
  %a4 = getelementptr inbounds double, ptr %a, i32 256
  %a5 = getelementptr inbounds double, ptr %a, i32 -256
  %a6 = getelementptr inbounds double, ptr %a, i32 -257
  %ai = getelementptr inbounds double, ptr %a, i32 %i
  ret void
}

define void @testvecs(i32 %i) {
; RVI-LABEL: 'testvecs'
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %b0 = getelementptr inbounds <4 x i8>, ptr undef, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %b1 = getelementptr inbounds <4 x i16>, ptr undef, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %b2 = getelementptr inbounds <4 x i32>, ptr undef, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %b3 = getelementptr inbounds <4 x i64>, ptr undef, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %b4 = getelementptr inbounds <4 x float>, ptr undef, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %b5 = getelementptr inbounds <4 x double>, ptr undef, i32 1
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %c1 = getelementptr inbounds <4 x i8>, ptr undef, i32 128
; RVI-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %c2 = getelementptr inbounds <4 x i16>, ptr undef, i32 128
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %c3 = getelementptr inbounds <4 x i32>, ptr undef, i32 128
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %c4 = getelementptr inbounds <4 x i64>, ptr undef, i32 128
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %c5 = getelementptr inbounds <4 x float>, ptr undef, i32 128
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %c6 = getelementptr inbounds <4 x double>, ptr undef, i32 128
; RVI-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;

  %b0 = getelementptr inbounds <4 x i8>, ptr undef, i32 1
  %b1 = getelementptr inbounds <4 x i16>, ptr undef, i32 1
  %b2 = getelementptr inbounds <4 x i32>, ptr undef, i32 1
  %b3 = getelementptr inbounds <4 x i64>, ptr undef, i32 1
  %b4 = getelementptr inbounds <4 x float>, ptr undef, i32 1
  %b5 = getelementptr inbounds <4 x double>, ptr undef, i32 1

  %c1 = getelementptr inbounds <4 x i8>, ptr undef, i32 128
  %c2 = getelementptr inbounds <4 x i16>, ptr undef, i32 128
  %c3 = getelementptr inbounds <4 x i32>, ptr undef, i32 128
  %c4 = getelementptr inbounds <4 x i64>, ptr undef, i32 128
  %c5 = getelementptr inbounds <4 x float>, ptr undef, i32 128
  %c6 = getelementptr inbounds <4 x double>, ptr undef, i32 128

  ret void
}
