; NOTE: This test ensures that, for both Big and Little Endian cases, a set of
; NOTE: 4 floats is gathered into a v4f32 register using xxmrghw and xxmrgld
; RUN: llc -verify-machineinstrs -mcpu=pwr9 -ppc-vsr-nums-as-vr \
; RUN: -ppc-asm-full-reg-names -mtriple=powerpc64le-unknown-linux-gnu < %s \
; RUN: | FileCheck %s -check-prefix=CHECK-LE
; RUN: llc -verify-machineinstrs -mcpu=pwr9 -ppc-vsr-nums-as-vr \
; RUN: -ppc-asm-full-reg-names -mtriple=powerpc64-unknown-linux-gnu < %s \
; RUN: | FileCheck %s -check-prefix=CHECK-BE
; RUN: llc -verify-machineinstrs -mcpu=pwr9 -ppc-vsr-nums-as-vr \
; RUN: -ppc-asm-full-reg-names -mtriple=powerpc64-ibm-aix-xcoff < %s \
; RUN: | FileCheck %s -check-prefix=CHECK-BE
; RUN: llc -verify-machineinstrs -mcpu=pwr9 -ppc-vsr-nums-as-vr \
; RUN: -ppc-asm-full-reg-names -mtriple=powerpc-ibm-aix-xcoff < %s \
; RUN: | FileCheck %s -check-prefix=CHECK-BE-AIX-32
define dso_local <4 x float> @vector_gatherf(ptr nocapture readonly %a,
ptr nocapture readonly %b, ptr nocapture readonly %c,
ptr nocapture readonly %d) {
; C code from which this IR test case was generated:
; vector float test(ptr a, ptr b, ptr c, ptr d) {
;  return (vector float) { *a, *b, *c, *d };
; }
; CHECK-LE-LABEL: vector_gatherf:
; CHECK-LE:       # %bb.0: # %entry
; CHECK-LE-DAG:    lfiwzx f[[REG0:[0-9]+]], 0, r6
; CHECK-LE-DAG:    lfiwzx f[[REG1:[0-9]+]], 0, r5
; CHECK-LE-DAG:    lfiwzx f[[REG2:[0-9]+]], 0, r4
; CHECK-LE-DAG:    lfiwzx f[[REG3:[0-9]+]], 0, r3
; CHECK-LE-DAG:    xxmrghw vs[[REG0]], vs[[REG0]], vs[[REG1]]
; CHECK-LE-DAG:    xxmrghw vs[[REG4:[0-9]+]], vs[[REG2]], vs[[REG3]]
; CHECK-LE-NEXT:   xxmrgld v[[REG:[0-9]+]], vs[[REG0]], vs[[REG4]]
; CHECK-LE-NEXT:   blr

; CHECK-BE-LABEL: vector_gatherf:
; CHECK-BE:       # %bb.0: # %entry
; CHECK-BE-DAG:    lfiwzx f[[REG0:[0-9]+]], 0, r3
; CHECK-BE-DAG:    lfiwzx f[[REG1:[0-9]+]], 0, r4
; CHECK-BE-DAG:    lfiwzx f[[REG2:[0-9]+]], 0, r5
; CHECK-BE-DAG:    lfiwzx f[[REG3:[0-9]+]], 0, r6
; CHECK-BE-DAG:    xxmrghw vs[[REG0]], vs[[REG0]], vs[[REG1]]
; CHECK-BE-DAG:    xxmrghw vs[[REG4:[0-9]+]], vs[[REG2]], vs[[REG3]]
; CHECK-BE-NEXT:   xxmrgld v[[REG:[0-9]+]], vs[[REG0]], vs[[REG4]]
; CHECK-BE-NEXT:   blr

; CHECK-BE-AIX-32-LABEL: vector_gatherf:
; CHECK-BE-AIX-32-LABEL: # %bb.0: # %entry
; CHECK-BE-AIX-32-DAG: lxsiwzx v[[REG0:[0-9]+]]
; CHECK-BE-AIX-32-DAG: lxsiwzx v[[REG1:[0-9]+]]
; CHECK-BE-AIX-32-DAG: lxsiwzx v[[REG2:[0-9]+]]
; CHECK-BE-AIX-32-DAG: lxsiwzx v[[REG3:[0-9]+]]
; CHECK-BE-AIX-32-DAG: vmrgow v[[REG0]], v[[REG1]], v[[REG0]]
; CHECK-BE-AIX-32-DAG: vmrgow v[[REG3]], v[[REG2]], v[[REG3]]
; CHECK-BE-AIX-32-NEXT: xxmrghd v[[REG0]], v[[REG3]], v[[REG0]]
; CHECK-BE-AIX-32-NEXT: blr
entry:
  %0 = load float, ptr %a, align 4
  %vecinit = insertelement <4 x float> undef, float %0, i32 0
  %1 = load float, ptr %b, align 4
  %vecinit1 = insertelement <4 x float> %vecinit, float %1, i32 1
  %2 = load float, ptr %c, align 4
  %vecinit2 = insertelement <4 x float> %vecinit1, float %2, i32 2
  %3 = load float, ptr %d, align 4
  %vecinit3 = insertelement <4 x float> %vecinit2, float %3, i32 3
  ret <4 x float> %vecinit3
}

