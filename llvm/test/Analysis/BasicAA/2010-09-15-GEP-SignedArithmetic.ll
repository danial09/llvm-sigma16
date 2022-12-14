; RUN: opt < %s -aa-pipeline=basic-aa -passes=aa-eval -print-all-alias-modref-info -disable-output 2>&1 | FileCheck %s
; PR7959

target datalayout = "e-p:32:32:32"

; CHECK: 1 may alias responses

define i32 @test(ptr %tab, i32 %indvar) nounwind {
  %tmp31 = mul i32 %indvar, -2
  %tmp32 = add i32 %tmp31, 30
  %t.5 = getelementptr i32, ptr %tab, i32 %tmp32
  %loada = load i32, ptr %tab
  store i32 0, ptr %t.5
  %loadb = load i32, ptr %tab
  %rval = add i32 %loada, %loadb
  ret i32 %rval
}
