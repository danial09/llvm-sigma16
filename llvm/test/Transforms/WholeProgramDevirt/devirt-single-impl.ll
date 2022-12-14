; -stats requires asserts
; REQUIRES: asserts

; RUN: opt -S -passes=wholeprogramdevirt -whole-program-visibility -pass-remarks=wholeprogramdevirt -stats %s 2>&1 | FileCheck %s

target datalayout = "e-p:64:64"
target triple = "x86_64-unknown-linux-gnu"

; CHECK: remark: devirt-single.cc:30:32: single-impl: devirtualized a call to vf
; CHECK: remark: devirt-single.cc:13:0: devirtualized vf
; CHECK-NOT: devirtualized

@vt1 = constant [1 x ptr] [ptr @vf], !type !8
@vt2 = constant [1 x ptr] [ptr @vf], !type !8

define void @vf(ptr %this) #0 !dbg !7 {
  ret void
}

; CHECK: define void @call
define void @call(ptr %obj) #1 !dbg !5 {
  %vtable = load ptr, ptr %obj
  %p = call i1 @llvm.type.test(ptr %vtable, metadata !"typeid")
  call void @llvm.assume(i1 %p)
  %fptr = load ptr, ptr %vtable
  ; CHECK: call void @vf(
  call void %fptr(ptr %obj), !dbg !6
  ret void
}

declare i1 @llvm.type.test(ptr, metadata)
declare void @llvm.assume(i1)

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}
!llvm.ident = !{!4}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (trunk 278098)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "devirt-single.cc", directory: ".")
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{!"clang version 4.0.0 (trunk 278098)"}
!5 = distinct !DISubprogram(name: "call", linkageName: "_Z4callPv", scope: !1, file: !1, line: 29, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, unit: !0)
!6 = !DILocation(line: 30, column: 32, scope: !5)
!7 = distinct !DISubprogram(name: "vf", linkageName: "_ZN3vt12vfEv", scope: !1, file: !1, line: 13, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, unit: !0)
!8 = !{i32 0, !"typeid"}

; CHECK: 1 wholeprogramdevirt - Number of whole program devirtualization targets
; CHECK: 1 wholeprogramdevirt - Number of single implementation devirtualizations
