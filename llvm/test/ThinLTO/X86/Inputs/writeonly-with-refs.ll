; ModuleID = 'foo.o'
source_filename = "foo.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32 }
%struct.Q = type { ptr }

@_ZL3Obj = internal constant %struct.S { i32 42 }, align 4
@outer = dso_local local_unnamed_addr global %struct.Q { ptr @_ZL3Obj }, align 8

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @_Z3foov() local_unnamed_addr {
entry:
  store ptr null, ptr @outer, align 8
  ret void
}
