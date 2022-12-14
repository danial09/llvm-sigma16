; RUN: llc -verify-machineinstrs -O0 < %s | FileCheck %s

target datalayout = "E-m:e-i64:64-n32:64"
target triple = "powerpc64-unknown-linux-gnu"

@_ZTV3foo = linkonce_odr unnamed_addr constant [1 x ptr] [ptr @__cxa_pure_virtual]
declare void @__cxa_pure_virtual()

; CHECK: .section .data.rel.ro
; CHECK: .quad __cxa_pure_virtual

