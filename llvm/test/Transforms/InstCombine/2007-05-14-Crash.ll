; RUN: opt < %s -passes=instcombine -disable-output

target datalayout = "E-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64"
target triple = "powerpc-unknown-linux-gnu"

%struct.abc = type { i32, [32 x i8] }        
%struct.def = type { ptr, %struct.abc }        
        %struct.anon = type <{  }>

define ptr @foo(ptr %deviceRef, ptr %pCap) {
entry:
        %tmp3 = getelementptr %struct.def, ptr %deviceRef, i32 0, i32 1               
        ret ptr %tmp3
}


