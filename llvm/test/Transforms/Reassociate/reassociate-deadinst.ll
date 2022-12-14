; RUN: opt < %s -passes=inline,function-attrs,reassociate -S | FileCheck %s

; CHECK-LABEL: main
; CHECK-NEXT: ret void

define internal i16 @func1() noinline #0 {
  ret i16 0
}

define void @main(i16 %argc, ptr %argv) #0 {
  %_tmp0 = call i16 @func1()
  %_tmp2 = zext i16 %_tmp0 to i32
  ret void
}
attributes #0 = { minsize nounwind optsize }
