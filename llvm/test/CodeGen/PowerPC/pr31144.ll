; RUN: llc -mtriple=powerpc64le-unknown-linux-gnu -mcpu=pwr8 -mattr=+vsx < %s | FileCheck %s --implicit-check-not lxsiwzx

declare void @bar(double)

define void @foo1(ptr %p) {
entry:
  %0 = load i8, ptr %p, align 1
  %conv = uitofp i8 %0 to double
  call void @bar(double %conv)
  ret void

; CHECK-LABEL: @foo1
; CHECK:     mtfprwz
}

define void @foo2(ptr %p) {
entry:
  %0 = load i16, ptr %p, align 2
  %conv = uitofp i16 %0 to double
  call void @bar(double %conv)
  ret void

; CHECK-LABEL: @foo2
; CHECK:       mtfprwz
}

